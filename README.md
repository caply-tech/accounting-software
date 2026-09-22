# Accounting Management Software

Offline-first, multi-business accounting software. Built in Flutter (Dart) so the same codebase targets Android, iOS, Windows, macOS, Linux and Web — see `docs/` for the reasoning behind every technology choice and the database design.

## Status

Implements the 8 screens from `Accounting_Software_Mock_design.pdf` (Login, Dashboard, Multi-Branch/Company, Payroll & Staff, Inventory Management, Event & Calendar, Reports, Security & Admin) plus two modules referenced in the sidebar but not detailed in that mockup (Accounts & Finance, Asset & Valuation — see their module docs for what's provisional about them). Each screen is backed by a real local SQLite database (via `drift`) and seeded with the same sample data shown in the mock design, not static placeholders.

## Running it

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome      # or: flutter run  (native desktop/mobile)
```

## Building a Windows installer

```bash
flutter build windows --release
```

produces `build\windows\x64\runner\Release\` — a real installer around that build is `installer\windows.iss` (Inno Setup, free: https://jrsoftware.org/isdl.php). Open it in Inno Setup and click Compile, or from a command line with Inno Setup on PATH: `iscc installer\windows.iss`. Output lands in `installer\output\`. Bump `MyAppVersion` in that script to match `pubspec.yaml`'s `version:` before cutting a release — Inno Setup doesn't read pubspec.yaml itself.

## Structure

```
lib/
  shared/       # db (core + per-business schema), theme, shared widgets, app-wide state
  modules/      # one folder per sidebar module — dashboard, accounts_finance,
                # multi_branch, payroll_staff, asset_valuation, inventory,
                # calendar, reports, security_admin, auth
docs/
  database-architecture.md   # full schema + rationale (Task 2 deliverable)
  modules/*.md                # what each module does, connects to, and why
```

## Key architectural decisions

See `docs/database-architecture.md` for the full reasoning. In short:

- **Two databases**: one `core.db` for the installation-wide user/business directory, one SQLite file per business for its isolated financial data — both are true statements from the architecture deck at once.
- **Money as integer paise**, never `REAL` — avoids float drift in a ledger.
- **UUID primary keys**, not autoincrement — leaves room for the optional future sync module without a schema migration.
- **One `transactions` table** every module posts to, so the Dashboard and Reports never disagree with a module's own numbers.

## Login

Real authentication: passwords are bcrypt-hashed and actually verified (previously the login screen accepted any password for a known username — fixed). Seed accounts' initial passwords are `<username>@2025` (e.g. `admin@2025`, `director@2025` — see the full username list in `lib/shared/db/seed_data.dart`). **Change every one of these before a client uses the app** — there is no in-app password-reset flow yet, so change requests currently mean editing the database directly.

## What's not finished yet

- SQLCipher encryption-at-rest is specified and reserved for in the schema, not yet wired into the native database connection — every `.db` file is currently plain, unencrypted SQLite.
- No in-app password change / reset flow yet.
- Two modules (Accounts & Finance, Asset & Valuation) are built to the app's visual language pending a confirmed mockup.
- The Calendar screen is a chronological list rather than the mock's month grid (same underlying data).
- Payroll and Inventory postings don't yet write to the shared `transactions` ledger, so their totals don't yet flow into the Dashboard/Reports.
- Every business starts pre-loaded with the mock design's demo data (Global Traders Pvt Ltd, sample employees/invoices) rather than a real empty first-run state.

These are called out individually in their module docs under `docs/modules/`. None of the above are blockers for reviewing the app — they matter before a real client relies on it for real financial data.
