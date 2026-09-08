# Database Architecture

Status: Task 2 deliverable. Reconciles two statements in the architecture deck (`Accounting_Software_Architecture_Redesign_Final.pptx`) that look contradictory at first read:

- Slide 2 / Slide 7: **"One SQLite file per business"** — per-business isolation, no business sees another's data.
- Slide 11: **"Shared core tables (users, businesses, accounts, audit trail)"**.

Both are true at once because they describe two different databases. This doc specifies both.

## Two-tier layout

```
AppData/AccountingSoftware/
  core.db                     <- app_core database (see below)
  businesses/
    biz_mainoffice.db         <- one SQLite file per business
    biz_citycafe.db
    biz_riversidecafe.db
    biz_corptrading.db
  backups/
    <timestamp>_core.db.enc
    <timestamp>_biz_mainoffice.db.enc
```

- **`core.db`** — one file for the whole installation. Holds the business registry, the user directory, role/permission assignments, first-run setup choice, and cross-cutting settings. This is what lets one login list users "24 Active Users" across all 4 businesses on the Security & Admin screen, and what the Multi-Branch/Company screen reads to list all 4 businesses before any one of them is opened.
- **`biz_<id>.db`** — one per business. Holds everything that screen confirms must be isolated: chart of accounts, ledger, invoices, payroll, inventory, assets, calendar. Opened only when that business is the active context (the business selector in the top bar). This is the file that switches (`sqlite3.wasm`+OPFS on web / the encrypted local file on native) when the user switches businesses.

Both files are opened through the same encrypted-SQLite connection (SQLCipher key derived from the local master password, per the tech-stack deck). A business file can be zipped and moved between machines independently — e.g. handing "Riverside Café" to a new laptop — without touching any other business's data, which is the concrete requirement the mockup's "Independent & Isolated Businesses" panel is describing.

Every table below uses a **TEXT UUID primary key**, not an autoincrement integer. Reasoning: the architecture deck explicitly reserves an "isolated sync module" and an "append-only transaction log" as a future, optional add-on (Slide 5/7). Autoincrement ids collide the moment two offline devices' data ever needs merging; UUIDs generated client-side don't. This costs a little index size now to avoid a schema migration later if sync is confirmed.

All money fields are `INTEGER` storing minor units (paise), never `REAL` — SQLite's `REAL` is a float and silently drifts on repeated arithmetic, which is unacceptable for a ledger. The UI layer divides by 100 for display and formats with the ₹ symbol.

---

## `core.db`

### `businesses`
One row per business shown on the Multi-Branch/Company screen.

| Column | Type | Notes |
|---|---|---|
| id | TEXT PK | UUID |
| name | TEXT | "Main Office", "City Café"... |
| business_type | TEXT | "Service & Administration", "Food & Beverage", "Trading" |
| location | TEXT | "Kochi, Kerala, India" |
| is_head_office | INTEGER | bool |
| status | TEXT | active / inactive / archived |
| db_filename | TEXT | e.g. `biz_mainoffice.db` — resolves to the per-business file |
| fiscal_year_label | TEXT | "2024-2025" |
| fiscal_year_start_month | INTEGER | 1-12, for FY roll-over logic |
| currency_code | TEXT | default `INR` |
| created_at | TEXT (ISO 8601) | |
| last_activity_at | TEXT (ISO 8601) | updated on any write to that business's db |

### `users`
Installation-wide login directory (the Sign In screen authenticates against this table, not a per-business one).

| Column | Type | Notes |
|---|---|---|
| id | TEXT PK | UUID |
| username | TEXT UNIQUE | |
| email | TEXT | |
| password_hash | TEXT | Argon2id, never plaintext |
| full_name | TEXT | |
| is_super_admin | INTEGER | bool — can see/manage all businesses |
| status | TEXT | active / inactive |
| last_login_at | TEXT | |
| created_at | TEXT | |

### `roles`
Fixed lookup, seeded once: `Administrator`, `Director`, `Manager`, `Accountant`, `Staff` (exactly the columns on the Permissions Matrix screen).

| Column | Type |
|---|---|
| id | TEXT PK |
| name | TEXT UNIQUE |

### `user_business_roles`
The join table behind the Users & Roles table (a user's row shows one Business + one Role, but the schema allows a user to hold different roles in different businesses — e.g. an accountant who also does books for a second café).

| Column | Type | Notes |
|---|---|---|
| id | TEXT PK | UUID |
| user_id | TEXT FK → users.id | |
| business_id | TEXT FK → businesses.id | |
| role_id | TEXT FK → roles.id | |
| access_level | TEXT | "Full Access" / "High Access" / "Medium Access" / "Limited Access" / "Finance Access" — the label shown in the Users table; derived from role + module grants but stored denormalized since the mockup displays it directly |
| status | TEXT | active / inactive |

### `permissions_matrix`
Backs the module × role grid on the Security & Admin screen.

| Column | Type | Notes |
|---|---|---|
| id | TEXT PK | |
| role_id | TEXT FK → roles.id | |
| module | TEXT | Finance / Payroll / Assets / Inventory / Reports / Administration |
| access | TEXT | full / view_limited / none |

### `access_requests`
The "Recent Access Requests" panel.

| Column | Type |
|---|---|
| id | TEXT PK |
| user_id | TEXT FK → users.id |
| requested_by_user_id | TEXT FK → users.id |
| business_id | TEXT FK → businesses.id |
| access_change_description | TEXT |
| status | TEXT — pending / approved / rejected |
| requested_at | TEXT |
| resolved_at | TEXT NULL |

### `app_settings`
Single-row key/value table for the First-Run Setup answer and related installation config.

| Column | Type | Notes |
|---|---|---|
| key | TEXT PK | `setup_mode`, `lan_host_device_id`, `cloud_sync_enabled`, `master_password_hash`, `recovery_key_hint` |
| value | TEXT | `setup_mode` ∈ {`this_device_only`, `lan`, `cloud_sync`} |

### `backup_log`
The Backup & Restore panel. `business_id` NULL means a full-installation backup (core + every business file).

| Column | Type |
|---|---|
| id | TEXT PK |
| business_id | TEXT FK → businesses.id, NULL |
| started_at | TEXT |
| status | TEXT — success / failed / in_progress |
| location_path | TEXT |
| size_bytes | INTEGER |
| backup_type | TEXT — full / incremental |

### `notifications`
Cross-business "Recent Notifications" feed on the Dashboard.

| Column | Type |
|---|---|
| id | TEXT PK |
| business_id | TEXT FK → businesses.id |
| severity | TEXT — info / warning / critical |
| message | TEXT |
| module | TEXT |
| created_at | TEXT |
| read_at | TEXT NULL |

---

## `biz_<id>.db` — identical schema, one instance per business

### Accounts & Finance

**`chart_of_accounts`** — id, code, name, account_type (`asset`/`liability`/`equity`/`income`/`expense`), parent_account_id (self-FK for sub-accounts), is_active.

**`journal_entries`** — id, entry_date, reference_no, description, status (`draft`/`posted`), created_by_user_id, total_debit, total_credit.
**`journal_lines`** — id, journal_entry_id FK, account_id FK → chart_of_accounts, debit, credit, memo. (Standard double-entry: every `journal_entries` row must balance across its `journal_lines`, enforced in application code before `status` can become `posted`.)

**`bank_accounts`** — id, account_name, account_number, bank_name, opening_balance, current_balance (kept denormalized for dashboard speed, reconciled against journal_lines).

**`bank_reconciliations`** — id, bank_account_id FK, statement_date, statement_balance, reconciled_balance, status (`pending`/`reconciled`). Backs the Reports screen's "Bank Reconciliation Report" — a point-in-time record that isn't recoverable from `bank_accounts` + `journal_lines` alone.

**`invoices`** — id, invoice_no, customer_name, invoice_date, due_date, subtotal, tax_amount, total, status (default `pending`).
**`invoice_line_items`** — id, invoice_id FK, description, quantity, unit_price, tax_rate, line_total.

**`transactions`** — id, txn_date, description, category, account_id FK, amount, direction (`debit`/`credit`), status (`completed`/`pending`), source_module, source_id. This is the table the Dashboard's "Recent Transactions" and the Reports Income & Expense report both read — every other module (payroll run, inventory purchase, invoice payment) writes one row here so there is a single ledger view, rather than the dashboard having to union five tables live.

**`budgets`** — id, category, fiscal_year, period_month, budgeted_amount, actual_amount (recomputed from `transactions`).

### Payroll & Staff

**`employees`** — id, employee_code, full_name, department, role_title, basic_salary, employment_status (`permanent`/`contractual`), joined_date, contact_phone, contact_email.

**`attendance`** — id, employee_id FK, date, status (`present`/`absent`/`late`/`on_leave`), check_in_time, check_out_time, late_minutes.

**`leave_requests`** — id, employee_id FK, leave_type, from_date, to_date, days, status (`pending`/`approved`/`rejected`), reason.

**`leave_balances`** — id, employee_id FK, leave_type, fiscal_year, balance_days.

**`payroll_runs`** — id, period_month, period_year, status, gross_payroll, allowances, overtime, deductions, net_pay, generated_at.
**`payroll_items`** — id, payroll_run_id FK, employee_id FK, basic_salary, allowances, overtime, deductions, net_pay. (`payroll_runs` totals are the sum of its `payroll_items` — stored, not just computed, so a closed month's numbers never shift under a later edit.)

**`employment_contracts`** — id, employee_id FK, position, contract_type, start_date, expiry_date, status (`active`/`expires_soon`/`expired`).

### Asset & Valuation

**`assets`** — id, asset_code, name, category, purchase_date, purchase_cost, depreciation_method (`straight_line`/`declining_balance`), useful_life_years, salvage_value, status.

**`asset_depreciation_schedule`** — id, asset_id FK, period_month, period_year, depreciation_amount, accumulated_depreciation, book_value.

**`asset_valuations`** — id, asset_id FK, valuation_date, valuation_amount, valuer_name, notes.

### Inventory Management

**`inventory_items`** — id, item_code, item_name, category, unit, unit_cost, quantity_on_hand, minimum_level. ("Low Stock" and "Critical" badges are computed at query time: `quantity_on_hand <= minimum_level` = low, `< minimum_level * 0.5` = critical — not stored, since they'd go stale the moment stock moves.)

**`inventory_purchases`** — id, item_id FK, supplier_name, purchase_date, quantity, unit_cost, total_cost, status (`received`/`pending`). Posting one of these also inserts a `transactions` row (see above) so Accounts & Finance sees it without duplicating the write in two places by hand — done in one service-layer function, not two separate UI actions.

**`inventory_adjustments`** — id, item_id FK, adjustment_date, adjustment_type (`addition`/`deduction`/`correction`), quantity_delta, reason, user_id FK → core `users.id`.

### Event & Calendar

**`meeting_rooms`** — id, room_name, capacity, status.

**`calendar_events`** — id, title, event_type (`management`/`finance`/`staff`/`board`), event_date, start_time, end_time, room_id FK, description, created_by_user_id, attendee_count.

**`room_bookings`** — id, room_id FK, event_id FK, booked_from, booked_to, status (`reserved`/`available`).

### Reports

**`report_templates`** — id, name, report_type, filters_json, created_by_user_id, is_scheduled.

**`generated_reports`** — id, template_id FK NULL, report_name, report_type, date_from, date_to, format (`pdf`/`excel`), generated_at, file_path, status. (This is metadata only — the actual PDF/XLSX bytes live on disk at `file_path`; the database never stores binary blobs, which would bloat the encrypted file and slow every backup.)

### Audit

**`audit_log`** — id, occurred_at, user_id FK → core `users.id`, user_name, action, module, status, details_json. Scoped per business (matches the mockup: the Activity Log on the Security & Admin screen has no Business column because it's implicitly the currently-selected business's log). `user_name` is a denormalized snapshot of the username at write time — fixes the cross-file reference gap below by keeping the row self-contained; every write path must resolve and pass it alongside `user_id`, never look it up later.

---

## Why this shape, and what was rejected

**Why not one single database for everything.** The mockup is explicit — "Data is completely separate and isolated between businesses," "Separate Database: Each business has independent data storage" — and a single shared file with a `business_id` column on every table would satisfy the letter of that but not the spirit: a bug in a query's `WHERE business_id = ?` clause becomes a cross-business data leak instead of a structural impossibility. A wrong file handle can't leak; a wrong query can.

**Why not one database per business with zero shared state either.** Login, the Multi-Branch switcher, and the cross-business Users & Roles screen all need to enumerate businesses and users *before* a specific business's file is even chosen — that has to live somewhere that isn't inside any one business's file.

**Why UUID keys over autoincrement integers.** Costs slightly more storage; buys the option to add the "isolated sync module" from Slide 5 later without a primary-key migration across every table.

**Why a denormalized `transactions` table instead of reporting off five module tables directly.** The Dashboard and Reports screens both need one chronological, filterable feed spanning sales, purchases, payroll and manual entries. Recomputing that with five live joins on every dashboard load doesn't scale past a few thousand rows on a laptop-class SQLite install; writing one extra row at the point of sale/purchase/payroll-run does.

**Why no binary data in SQLite.** Generated PDFs/XLSX exports are filesystem artifacts referenced by path, not `BLOB` columns — keeps the encrypted database small enough that "Backup Now" stays fast and the file stays easy to move between machines.
