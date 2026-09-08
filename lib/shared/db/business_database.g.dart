// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_database.dart';

// ignore_for_file: type=lint
class $ChartOfAccountsTable extends ChartOfAccounts
    with TableInfo<$ChartOfAccountsTable, ChartOfAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChartOfAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentAccountIdMeta =
      const VerificationMeta('parentAccountId');
  @override
  late final GeneratedColumn<String> parentAccountId = GeneratedColumn<String>(
      'parent_account_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, code, name, accountType, parentAccountId, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chart_of_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<ChartOfAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    } else if (isInserting) {
      context.missing(_accountTypeMeta);
    }
    if (data.containsKey('parent_account_id')) {
      context.handle(
          _parentAccountIdMeta,
          parentAccountId.isAcceptableOrUnknown(
              data['parent_account_id']!, _parentAccountIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChartOfAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChartOfAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type'])!,
      parentAccountId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}parent_account_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $ChartOfAccountsTable createAlias(String alias) {
    return $ChartOfAccountsTable(attachedDatabase, alias);
  }
}

class ChartOfAccount extends DataClass implements Insertable<ChartOfAccount> {
  final String id;
  final String code;
  final String name;
  final String accountType;
  final String? parentAccountId;
  final bool isActive;
  const ChartOfAccount(
      {required this.id,
      required this.code,
      required this.name,
      required this.accountType,
      this.parentAccountId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['account_type'] = Variable<String>(accountType);
    if (!nullToAbsent || parentAccountId != null) {
      map['parent_account_id'] = Variable<String>(parentAccountId);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ChartOfAccountsCompanion toCompanion(bool nullToAbsent) {
    return ChartOfAccountsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      accountType: Value(accountType),
      parentAccountId: parentAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentAccountId),
      isActive: Value(isActive),
    );
  }

  factory ChartOfAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChartOfAccount(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      accountType: serializer.fromJson<String>(json['accountType']),
      parentAccountId: serializer.fromJson<String?>(json['parentAccountId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'accountType': serializer.toJson<String>(accountType),
      'parentAccountId': serializer.toJson<String?>(parentAccountId),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  ChartOfAccount copyWith(
          {String? id,
          String? code,
          String? name,
          String? accountType,
          Value<String?> parentAccountId = const Value.absent(),
          bool? isActive}) =>
      ChartOfAccount(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        accountType: accountType ?? this.accountType,
        parentAccountId: parentAccountId.present
            ? parentAccountId.value
            : this.parentAccountId,
        isActive: isActive ?? this.isActive,
      );
  ChartOfAccount copyWithCompanion(ChartOfAccountsCompanion data) {
    return ChartOfAccount(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      accountType:
          data.accountType.present ? data.accountType.value : this.accountType,
      parentAccountId: data.parentAccountId.present
          ? data.parentAccountId.value
          : this.parentAccountId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChartOfAccount(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('accountType: $accountType, ')
          ..write('parentAccountId: $parentAccountId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, name, accountType, parentAccountId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChartOfAccount &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.accountType == this.accountType &&
          other.parentAccountId == this.parentAccountId &&
          other.isActive == this.isActive);
}

class ChartOfAccountsCompanion extends UpdateCompanion<ChartOfAccount> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> accountType;
  final Value<String?> parentAccountId;
  final Value<bool> isActive;
  final Value<int> rowid;
  const ChartOfAccountsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.accountType = const Value.absent(),
    this.parentAccountId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChartOfAccountsCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String accountType,
    this.parentAccountId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        code = Value(code),
        name = Value(name),
        accountType = Value(accountType);
  static Insertable<ChartOfAccount> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? accountType,
    Expression<String>? parentAccountId,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (accountType != null) 'account_type': accountType,
      if (parentAccountId != null) 'parent_account_id': parentAccountId,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChartOfAccountsCompanion copyWith(
      {Value<String>? id,
      Value<String>? code,
      Value<String>? name,
      Value<String>? accountType,
      Value<String?>? parentAccountId,
      Value<bool>? isActive,
      Value<int>? rowid}) {
    return ChartOfAccountsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      accountType: accountType ?? this.accountType,
      parentAccountId: parentAccountId ?? this.parentAccountId,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (parentAccountId.present) {
      map['parent_account_id'] = Variable<String>(parentAccountId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChartOfAccountsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('accountType: $accountType, ')
          ..write('parentAccountId: $parentAccountId, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entryDateMeta =
      const VerificationMeta('entryDate');
  @override
  late final GeneratedColumn<DateTime> entryDate = GeneratedColumn<DateTime>(
      'entry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _referenceNoMeta =
      const VerificationMeta('referenceNo');
  @override
  late final GeneratedColumn<String> referenceNo = GeneratedColumn<String>(
      'reference_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _createdByUserIdMeta =
      const VerificationMeta('createdByUserId');
  @override
  late final GeneratedColumn<String> createdByUserId = GeneratedColumn<String>(
      'created_by_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalDebitMeta =
      const VerificationMeta('totalDebit');
  @override
  late final GeneratedColumn<int> totalDebit = GeneratedColumn<int>(
      'total_debit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalCreditMeta =
      const VerificationMeta('totalCredit');
  @override
  late final GeneratedColumn<int> totalCredit = GeneratedColumn<int>(
      'total_credit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entryDate,
        referenceNo,
        description,
        status,
        createdByUserId,
        totalDebit,
        totalCredit
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<JournalEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entry_date')) {
      context.handle(_entryDateMeta,
          entryDate.isAcceptableOrUnknown(data['entry_date']!, _entryDateMeta));
    } else if (isInserting) {
      context.missing(_entryDateMeta);
    }
    if (data.containsKey('reference_no')) {
      context.handle(
          _referenceNoMeta,
          referenceNo.isAcceptableOrUnknown(
              data['reference_no']!, _referenceNoMeta));
    } else if (isInserting) {
      context.missing(_referenceNoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_by_user_id')) {
      context.handle(
          _createdByUserIdMeta,
          createdByUserId.isAcceptableOrUnknown(
              data['created_by_user_id']!, _createdByUserIdMeta));
    } else if (isInserting) {
      context.missing(_createdByUserIdMeta);
    }
    if (data.containsKey('total_debit')) {
      context.handle(
          _totalDebitMeta,
          totalDebit.isAcceptableOrUnknown(
              data['total_debit']!, _totalDebitMeta));
    } else if (isInserting) {
      context.missing(_totalDebitMeta);
    }
    if (data.containsKey('total_credit')) {
      context.handle(
          _totalCreditMeta,
          totalCredit.isAcceptableOrUnknown(
              data['total_credit']!, _totalCreditMeta));
    } else if (isInserting) {
      context.missing(_totalCreditMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      entryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}entry_date'])!,
      referenceNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_no'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdByUserId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_user_id'])!,
      totalDebit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_debit'])!,
      totalCredit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_credit'])!,
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntry extends DataClass implements Insertable<JournalEntry> {
  final String id;
  final DateTime entryDate;
  final String referenceNo;
  final String description;
  final String status;
  final String createdByUserId;
  final int totalDebit;
  final int totalCredit;
  const JournalEntry(
      {required this.id,
      required this.entryDate,
      required this.referenceNo,
      required this.description,
      required this.status,
      required this.createdByUserId,
      required this.totalDebit,
      required this.totalCredit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entry_date'] = Variable<DateTime>(entryDate);
    map['reference_no'] = Variable<String>(referenceNo);
    map['description'] = Variable<String>(description);
    map['status'] = Variable<String>(status);
    map['created_by_user_id'] = Variable<String>(createdByUserId);
    map['total_debit'] = Variable<int>(totalDebit);
    map['total_credit'] = Variable<int>(totalCredit);
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      entryDate: Value(entryDate),
      referenceNo: Value(referenceNo),
      description: Value(description),
      status: Value(status),
      createdByUserId: Value(createdByUserId),
      totalDebit: Value(totalDebit),
      totalCredit: Value(totalCredit),
    );
  }

  factory JournalEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntry(
      id: serializer.fromJson<String>(json['id']),
      entryDate: serializer.fromJson<DateTime>(json['entryDate']),
      referenceNo: serializer.fromJson<String>(json['referenceNo']),
      description: serializer.fromJson<String>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      createdByUserId: serializer.fromJson<String>(json['createdByUserId']),
      totalDebit: serializer.fromJson<int>(json['totalDebit']),
      totalCredit: serializer.fromJson<int>(json['totalCredit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entryDate': serializer.toJson<DateTime>(entryDate),
      'referenceNo': serializer.toJson<String>(referenceNo),
      'description': serializer.toJson<String>(description),
      'status': serializer.toJson<String>(status),
      'createdByUserId': serializer.toJson<String>(createdByUserId),
      'totalDebit': serializer.toJson<int>(totalDebit),
      'totalCredit': serializer.toJson<int>(totalCredit),
    };
  }

  JournalEntry copyWith(
          {String? id,
          DateTime? entryDate,
          String? referenceNo,
          String? description,
          String? status,
          String? createdByUserId,
          int? totalDebit,
          int? totalCredit}) =>
      JournalEntry(
        id: id ?? this.id,
        entryDate: entryDate ?? this.entryDate,
        referenceNo: referenceNo ?? this.referenceNo,
        description: description ?? this.description,
        status: status ?? this.status,
        createdByUserId: createdByUserId ?? this.createdByUserId,
        totalDebit: totalDebit ?? this.totalDebit,
        totalCredit: totalCredit ?? this.totalCredit,
      );
  JournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntry(
      id: data.id.present ? data.id.value : this.id,
      entryDate: data.entryDate.present ? data.entryDate.value : this.entryDate,
      referenceNo:
          data.referenceNo.present ? data.referenceNo.value : this.referenceNo,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      createdByUserId: data.createdByUserId.present
          ? data.createdByUserId.value
          : this.createdByUserId,
      totalDebit:
          data.totalDebit.present ? data.totalDebit.value : this.totalDebit,
      totalCredit:
          data.totalCredit.present ? data.totalCredit.value : this.totalCredit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntry(')
          ..write('id: $id, ')
          ..write('entryDate: $entryDate, ')
          ..write('referenceNo: $referenceNo, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('totalDebit: $totalDebit, ')
          ..write('totalCredit: $totalCredit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entryDate, referenceNo, description,
      status, createdByUserId, totalDebit, totalCredit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntry &&
          other.id == this.id &&
          other.entryDate == this.entryDate &&
          other.referenceNo == this.referenceNo &&
          other.description == this.description &&
          other.status == this.status &&
          other.createdByUserId == this.createdByUserId &&
          other.totalDebit == this.totalDebit &&
          other.totalCredit == this.totalCredit);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntry> {
  final Value<String> id;
  final Value<DateTime> entryDate;
  final Value<String> referenceNo;
  final Value<String> description;
  final Value<String> status;
  final Value<String> createdByUserId;
  final Value<int> totalDebit;
  final Value<int> totalCredit;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.entryDate = const Value.absent(),
    this.referenceNo = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.createdByUserId = const Value.absent(),
    this.totalDebit = const Value.absent(),
    this.totalCredit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    required DateTime entryDate,
    required String referenceNo,
    required String description,
    this.status = const Value.absent(),
    required String createdByUserId,
    required int totalDebit,
    required int totalCredit,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        entryDate = Value(entryDate),
        referenceNo = Value(referenceNo),
        description = Value(description),
        createdByUserId = Value(createdByUserId),
        totalDebit = Value(totalDebit),
        totalCredit = Value(totalCredit);
  static Insertable<JournalEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? entryDate,
    Expression<String>? referenceNo,
    Expression<String>? description,
    Expression<String>? status,
    Expression<String>? createdByUserId,
    Expression<int>? totalDebit,
    Expression<int>? totalCredit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryDate != null) 'entry_date': entryDate,
      if (referenceNo != null) 'reference_no': referenceNo,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (createdByUserId != null) 'created_by_user_id': createdByUserId,
      if (totalDebit != null) 'total_debit': totalDebit,
      if (totalCredit != null) 'total_credit': totalCredit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? entryDate,
      Value<String>? referenceNo,
      Value<String>? description,
      Value<String>? status,
      Value<String>? createdByUserId,
      Value<int>? totalDebit,
      Value<int>? totalCredit,
      Value<int>? rowid}) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      entryDate: entryDate ?? this.entryDate,
      referenceNo: referenceNo ?? this.referenceNo,
      description: description ?? this.description,
      status: status ?? this.status,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      totalDebit: totalDebit ?? this.totalDebit,
      totalCredit: totalCredit ?? this.totalCredit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entryDate.present) {
      map['entry_date'] = Variable<DateTime>(entryDate.value);
    }
    if (referenceNo.present) {
      map['reference_no'] = Variable<String>(referenceNo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdByUserId.present) {
      map['created_by_user_id'] = Variable<String>(createdByUserId.value);
    }
    if (totalDebit.present) {
      map['total_debit'] = Variable<int>(totalDebit.value);
    }
    if (totalCredit.present) {
      map['total_credit'] = Variable<int>(totalCredit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('entryDate: $entryDate, ')
          ..write('referenceNo: $referenceNo, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('totalDebit: $totalDebit, ')
          ..write('totalCredit: $totalCredit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalLinesTable extends JournalLines
    with TableInfo<$JournalLinesTable, JournalLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _journalEntryIdMeta =
      const VerificationMeta('journalEntryId');
  @override
  late final GeneratedColumn<String> journalEntryId = GeneratedColumn<String>(
      'journal_entry_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
      'account_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _debitMeta = const VerificationMeta('debit');
  @override
  late final GeneratedColumn<int> debit = GeneratedColumn<int>(
      'debit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<int> credit = GeneratedColumn<int>(
      'credit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, journalEntryId, accountId, debit, credit, memo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_lines';
  @override
  VerificationContext validateIntegrity(Insertable<JournalLine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('journal_entry_id')) {
      context.handle(
          _journalEntryIdMeta,
          journalEntryId.isAcceptableOrUnknown(
              data['journal_entry_id']!, _journalEntryIdMeta));
    } else if (isInserting) {
      context.missing(_journalEntryIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('debit')) {
      context.handle(
          _debitMeta, debit.isAcceptableOrUnknown(data['debit']!, _debitMeta));
    }
    if (data.containsKey('credit')) {
      context.handle(_creditMeta,
          credit.isAcceptableOrUnknown(data['credit']!, _creditMeta));
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalLine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      journalEntryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}journal_entry_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id'])!,
      debit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}debit'])!,
      credit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credit'])!,
      memo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}memo']),
    );
  }

  @override
  $JournalLinesTable createAlias(String alias) {
    return $JournalLinesTable(attachedDatabase, alias);
  }
}

class JournalLine extends DataClass implements Insertable<JournalLine> {
  final String id;
  final String journalEntryId;
  final String accountId;
  final int debit;
  final int credit;
  final String? memo;
  const JournalLine(
      {required this.id,
      required this.journalEntryId,
      required this.accountId,
      required this.debit,
      required this.credit,
      this.memo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['journal_entry_id'] = Variable<String>(journalEntryId);
    map['account_id'] = Variable<String>(accountId);
    map['debit'] = Variable<int>(debit);
    map['credit'] = Variable<int>(credit);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    return map;
  }

  JournalLinesCompanion toCompanion(bool nullToAbsent) {
    return JournalLinesCompanion(
      id: Value(id),
      journalEntryId: Value(journalEntryId),
      accountId: Value(accountId),
      debit: Value(debit),
      credit: Value(credit),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
    );
  }

  factory JournalLine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalLine(
      id: serializer.fromJson<String>(json['id']),
      journalEntryId: serializer.fromJson<String>(json['journalEntryId']),
      accountId: serializer.fromJson<String>(json['accountId']),
      debit: serializer.fromJson<int>(json['debit']),
      credit: serializer.fromJson<int>(json['credit']),
      memo: serializer.fromJson<String?>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'journalEntryId': serializer.toJson<String>(journalEntryId),
      'accountId': serializer.toJson<String>(accountId),
      'debit': serializer.toJson<int>(debit),
      'credit': serializer.toJson<int>(credit),
      'memo': serializer.toJson<String?>(memo),
    };
  }

  JournalLine copyWith(
          {String? id,
          String? journalEntryId,
          String? accountId,
          int? debit,
          int? credit,
          Value<String?> memo = const Value.absent()}) =>
      JournalLine(
        id: id ?? this.id,
        journalEntryId: journalEntryId ?? this.journalEntryId,
        accountId: accountId ?? this.accountId,
        debit: debit ?? this.debit,
        credit: credit ?? this.credit,
        memo: memo.present ? memo.value : this.memo,
      );
  JournalLine copyWithCompanion(JournalLinesCompanion data) {
    return JournalLine(
      id: data.id.present ? data.id.value : this.id,
      journalEntryId: data.journalEntryId.present
          ? data.journalEntryId.value
          : this.journalEntryId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      debit: data.debit.present ? data.debit.value : this.debit,
      credit: data.credit.present ? data.credit.value : this.credit,
      memo: data.memo.present ? data.memo.value : this.memo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalLine(')
          ..write('id: $id, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('accountId: $accountId, ')
          ..write('debit: $debit, ')
          ..write('credit: $credit, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, journalEntryId, accountId, debit, credit, memo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalLine &&
          other.id == this.id &&
          other.journalEntryId == this.journalEntryId &&
          other.accountId == this.accountId &&
          other.debit == this.debit &&
          other.credit == this.credit &&
          other.memo == this.memo);
}

class JournalLinesCompanion extends UpdateCompanion<JournalLine> {
  final Value<String> id;
  final Value<String> journalEntryId;
  final Value<String> accountId;
  final Value<int> debit;
  final Value<int> credit;
  final Value<String?> memo;
  final Value<int> rowid;
  const JournalLinesCompanion({
    this.id = const Value.absent(),
    this.journalEntryId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.debit = const Value.absent(),
    this.credit = const Value.absent(),
    this.memo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalLinesCompanion.insert({
    required String id,
    required String journalEntryId,
    required String accountId,
    this.debit = const Value.absent(),
    this.credit = const Value.absent(),
    this.memo = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        journalEntryId = Value(journalEntryId),
        accountId = Value(accountId);
  static Insertable<JournalLine> custom({
    Expression<String>? id,
    Expression<String>? journalEntryId,
    Expression<String>? accountId,
    Expression<int>? debit,
    Expression<int>? credit,
    Expression<String>? memo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (journalEntryId != null) 'journal_entry_id': journalEntryId,
      if (accountId != null) 'account_id': accountId,
      if (debit != null) 'debit': debit,
      if (credit != null) 'credit': credit,
      if (memo != null) 'memo': memo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalLinesCompanion copyWith(
      {Value<String>? id,
      Value<String>? journalEntryId,
      Value<String>? accountId,
      Value<int>? debit,
      Value<int>? credit,
      Value<String?>? memo,
      Value<int>? rowid}) {
    return JournalLinesCompanion(
      id: id ?? this.id,
      journalEntryId: journalEntryId ?? this.journalEntryId,
      accountId: accountId ?? this.accountId,
      debit: debit ?? this.debit,
      credit: credit ?? this.credit,
      memo: memo ?? this.memo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (journalEntryId.present) {
      map['journal_entry_id'] = Variable<String>(journalEntryId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (debit.present) {
      map['debit'] = Variable<int>(debit.value);
    }
    if (credit.present) {
      map['credit'] = Variable<int>(credit.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalLinesCompanion(')
          ..write('id: $id, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('accountId: $accountId, ')
          ..write('debit: $debit, ')
          ..write('credit: $credit, ')
          ..write('memo: $memo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BankAccountsTable extends BankAccounts
    with TableInfo<$BankAccountsTable, BankAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNameMeta =
      const VerificationMeta('accountName');
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
      'account_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
      'account_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentBalanceMeta =
      const VerificationMeta('currentBalance');
  @override
  late final GeneratedColumn<int> currentBalance = GeneratedColumn<int>(
      'current_balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountName,
        accountNumber,
        bankName,
        openingBalance,
        currentBalance
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<BankAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_name')) {
      context.handle(
          _accountNameMeta,
          accountName.isAcceptableOrUnknown(
              data['account_name']!, _accountNameMeta));
    } else if (isInserting) {
      context.missing(_accountNameMeta);
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    } else if (isInserting) {
      context.missing(_accountNumberMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    } else if (isInserting) {
      context.missing(_openingBalanceMeta);
    }
    if (data.containsKey('current_balance')) {
      context.handle(
          _currentBalanceMeta,
          currentBalance.isAcceptableOrUnknown(
              data['current_balance']!, _currentBalanceMeta));
    } else if (isInserting) {
      context.missing(_currentBalanceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankAccount(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      accountName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_name'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_number'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name'])!,
      openingBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}opening_balance'])!,
      currentBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_balance'])!,
    );
  }

  @override
  $BankAccountsTable createAlias(String alias) {
    return $BankAccountsTable(attachedDatabase, alias);
  }
}

class BankAccount extends DataClass implements Insertable<BankAccount> {
  final String id;
  final String accountName;
  final String accountNumber;
  final String bankName;
  final int openingBalance;
  final int currentBalance;
  const BankAccount(
      {required this.id,
      required this.accountName,
      required this.accountNumber,
      required this.bankName,
      required this.openingBalance,
      required this.currentBalance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_name'] = Variable<String>(accountName);
    map['account_number'] = Variable<String>(accountNumber);
    map['bank_name'] = Variable<String>(bankName);
    map['opening_balance'] = Variable<int>(openingBalance);
    map['current_balance'] = Variable<int>(currentBalance);
    return map;
  }

  BankAccountsCompanion toCompanion(bool nullToAbsent) {
    return BankAccountsCompanion(
      id: Value(id),
      accountName: Value(accountName),
      accountNumber: Value(accountNumber),
      bankName: Value(bankName),
      openingBalance: Value(openingBalance),
      currentBalance: Value(currentBalance),
    );
  }

  factory BankAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankAccount(
      id: serializer.fromJson<String>(json['id']),
      accountName: serializer.fromJson<String>(json['accountName']),
      accountNumber: serializer.fromJson<String>(json['accountNumber']),
      bankName: serializer.fromJson<String>(json['bankName']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
      currentBalance: serializer.fromJson<int>(json['currentBalance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountName': serializer.toJson<String>(accountName),
      'accountNumber': serializer.toJson<String>(accountNumber),
      'bankName': serializer.toJson<String>(bankName),
      'openingBalance': serializer.toJson<int>(openingBalance),
      'currentBalance': serializer.toJson<int>(currentBalance),
    };
  }

  BankAccount copyWith(
          {String? id,
          String? accountName,
          String? accountNumber,
          String? bankName,
          int? openingBalance,
          int? currentBalance}) =>
      BankAccount(
        id: id ?? this.id,
        accountName: accountName ?? this.accountName,
        accountNumber: accountNumber ?? this.accountNumber,
        bankName: bankName ?? this.bankName,
        openingBalance: openingBalance ?? this.openingBalance,
        currentBalance: currentBalance ?? this.currentBalance,
      );
  BankAccount copyWithCompanion(BankAccountsCompanion data) {
    return BankAccount(
      id: data.id.present ? data.id.value : this.id,
      accountName:
          data.accountName.present ? data.accountName.value : this.accountName,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankAccount(')
          ..write('id: $id, ')
          ..write('accountName: $accountName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('bankName: $bankName, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('currentBalance: $currentBalance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, accountName, accountNumber, bankName, openingBalance, currentBalance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankAccount &&
          other.id == this.id &&
          other.accountName == this.accountName &&
          other.accountNumber == this.accountNumber &&
          other.bankName == this.bankName &&
          other.openingBalance == this.openingBalance &&
          other.currentBalance == this.currentBalance);
}

class BankAccountsCompanion extends UpdateCompanion<BankAccount> {
  final Value<String> id;
  final Value<String> accountName;
  final Value<String> accountNumber;
  final Value<String> bankName;
  final Value<int> openingBalance;
  final Value<int> currentBalance;
  final Value<int> rowid;
  const BankAccountsCompanion({
    this.id = const Value.absent(),
    this.accountName = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.bankName = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankAccountsCompanion.insert({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required int openingBalance,
    required int currentBalance,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        accountName = Value(accountName),
        accountNumber = Value(accountNumber),
        bankName = Value(bankName),
        openingBalance = Value(openingBalance),
        currentBalance = Value(currentBalance);
  static Insertable<BankAccount> custom({
    Expression<String>? id,
    Expression<String>? accountName,
    Expression<String>? accountNumber,
    Expression<String>? bankName,
    Expression<int>? openingBalance,
    Expression<int>? currentBalance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountName != null) 'account_name': accountName,
      if (accountNumber != null) 'account_number': accountNumber,
      if (bankName != null) 'bank_name': bankName,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankAccountsCompanion copyWith(
      {Value<String>? id,
      Value<String>? accountName,
      Value<String>? accountNumber,
      Value<String>? bankName,
      Value<int>? openingBalance,
      Value<int>? currentBalance,
      Value<int>? rowid}) {
    return BankAccountsCompanion(
      id: id ?? this.id,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      bankName: bankName ?? this.bankName,
      openingBalance: openingBalance ?? this.openingBalance,
      currentBalance: currentBalance ?? this.currentBalance,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<int>(currentBalance.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankAccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountName: $accountName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('bankName: $bankName, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BankReconciliationsTable extends BankReconciliations
    with TableInfo<$BankReconciliationsTable, BankReconciliation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankReconciliationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bankAccountIdMeta =
      const VerificationMeta('bankAccountId');
  @override
  late final GeneratedColumn<String> bankAccountId = GeneratedColumn<String>(
      'bank_account_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statementDateMeta =
      const VerificationMeta('statementDate');
  @override
  late final GeneratedColumn<DateTime> statementDate =
      GeneratedColumn<DateTime>('statement_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statementBalanceMeta =
      const VerificationMeta('statementBalance');
  @override
  late final GeneratedColumn<int> statementBalance = GeneratedColumn<int>(
      'statement_balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reconciledBalanceMeta =
      const VerificationMeta('reconciledBalance');
  @override
  late final GeneratedColumn<int> reconciledBalance = GeneratedColumn<int>(
      'reconciled_balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        bankAccountId,
        statementDate,
        statementBalance,
        reconciledBalance,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_reconciliations';
  @override
  VerificationContext validateIntegrity(Insertable<BankReconciliation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('bank_account_id')) {
      context.handle(
          _bankAccountIdMeta,
          bankAccountId.isAcceptableOrUnknown(
              data['bank_account_id']!, _bankAccountIdMeta));
    } else if (isInserting) {
      context.missing(_bankAccountIdMeta);
    }
    if (data.containsKey('statement_date')) {
      context.handle(
          _statementDateMeta,
          statementDate.isAcceptableOrUnknown(
              data['statement_date']!, _statementDateMeta));
    } else if (isInserting) {
      context.missing(_statementDateMeta);
    }
    if (data.containsKey('statement_balance')) {
      context.handle(
          _statementBalanceMeta,
          statementBalance.isAcceptableOrUnknown(
              data['statement_balance']!, _statementBalanceMeta));
    } else if (isInserting) {
      context.missing(_statementBalanceMeta);
    }
    if (data.containsKey('reconciled_balance')) {
      context.handle(
          _reconciledBalanceMeta,
          reconciledBalance.isAcceptableOrUnknown(
              data['reconciled_balance']!, _reconciledBalanceMeta));
    } else if (isInserting) {
      context.missing(_reconciledBalanceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankReconciliation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankReconciliation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      bankAccountId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_id'])!,
      statementDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}statement_date'])!,
      statementBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}statement_balance'])!,
      reconciledBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}reconciled_balance'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $BankReconciliationsTable createAlias(String alias) {
    return $BankReconciliationsTable(attachedDatabase, alias);
  }
}

class BankReconciliation extends DataClass
    implements Insertable<BankReconciliation> {
  final String id;
  final String bankAccountId;
  final DateTime statementDate;
  final int statementBalance;
  final int reconciledBalance;
  final String status;
  const BankReconciliation(
      {required this.id,
      required this.bankAccountId,
      required this.statementDate,
      required this.statementBalance,
      required this.reconciledBalance,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['bank_account_id'] = Variable<String>(bankAccountId);
    map['statement_date'] = Variable<DateTime>(statementDate);
    map['statement_balance'] = Variable<int>(statementBalance);
    map['reconciled_balance'] = Variable<int>(reconciledBalance);
    map['status'] = Variable<String>(status);
    return map;
  }

  BankReconciliationsCompanion toCompanion(bool nullToAbsent) {
    return BankReconciliationsCompanion(
      id: Value(id),
      bankAccountId: Value(bankAccountId),
      statementDate: Value(statementDate),
      statementBalance: Value(statementBalance),
      reconciledBalance: Value(reconciledBalance),
      status: Value(status),
    );
  }

  factory BankReconciliation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankReconciliation(
      id: serializer.fromJson<String>(json['id']),
      bankAccountId: serializer.fromJson<String>(json['bankAccountId']),
      statementDate: serializer.fromJson<DateTime>(json['statementDate']),
      statementBalance: serializer.fromJson<int>(json['statementBalance']),
      reconciledBalance: serializer.fromJson<int>(json['reconciledBalance']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'bankAccountId': serializer.toJson<String>(bankAccountId),
      'statementDate': serializer.toJson<DateTime>(statementDate),
      'statementBalance': serializer.toJson<int>(statementBalance),
      'reconciledBalance': serializer.toJson<int>(reconciledBalance),
      'status': serializer.toJson<String>(status),
    };
  }

  BankReconciliation copyWith(
          {String? id,
          String? bankAccountId,
          DateTime? statementDate,
          int? statementBalance,
          int? reconciledBalance,
          String? status}) =>
      BankReconciliation(
        id: id ?? this.id,
        bankAccountId: bankAccountId ?? this.bankAccountId,
        statementDate: statementDate ?? this.statementDate,
        statementBalance: statementBalance ?? this.statementBalance,
        reconciledBalance: reconciledBalance ?? this.reconciledBalance,
        status: status ?? this.status,
      );
  BankReconciliation copyWithCompanion(BankReconciliationsCompanion data) {
    return BankReconciliation(
      id: data.id.present ? data.id.value : this.id,
      bankAccountId: data.bankAccountId.present
          ? data.bankAccountId.value
          : this.bankAccountId,
      statementDate: data.statementDate.present
          ? data.statementDate.value
          : this.statementDate,
      statementBalance: data.statementBalance.present
          ? data.statementBalance.value
          : this.statementBalance,
      reconciledBalance: data.reconciledBalance.present
          ? data.reconciledBalance.value
          : this.reconciledBalance,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankReconciliation(')
          ..write('id: $id, ')
          ..write('bankAccountId: $bankAccountId, ')
          ..write('statementDate: $statementDate, ')
          ..write('statementBalance: $statementBalance, ')
          ..write('reconciledBalance: $reconciledBalance, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bankAccountId, statementDate,
      statementBalance, reconciledBalance, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankReconciliation &&
          other.id == this.id &&
          other.bankAccountId == this.bankAccountId &&
          other.statementDate == this.statementDate &&
          other.statementBalance == this.statementBalance &&
          other.reconciledBalance == this.reconciledBalance &&
          other.status == this.status);
}

class BankReconciliationsCompanion extends UpdateCompanion<BankReconciliation> {
  final Value<String> id;
  final Value<String> bankAccountId;
  final Value<DateTime> statementDate;
  final Value<int> statementBalance;
  final Value<int> reconciledBalance;
  final Value<String> status;
  final Value<int> rowid;
  const BankReconciliationsCompanion({
    this.id = const Value.absent(),
    this.bankAccountId = const Value.absent(),
    this.statementDate = const Value.absent(),
    this.statementBalance = const Value.absent(),
    this.reconciledBalance = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankReconciliationsCompanion.insert({
    required String id,
    required String bankAccountId,
    required DateTime statementDate,
    required int statementBalance,
    required int reconciledBalance,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        bankAccountId = Value(bankAccountId),
        statementDate = Value(statementDate),
        statementBalance = Value(statementBalance),
        reconciledBalance = Value(reconciledBalance);
  static Insertable<BankReconciliation> custom({
    Expression<String>? id,
    Expression<String>? bankAccountId,
    Expression<DateTime>? statementDate,
    Expression<int>? statementBalance,
    Expression<int>? reconciledBalance,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bankAccountId != null) 'bank_account_id': bankAccountId,
      if (statementDate != null) 'statement_date': statementDate,
      if (statementBalance != null) 'statement_balance': statementBalance,
      if (reconciledBalance != null) 'reconciled_balance': reconciledBalance,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankReconciliationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? bankAccountId,
      Value<DateTime>? statementDate,
      Value<int>? statementBalance,
      Value<int>? reconciledBalance,
      Value<String>? status,
      Value<int>? rowid}) {
    return BankReconciliationsCompanion(
      id: id ?? this.id,
      bankAccountId: bankAccountId ?? this.bankAccountId,
      statementDate: statementDate ?? this.statementDate,
      statementBalance: statementBalance ?? this.statementBalance,
      reconciledBalance: reconciledBalance ?? this.reconciledBalance,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (bankAccountId.present) {
      map['bank_account_id'] = Variable<String>(bankAccountId.value);
    }
    if (statementDate.present) {
      map['statement_date'] = Variable<DateTime>(statementDate.value);
    }
    if (statementBalance.present) {
      map['statement_balance'] = Variable<int>(statementBalance.value);
    }
    if (reconciledBalance.present) {
      map['reconciled_balance'] = Variable<int>(reconciledBalance.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankReconciliationsCompanion(')
          ..write('id: $id, ')
          ..write('bankAccountId: $bankAccountId, ')
          ..write('statementDate: $statementDate, ')
          ..write('statementBalance: $statementBalance, ')
          ..write('reconciledBalance: $reconciledBalance, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoiceNoMeta =
      const VerificationMeta('invoiceNo');
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
      'invoice_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoiceDateMeta =
      const VerificationMeta('invoiceDate');
  @override
  late final GeneratedColumn<DateTime> invoiceDate = GeneratedColumn<DateTime>(
      'invoice_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _taxAmountMeta =
      const VerificationMeta('taxAmount');
  @override
  late final GeneratedColumn<int> taxAmount = GeneratedColumn<int>(
      'tax_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        invoiceNo,
        customerName,
        invoiceDate,
        dueDate,
        subtotal,
        taxAmount,
        total,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(Insertable<Invoice> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invoice_no')) {
      context.handle(_invoiceNoMeta,
          invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta));
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('invoice_date')) {
      context.handle(
          _invoiceDateMeta,
          invoiceDate.isAcceptableOrUnknown(
              data['invoice_date']!, _invoiceDateMeta));
    } else if (isInserting) {
      context.missing(_invoiceDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('tax_amount')) {
      context.handle(_taxAmountMeta,
          taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta));
    } else if (isInserting) {
      context.missing(_taxAmountMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      invoiceNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_no'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      invoiceDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}invoice_date'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subtotal'])!,
      taxAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tax_amount'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final String id;
  final String invoiceNo;
  final String customerName;
  final DateTime invoiceDate;
  final DateTime dueDate;
  final int subtotal;
  final int taxAmount;
  final int total;
  final String status;
  const Invoice(
      {required this.id,
      required this.invoiceNo,
      required this.customerName,
      required this.invoiceDate,
      required this.dueDate,
      required this.subtotal,
      required this.taxAmount,
      required this.total,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['invoice_no'] = Variable<String>(invoiceNo);
    map['customer_name'] = Variable<String>(customerName);
    map['invoice_date'] = Variable<DateTime>(invoiceDate);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['subtotal'] = Variable<int>(subtotal);
    map['tax_amount'] = Variable<int>(taxAmount);
    map['total'] = Variable<int>(total);
    map['status'] = Variable<String>(status);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      invoiceNo: Value(invoiceNo),
      customerName: Value(customerName),
      invoiceDate: Value(invoiceDate),
      dueDate: Value(dueDate),
      subtotal: Value(subtotal),
      taxAmount: Value(taxAmount),
      total: Value(total),
      status: Value(status),
    );
  }

  factory Invoice.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<String>(json['id']),
      invoiceNo: serializer.fromJson<String>(json['invoiceNo']),
      customerName: serializer.fromJson<String>(json['customerName']),
      invoiceDate: serializer.fromJson<DateTime>(json['invoiceDate']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      taxAmount: serializer.fromJson<int>(json['taxAmount']),
      total: serializer.fromJson<int>(json['total']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'invoiceNo': serializer.toJson<String>(invoiceNo),
      'customerName': serializer.toJson<String>(customerName),
      'invoiceDate': serializer.toJson<DateTime>(invoiceDate),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'subtotal': serializer.toJson<int>(subtotal),
      'taxAmount': serializer.toJson<int>(taxAmount),
      'total': serializer.toJson<int>(total),
      'status': serializer.toJson<String>(status),
    };
  }

  Invoice copyWith(
          {String? id,
          String? invoiceNo,
          String? customerName,
          DateTime? invoiceDate,
          DateTime? dueDate,
          int? subtotal,
          int? taxAmount,
          int? total,
          String? status}) =>
      Invoice(
        id: id ?? this.id,
        invoiceNo: invoiceNo ?? this.invoiceNo,
        customerName: customerName ?? this.customerName,
        invoiceDate: invoiceDate ?? this.invoiceDate,
        dueDate: dueDate ?? this.dueDate,
        subtotal: subtotal ?? this.subtotal,
        taxAmount: taxAmount ?? this.taxAmount,
        total: total ?? this.total,
        status: status ?? this.status,
      );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNo: data.invoiceNo.present ? data.invoiceNo.value : this.invoiceNo,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      invoiceDate:
          data.invoiceDate.present ? data.invoiceDate.value : this.invoiceDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      taxAmount: data.taxAmount.present ? data.taxAmount.value : this.taxAmount,
      total: data.total.present ? data.total.value : this.total,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('customerName: $customerName, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('total: $total, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, invoiceNo, customerName, invoiceDate,
      dueDate, subtotal, taxAmount, total, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.invoiceNo == this.invoiceNo &&
          other.customerName == this.customerName &&
          other.invoiceDate == this.invoiceDate &&
          other.dueDate == this.dueDate &&
          other.subtotal == this.subtotal &&
          other.taxAmount == this.taxAmount &&
          other.total == this.total &&
          other.status == this.status);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<String> id;
  final Value<String> invoiceNo;
  final Value<String> customerName;
  final Value<DateTime> invoiceDate;
  final Value<DateTime> dueDate;
  final Value<int> subtotal;
  final Value<int> taxAmount;
  final Value<int> total;
  final Value<String> status;
  final Value<int> rowid;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.customerName = const Value.absent(),
    this.invoiceDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.taxAmount = const Value.absent(),
    this.total = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoicesCompanion.insert({
    required String id,
    required String invoiceNo,
    required String customerName,
    required DateTime invoiceDate,
    required DateTime dueDate,
    required int subtotal,
    required int taxAmount,
    required int total,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        invoiceNo = Value(invoiceNo),
        customerName = Value(customerName),
        invoiceDate = Value(invoiceDate),
        dueDate = Value(dueDate),
        subtotal = Value(subtotal),
        taxAmount = Value(taxAmount),
        total = Value(total);
  static Insertable<Invoice> custom({
    Expression<String>? id,
    Expression<String>? invoiceNo,
    Expression<String>? customerName,
    Expression<DateTime>? invoiceDate,
    Expression<DateTime>? dueDate,
    Expression<int>? subtotal,
    Expression<int>? taxAmount,
    Expression<int>? total,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (customerName != null) 'customer_name': customerName,
      if (invoiceDate != null) 'invoice_date': invoiceDate,
      if (dueDate != null) 'due_date': dueDate,
      if (subtotal != null) 'subtotal': subtotal,
      if (taxAmount != null) 'tax_amount': taxAmount,
      if (total != null) 'total': total,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoicesCompanion copyWith(
      {Value<String>? id,
      Value<String>? invoiceNo,
      Value<String>? customerName,
      Value<DateTime>? invoiceDate,
      Value<DateTime>? dueDate,
      Value<int>? subtotal,
      Value<int>? taxAmount,
      Value<int>? total,
      Value<String>? status,
      Value<int>? rowid}) {
    return InvoicesCompanion(
      id: id ?? this.id,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      customerName: customerName ?? this.customerName,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      dueDate: dueDate ?? this.dueDate,
      subtotal: subtotal ?? this.subtotal,
      taxAmount: taxAmount ?? this.taxAmount,
      total: total ?? this.total,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (invoiceDate.present) {
      map['invoice_date'] = Variable<DateTime>(invoiceDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (taxAmount.present) {
      map['tax_amount'] = Variable<int>(taxAmount.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('customerName: $customerName, ')
          ..write('invoiceDate: $invoiceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('total: $total, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoiceLineItemsTable extends InvoiceLineItems
    with TableInfo<$InvoiceLineItemsTable, InvoiceLineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceLineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoiceIdMeta =
      const VerificationMeta('invoiceId');
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
      'invoice_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _taxRateMeta =
      const VerificationMeta('taxRate');
  @override
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
      'tax_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lineTotalMeta =
      const VerificationMeta('lineTotal');
  @override
  late final GeneratedColumn<int> lineTotal = GeneratedColumn<int>(
      'line_total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, invoiceId, description, quantity, unitPrice, taxRate, lineTotal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_line_items';
  @override
  VerificationContext validateIntegrity(Insertable<InvoiceLineItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('tax_rate')) {
      context.handle(_taxRateMeta,
          taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta));
    }
    if (data.containsKey('line_total')) {
      context.handle(_lineTotalMeta,
          lineTotal.isAcceptableOrUnknown(data['line_total']!, _lineTotalMeta));
    } else if (isInserting) {
      context.missing(_lineTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceLineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceLineItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      invoiceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price'])!,
      taxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_rate'])!,
      lineTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line_total'])!,
    );
  }

  @override
  $InvoiceLineItemsTable createAlias(String alias) {
    return $InvoiceLineItemsTable(attachedDatabase, alias);
  }
}

class InvoiceLineItem extends DataClass implements Insertable<InvoiceLineItem> {
  final String id;
  final String invoiceId;
  final String description;
  final int quantity;
  final int unitPrice;
  final double taxRate;
  final int lineTotal;
  const InvoiceLineItem(
      {required this.id,
      required this.invoiceId,
      required this.description,
      required this.quantity,
      required this.unitPrice,
      required this.taxRate,
      required this.lineTotal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['description'] = Variable<String>(description);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['tax_rate'] = Variable<double>(taxRate);
    map['line_total'] = Variable<int>(lineTotal);
    return map;
  }

  InvoiceLineItemsCompanion toCompanion(bool nullToAbsent) {
    return InvoiceLineItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      description: Value(description),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      taxRate: Value(taxRate),
      lineTotal: Value(lineTotal),
    );
  }

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceLineItem(
      id: serializer.fromJson<String>(json['id']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      description: serializer.fromJson<String>(json['description']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      taxRate: serializer.fromJson<double>(json['taxRate']),
      lineTotal: serializer.fromJson<int>(json['lineTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'description': serializer.toJson<String>(description),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'taxRate': serializer.toJson<double>(taxRate),
      'lineTotal': serializer.toJson<int>(lineTotal),
    };
  }

  InvoiceLineItem copyWith(
          {String? id,
          String? invoiceId,
          String? description,
          int? quantity,
          int? unitPrice,
          double? taxRate,
          int? lineTotal}) =>
      InvoiceLineItem(
        id: id ?? this.id,
        invoiceId: invoiceId ?? this.invoiceId,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        taxRate: taxRate ?? this.taxRate,
        lineTotal: lineTotal ?? this.lineTotal,
      );
  InvoiceLineItem copyWithCompanion(InvoiceLineItemsCompanion data) {
    return InvoiceLineItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      description:
          data.description.present ? data.description.value : this.description,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      taxRate: data.taxRate.present ? data.taxRate.value : this.taxRate,
      lineTotal: data.lineTotal.present ? data.lineTotal.value : this.lineTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceLineItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, invoiceId, description, quantity, unitPrice, taxRate, lineTotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceLineItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.description == this.description &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.taxRate == this.taxRate &&
          other.lineTotal == this.lineTotal);
}

class InvoiceLineItemsCompanion extends UpdateCompanion<InvoiceLineItem> {
  final Value<String> id;
  final Value<String> invoiceId;
  final Value<String> description;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<double> taxRate;
  final Value<int> lineTotal;
  final Value<int> rowid;
  const InvoiceLineItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.lineTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoiceLineItemsCompanion.insert({
    required String id,
    required String invoiceId,
    required String description,
    required int quantity,
    required int unitPrice,
    this.taxRate = const Value.absent(),
    required int lineTotal,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        invoiceId = Value(invoiceId),
        description = Value(description),
        quantity = Value(quantity),
        unitPrice = Value(unitPrice),
        lineTotal = Value(lineTotal);
  static Insertable<InvoiceLineItem> custom({
    Expression<String>? id,
    Expression<String>? invoiceId,
    Expression<String>? description,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<double>? taxRate,
    Expression<int>? lineTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (description != null) 'description': description,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (taxRate != null) 'tax_rate': taxRate,
      if (lineTotal != null) 'line_total': lineTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoiceLineItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? invoiceId,
      Value<String>? description,
      Value<int>? quantity,
      Value<int>? unitPrice,
      Value<double>? taxRate,
      Value<int>? lineTotal,
      Value<int>? rowid}) {
    return InvoiceLineItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      taxRate: taxRate ?? this.taxRate,
      lineTotal: lineTotal ?? this.lineTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (lineTotal.present) {
      map['line_total'] = Variable<int>(lineTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceLineItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('lineTotal: $lineTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _txnDateMeta =
      const VerificationMeta('txnDate');
  @override
  late final GeneratedColumn<DateTime> txnDate = GeneratedColumn<DateTime>(
      'txn_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
      'account_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('completed'));
  static const VerificationMeta _sourceModuleMeta =
      const VerificationMeta('sourceModule');
  @override
  late final GeneratedColumn<String> sourceModule = GeneratedColumn<String>(
      'source_module', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        txnDate,
        description,
        category,
        accountId,
        amount,
        direction,
        status,
        sourceModule,
        sourceId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('txn_date')) {
      context.handle(_txnDateMeta,
          txnDate.isAcceptableOrUnknown(data['txn_date']!, _txnDateMeta));
    } else if (isInserting) {
      context.missing(_txnDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('source_module')) {
      context.handle(
          _sourceModuleMeta,
          sourceModule.isAcceptableOrUnknown(
              data['source_module']!, _sourceModuleMeta));
    } else if (isInserting) {
      context.missing(_sourceModuleMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      txnDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}txn_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      sourceModule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_module'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final DateTime txnDate;
  final String description;
  final String category;
  final String? accountId;
  final int amount;
  final String direction;
  final String status;
  final String sourceModule;
  final String? sourceId;
  const Transaction(
      {required this.id,
      required this.txnDate,
      required this.description,
      required this.category,
      this.accountId,
      required this.amount,
      required this.direction,
      required this.status,
      required this.sourceModule,
      this.sourceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['txn_date'] = Variable<DateTime>(txnDate);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    map['amount'] = Variable<int>(amount);
    map['direction'] = Variable<String>(direction);
    map['status'] = Variable<String>(status);
    map['source_module'] = Variable<String>(sourceModule);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      txnDate: Value(txnDate),
      description: Value(description),
      category: Value(category),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      amount: Value(amount),
      direction: Value(direction),
      status: Value(status),
      sourceModule: Value(sourceModule),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      txnDate: serializer.fromJson<DateTime>(json['txnDate']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      accountId: serializer.fromJson<String?>(json['accountId']),
      amount: serializer.fromJson<int>(json['amount']),
      direction: serializer.fromJson<String>(json['direction']),
      status: serializer.fromJson<String>(json['status']),
      sourceModule: serializer.fromJson<String>(json['sourceModule']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'txnDate': serializer.toJson<DateTime>(txnDate),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'accountId': serializer.toJson<String?>(accountId),
      'amount': serializer.toJson<int>(amount),
      'direction': serializer.toJson<String>(direction),
      'status': serializer.toJson<String>(status),
      'sourceModule': serializer.toJson<String>(sourceModule),
      'sourceId': serializer.toJson<String?>(sourceId),
    };
  }

  Transaction copyWith(
          {String? id,
          DateTime? txnDate,
          String? description,
          String? category,
          Value<String?> accountId = const Value.absent(),
          int? amount,
          String? direction,
          String? status,
          String? sourceModule,
          Value<String?> sourceId = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        txnDate: txnDate ?? this.txnDate,
        description: description ?? this.description,
        category: category ?? this.category,
        accountId: accountId.present ? accountId.value : this.accountId,
        amount: amount ?? this.amount,
        direction: direction ?? this.direction,
        status: status ?? this.status,
        sourceModule: sourceModule ?? this.sourceModule,
        sourceId: sourceId.present ? sourceId.value : this.sourceId,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      txnDate: data.txnDate.present ? data.txnDate.value : this.txnDate,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      amount: data.amount.present ? data.amount.value : this.amount,
      direction: data.direction.present ? data.direction.value : this.direction,
      status: data.status.present ? data.status.value : this.status,
      sourceModule: data.sourceModule.present
          ? data.sourceModule.value
          : this.sourceModule,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('txnDate: $txnDate, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('direction: $direction, ')
          ..write('status: $status, ')
          ..write('sourceModule: $sourceModule, ')
          ..write('sourceId: $sourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, txnDate, description, category, accountId,
      amount, direction, status, sourceModule, sourceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.txnDate == this.txnDate &&
          other.description == this.description &&
          other.category == this.category &&
          other.accountId == this.accountId &&
          other.amount == this.amount &&
          other.direction == this.direction &&
          other.status == this.status &&
          other.sourceModule == this.sourceModule &&
          other.sourceId == this.sourceId);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<DateTime> txnDate;
  final Value<String> description;
  final Value<String> category;
  final Value<String?> accountId;
  final Value<int> amount;
  final Value<String> direction;
  final Value<String> status;
  final Value<String> sourceModule;
  final Value<String?> sourceId;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.txnDate = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.accountId = const Value.absent(),
    this.amount = const Value.absent(),
    this.direction = const Value.absent(),
    this.status = const Value.absent(),
    this.sourceModule = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required DateTime txnDate,
    required String description,
    required String category,
    this.accountId = const Value.absent(),
    required int amount,
    required String direction,
    this.status = const Value.absent(),
    required String sourceModule,
    this.sourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        txnDate = Value(txnDate),
        description = Value(description),
        category = Value(category),
        amount = Value(amount),
        direction = Value(direction),
        sourceModule = Value(sourceModule);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<DateTime>? txnDate,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? accountId,
    Expression<int>? amount,
    Expression<String>? direction,
    Expression<String>? status,
    Expression<String>? sourceModule,
    Expression<String>? sourceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (txnDate != null) 'txn_date': txnDate,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (accountId != null) 'account_id': accountId,
      if (amount != null) 'amount': amount,
      if (direction != null) 'direction': direction,
      if (status != null) 'status': status,
      if (sourceModule != null) 'source_module': sourceModule,
      if (sourceId != null) 'source_id': sourceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? txnDate,
      Value<String>? description,
      Value<String>? category,
      Value<String?>? accountId,
      Value<int>? amount,
      Value<String>? direction,
      Value<String>? status,
      Value<String>? sourceModule,
      Value<String?>? sourceId,
      Value<int>? rowid}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      txnDate: txnDate ?? this.txnDate,
      description: description ?? this.description,
      category: category ?? this.category,
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      direction: direction ?? this.direction,
      status: status ?? this.status,
      sourceModule: sourceModule ?? this.sourceModule,
      sourceId: sourceId ?? this.sourceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (txnDate.present) {
      map['txn_date'] = Variable<DateTime>(txnDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sourceModule.present) {
      map['source_module'] = Variable<String>(sourceModule.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('txnDate: $txnDate, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('accountId: $accountId, ')
          ..write('amount: $amount, ')
          ..write('direction: $direction, ')
          ..write('status: $status, ')
          ..write('sourceModule: $sourceModule, ')
          ..write('sourceId: $sourceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fiscalYearMeta =
      const VerificationMeta('fiscalYear');
  @override
  late final GeneratedColumn<String> fiscalYear = GeneratedColumn<String>(
      'fiscal_year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _periodMonthMeta =
      const VerificationMeta('periodMonth');
  @override
  late final GeneratedColumn<int> periodMonth = GeneratedColumn<int>(
      'period_month', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _budgetedAmountMeta =
      const VerificationMeta('budgetedAmount');
  @override
  late final GeneratedColumn<int> budgetedAmount = GeneratedColumn<int>(
      'budgeted_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actualAmountMeta =
      const VerificationMeta('actualAmount');
  @override
  late final GeneratedColumn<int> actualAmount = GeneratedColumn<int>(
      'actual_amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, category, fiscalYear, periodMonth, budgetedAmount, actualAmount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<Budget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('fiscal_year')) {
      context.handle(
          _fiscalYearMeta,
          fiscalYear.isAcceptableOrUnknown(
              data['fiscal_year']!, _fiscalYearMeta));
    } else if (isInserting) {
      context.missing(_fiscalYearMeta);
    }
    if (data.containsKey('period_month')) {
      context.handle(
          _periodMonthMeta,
          periodMonth.isAcceptableOrUnknown(
              data['period_month']!, _periodMonthMeta));
    } else if (isInserting) {
      context.missing(_periodMonthMeta);
    }
    if (data.containsKey('budgeted_amount')) {
      context.handle(
          _budgetedAmountMeta,
          budgetedAmount.isAcceptableOrUnknown(
              data['budgeted_amount']!, _budgetedAmountMeta));
    } else if (isInserting) {
      context.missing(_budgetedAmountMeta);
    }
    if (data.containsKey('actual_amount')) {
      context.handle(
          _actualAmountMeta,
          actualAmount.isAcceptableOrUnknown(
              data['actual_amount']!, _actualAmountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      fiscalYear: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fiscal_year'])!,
      periodMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_month'])!,
      budgetedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budgeted_amount'])!,
      actualAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actual_amount'])!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }
}

class Budget extends DataClass implements Insertable<Budget> {
  final String id;
  final String category;
  final String fiscalYear;
  final int periodMonth;
  final int budgetedAmount;
  final int actualAmount;
  const Budget(
      {required this.id,
      required this.category,
      required this.fiscalYear,
      required this.periodMonth,
      required this.budgetedAmount,
      required this.actualAmount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    map['fiscal_year'] = Variable<String>(fiscalYear);
    map['period_month'] = Variable<int>(periodMonth);
    map['budgeted_amount'] = Variable<int>(budgetedAmount);
    map['actual_amount'] = Variable<int>(actualAmount);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      category: Value(category),
      fiscalYear: Value(fiscalYear),
      periodMonth: Value(periodMonth),
      budgetedAmount: Value(budgetedAmount),
      actualAmount: Value(actualAmount),
    );
  }

  factory Budget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      fiscalYear: serializer.fromJson<String>(json['fiscalYear']),
      periodMonth: serializer.fromJson<int>(json['periodMonth']),
      budgetedAmount: serializer.fromJson<int>(json['budgetedAmount']),
      actualAmount: serializer.fromJson<int>(json['actualAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'fiscalYear': serializer.toJson<String>(fiscalYear),
      'periodMonth': serializer.toJson<int>(periodMonth),
      'budgetedAmount': serializer.toJson<int>(budgetedAmount),
      'actualAmount': serializer.toJson<int>(actualAmount),
    };
  }

  Budget copyWith(
          {String? id,
          String? category,
          String? fiscalYear,
          int? periodMonth,
          int? budgetedAmount,
          int? actualAmount}) =>
      Budget(
        id: id ?? this.id,
        category: category ?? this.category,
        fiscalYear: fiscalYear ?? this.fiscalYear,
        periodMonth: periodMonth ?? this.periodMonth,
        budgetedAmount: budgetedAmount ?? this.budgetedAmount,
        actualAmount: actualAmount ?? this.actualAmount,
      );
  Budget copyWithCompanion(BudgetsCompanion data) {
    return Budget(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      fiscalYear:
          data.fiscalYear.present ? data.fiscalYear.value : this.fiscalYear,
      periodMonth:
          data.periodMonth.present ? data.periodMonth.value : this.periodMonth,
      budgetedAmount: data.budgetedAmount.present
          ? data.budgetedAmount.value
          : this.budgetedAmount,
      actualAmount: data.actualAmount.present
          ? data.actualAmount.value
          : this.actualAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('fiscalYear: $fiscalYear, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('budgetedAmount: $budgetedAmount, ')
          ..write('actualAmount: $actualAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, category, fiscalYear, periodMonth, budgetedAmount, actualAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.id == this.id &&
          other.category == this.category &&
          other.fiscalYear == this.fiscalYear &&
          other.periodMonth == this.periodMonth &&
          other.budgetedAmount == this.budgetedAmount &&
          other.actualAmount == this.actualAmount);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<String> id;
  final Value<String> category;
  final Value<String> fiscalYear;
  final Value<int> periodMonth;
  final Value<int> budgetedAmount;
  final Value<int> actualAmount;
  final Value<int> rowid;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.fiscalYear = const Value.absent(),
    this.periodMonth = const Value.absent(),
    this.budgetedAmount = const Value.absent(),
    this.actualAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetsCompanion.insert({
    required String id,
    required String category,
    required String fiscalYear,
    required int periodMonth,
    required int budgetedAmount,
    this.actualAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        category = Value(category),
        fiscalYear = Value(fiscalYear),
        periodMonth = Value(periodMonth),
        budgetedAmount = Value(budgetedAmount);
  static Insertable<Budget> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<String>? fiscalYear,
    Expression<int>? periodMonth,
    Expression<int>? budgetedAmount,
    Expression<int>? actualAmount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (fiscalYear != null) 'fiscal_year': fiscalYear,
      if (periodMonth != null) 'period_month': periodMonth,
      if (budgetedAmount != null) 'budgeted_amount': budgetedAmount,
      if (actualAmount != null) 'actual_amount': actualAmount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? category,
      Value<String>? fiscalYear,
      Value<int>? periodMonth,
      Value<int>? budgetedAmount,
      Value<int>? actualAmount,
      Value<int>? rowid}) {
    return BudgetsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      fiscalYear: fiscalYear ?? this.fiscalYear,
      periodMonth: periodMonth ?? this.periodMonth,
      budgetedAmount: budgetedAmount ?? this.budgetedAmount,
      actualAmount: actualAmount ?? this.actualAmount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (fiscalYear.present) {
      map['fiscal_year'] = Variable<String>(fiscalYear.value);
    }
    if (periodMonth.present) {
      map['period_month'] = Variable<int>(periodMonth.value);
    }
    if (budgetedAmount.present) {
      map['budgeted_amount'] = Variable<int>(budgetedAmount.value);
    }
    if (actualAmount.present) {
      map['actual_amount'] = Variable<int>(actualAmount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('fiscalYear: $fiscalYear, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('budgetedAmount: $budgetedAmount, ')
          ..write('actualAmount: $actualAmount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeCodeMeta =
      const VerificationMeta('employeeCode');
  @override
  late final GeneratedColumn<String> employeeCode = GeneratedColumn<String>(
      'employee_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _departmentMeta =
      const VerificationMeta('department');
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
      'department', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleTitleMeta =
      const VerificationMeta('roleTitle');
  @override
  late final GeneratedColumn<String> roleTitle = GeneratedColumn<String>(
      'role_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basicSalaryMeta =
      const VerificationMeta('basicSalary');
  @override
  late final GeneratedColumn<int> basicSalary = GeneratedColumn<int>(
      'basic_salary', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _employmentStatusMeta =
      const VerificationMeta('employmentStatus');
  @override
  late final GeneratedColumn<String> employmentStatus = GeneratedColumn<String>(
      'employment_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _joinedDateMeta =
      const VerificationMeta('joinedDate');
  @override
  late final GeneratedColumn<DateTime> joinedDate = GeneratedColumn<DateTime>(
      'joined_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _contactPhoneMeta =
      const VerificationMeta('contactPhone');
  @override
  late final GeneratedColumn<String> contactPhone = GeneratedColumn<String>(
      'contact_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contactEmailMeta =
      const VerificationMeta('contactEmail');
  @override
  late final GeneratedColumn<String> contactEmail = GeneratedColumn<String>(
      'contact_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        employeeCode,
        fullName,
        department,
        roleTitle,
        basicSalary,
        employmentStatus,
        joinedDate,
        contactPhone,
        contactEmail
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employees';
  @override
  VerificationContext validateIntegrity(Insertable<Employee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employee_code')) {
      context.handle(
          _employeeCodeMeta,
          employeeCode.isAcceptableOrUnknown(
              data['employee_code']!, _employeeCodeMeta));
    } else if (isInserting) {
      context.missing(_employeeCodeMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    } else if (isInserting) {
      context.missing(_departmentMeta);
    }
    if (data.containsKey('role_title')) {
      context.handle(_roleTitleMeta,
          roleTitle.isAcceptableOrUnknown(data['role_title']!, _roleTitleMeta));
    } else if (isInserting) {
      context.missing(_roleTitleMeta);
    }
    if (data.containsKey('basic_salary')) {
      context.handle(
          _basicSalaryMeta,
          basicSalary.isAcceptableOrUnknown(
              data['basic_salary']!, _basicSalaryMeta));
    } else if (isInserting) {
      context.missing(_basicSalaryMeta);
    }
    if (data.containsKey('employment_status')) {
      context.handle(
          _employmentStatusMeta,
          employmentStatus.isAcceptableOrUnknown(
              data['employment_status']!, _employmentStatusMeta));
    } else if (isInserting) {
      context.missing(_employmentStatusMeta);
    }
    if (data.containsKey('joined_date')) {
      context.handle(
          _joinedDateMeta,
          joinedDate.isAcceptableOrUnknown(
              data['joined_date']!, _joinedDateMeta));
    } else if (isInserting) {
      context.missing(_joinedDateMeta);
    }
    if (data.containsKey('contact_phone')) {
      context.handle(
          _contactPhoneMeta,
          contactPhone.isAcceptableOrUnknown(
              data['contact_phone']!, _contactPhoneMeta));
    }
    if (data.containsKey('contact_email')) {
      context.handle(
          _contactEmailMeta,
          contactEmail.isAcceptableOrUnknown(
              data['contact_email']!, _contactEmailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Employee(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employeeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_code'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      department: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}department'])!,
      roleTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_title'])!,
      basicSalary: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}basic_salary'])!,
      employmentStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}employment_status'])!,
      joinedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joined_date'])!,
      contactPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_phone']),
      contactEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_email']),
    );
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(attachedDatabase, alias);
  }
}

class Employee extends DataClass implements Insertable<Employee> {
  final String id;
  final String employeeCode;
  final String fullName;
  final String department;
  final String roleTitle;
  final int basicSalary;
  final String employmentStatus;
  final DateTime joinedDate;
  final String? contactPhone;
  final String? contactEmail;
  const Employee(
      {required this.id,
      required this.employeeCode,
      required this.fullName,
      required this.department,
      required this.roleTitle,
      required this.basicSalary,
      required this.employmentStatus,
      required this.joinedDate,
      this.contactPhone,
      this.contactEmail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employee_code'] = Variable<String>(employeeCode);
    map['full_name'] = Variable<String>(fullName);
    map['department'] = Variable<String>(department);
    map['role_title'] = Variable<String>(roleTitle);
    map['basic_salary'] = Variable<int>(basicSalary);
    map['employment_status'] = Variable<String>(employmentStatus);
    map['joined_date'] = Variable<DateTime>(joinedDate);
    if (!nullToAbsent || contactPhone != null) {
      map['contact_phone'] = Variable<String>(contactPhone);
    }
    if (!nullToAbsent || contactEmail != null) {
      map['contact_email'] = Variable<String>(contactEmail);
    }
    return map;
  }

  EmployeesCompanion toCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      id: Value(id),
      employeeCode: Value(employeeCode),
      fullName: Value(fullName),
      department: Value(department),
      roleTitle: Value(roleTitle),
      basicSalary: Value(basicSalary),
      employmentStatus: Value(employmentStatus),
      joinedDate: Value(joinedDate),
      contactPhone: contactPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPhone),
      contactEmail: contactEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(contactEmail),
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employee(
      id: serializer.fromJson<String>(json['id']),
      employeeCode: serializer.fromJson<String>(json['employeeCode']),
      fullName: serializer.fromJson<String>(json['fullName']),
      department: serializer.fromJson<String>(json['department']),
      roleTitle: serializer.fromJson<String>(json['roleTitle']),
      basicSalary: serializer.fromJson<int>(json['basicSalary']),
      employmentStatus: serializer.fromJson<String>(json['employmentStatus']),
      joinedDate: serializer.fromJson<DateTime>(json['joinedDate']),
      contactPhone: serializer.fromJson<String?>(json['contactPhone']),
      contactEmail: serializer.fromJson<String?>(json['contactEmail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employeeCode': serializer.toJson<String>(employeeCode),
      'fullName': serializer.toJson<String>(fullName),
      'department': serializer.toJson<String>(department),
      'roleTitle': serializer.toJson<String>(roleTitle),
      'basicSalary': serializer.toJson<int>(basicSalary),
      'employmentStatus': serializer.toJson<String>(employmentStatus),
      'joinedDate': serializer.toJson<DateTime>(joinedDate),
      'contactPhone': serializer.toJson<String?>(contactPhone),
      'contactEmail': serializer.toJson<String?>(contactEmail),
    };
  }

  Employee copyWith(
          {String? id,
          String? employeeCode,
          String? fullName,
          String? department,
          String? roleTitle,
          int? basicSalary,
          String? employmentStatus,
          DateTime? joinedDate,
          Value<String?> contactPhone = const Value.absent(),
          Value<String?> contactEmail = const Value.absent()}) =>
      Employee(
        id: id ?? this.id,
        employeeCode: employeeCode ?? this.employeeCode,
        fullName: fullName ?? this.fullName,
        department: department ?? this.department,
        roleTitle: roleTitle ?? this.roleTitle,
        basicSalary: basicSalary ?? this.basicSalary,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        joinedDate: joinedDate ?? this.joinedDate,
        contactPhone:
            contactPhone.present ? contactPhone.value : this.contactPhone,
        contactEmail:
            contactEmail.present ? contactEmail.value : this.contactEmail,
      );
  Employee copyWithCompanion(EmployeesCompanion data) {
    return Employee(
      id: data.id.present ? data.id.value : this.id,
      employeeCode: data.employeeCode.present
          ? data.employeeCode.value
          : this.employeeCode,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      department:
          data.department.present ? data.department.value : this.department,
      roleTitle: data.roleTitle.present ? data.roleTitle.value : this.roleTitle,
      basicSalary:
          data.basicSalary.present ? data.basicSalary.value : this.basicSalary,
      employmentStatus: data.employmentStatus.present
          ? data.employmentStatus.value
          : this.employmentStatus,
      joinedDate:
          data.joinedDate.present ? data.joinedDate.value : this.joinedDate,
      contactPhone: data.contactPhone.present
          ? data.contactPhone.value
          : this.contactPhone,
      contactEmail: data.contactEmail.present
          ? data.contactEmail.value
          : this.contactEmail,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('id: $id, ')
          ..write('employeeCode: $employeeCode, ')
          ..write('fullName: $fullName, ')
          ..write('department: $department, ')
          ..write('roleTitle: $roleTitle, ')
          ..write('basicSalary: $basicSalary, ')
          ..write('employmentStatus: $employmentStatus, ')
          ..write('joinedDate: $joinedDate, ')
          ..write('contactPhone: $contactPhone, ')
          ..write('contactEmail: $contactEmail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      employeeCode,
      fullName,
      department,
      roleTitle,
      basicSalary,
      employmentStatus,
      joinedDate,
      contactPhone,
      contactEmail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employee &&
          other.id == this.id &&
          other.employeeCode == this.employeeCode &&
          other.fullName == this.fullName &&
          other.department == this.department &&
          other.roleTitle == this.roleTitle &&
          other.basicSalary == this.basicSalary &&
          other.employmentStatus == this.employmentStatus &&
          other.joinedDate == this.joinedDate &&
          other.contactPhone == this.contactPhone &&
          other.contactEmail == this.contactEmail);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<String> id;
  final Value<String> employeeCode;
  final Value<String> fullName;
  final Value<String> department;
  final Value<String> roleTitle;
  final Value<int> basicSalary;
  final Value<String> employmentStatus;
  final Value<DateTime> joinedDate;
  final Value<String?> contactPhone;
  final Value<String?> contactEmail;
  final Value<int> rowid;
  const EmployeesCompanion({
    this.id = const Value.absent(),
    this.employeeCode = const Value.absent(),
    this.fullName = const Value.absent(),
    this.department = const Value.absent(),
    this.roleTitle = const Value.absent(),
    this.basicSalary = const Value.absent(),
    this.employmentStatus = const Value.absent(),
    this.joinedDate = const Value.absent(),
    this.contactPhone = const Value.absent(),
    this.contactEmail = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmployeesCompanion.insert({
    required String id,
    required String employeeCode,
    required String fullName,
    required String department,
    required String roleTitle,
    required int basicSalary,
    required String employmentStatus,
    required DateTime joinedDate,
    this.contactPhone = const Value.absent(),
    this.contactEmail = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employeeCode = Value(employeeCode),
        fullName = Value(fullName),
        department = Value(department),
        roleTitle = Value(roleTitle),
        basicSalary = Value(basicSalary),
        employmentStatus = Value(employmentStatus),
        joinedDate = Value(joinedDate);
  static Insertable<Employee> custom({
    Expression<String>? id,
    Expression<String>? employeeCode,
    Expression<String>? fullName,
    Expression<String>? department,
    Expression<String>? roleTitle,
    Expression<int>? basicSalary,
    Expression<String>? employmentStatus,
    Expression<DateTime>? joinedDate,
    Expression<String>? contactPhone,
    Expression<String>? contactEmail,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeCode != null) 'employee_code': employeeCode,
      if (fullName != null) 'full_name': fullName,
      if (department != null) 'department': department,
      if (roleTitle != null) 'role_title': roleTitle,
      if (basicSalary != null) 'basic_salary': basicSalary,
      if (employmentStatus != null) 'employment_status': employmentStatus,
      if (joinedDate != null) 'joined_date': joinedDate,
      if (contactPhone != null) 'contact_phone': contactPhone,
      if (contactEmail != null) 'contact_email': contactEmail,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmployeesCompanion copyWith(
      {Value<String>? id,
      Value<String>? employeeCode,
      Value<String>? fullName,
      Value<String>? department,
      Value<String>? roleTitle,
      Value<int>? basicSalary,
      Value<String>? employmentStatus,
      Value<DateTime>? joinedDate,
      Value<String?>? contactPhone,
      Value<String?>? contactEmail,
      Value<int>? rowid}) {
    return EmployeesCompanion(
      id: id ?? this.id,
      employeeCode: employeeCode ?? this.employeeCode,
      fullName: fullName ?? this.fullName,
      department: department ?? this.department,
      roleTitle: roleTitle ?? this.roleTitle,
      basicSalary: basicSalary ?? this.basicSalary,
      employmentStatus: employmentStatus ?? this.employmentStatus,
      joinedDate: joinedDate ?? this.joinedDate,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employeeCode.present) {
      map['employee_code'] = Variable<String>(employeeCode.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (roleTitle.present) {
      map['role_title'] = Variable<String>(roleTitle.value);
    }
    if (basicSalary.present) {
      map['basic_salary'] = Variable<int>(basicSalary.value);
    }
    if (employmentStatus.present) {
      map['employment_status'] = Variable<String>(employmentStatus.value);
    }
    if (joinedDate.present) {
      map['joined_date'] = Variable<DateTime>(joinedDate.value);
    }
    if (contactPhone.present) {
      map['contact_phone'] = Variable<String>(contactPhone.value);
    }
    if (contactEmail.present) {
      map['contact_email'] = Variable<String>(contactEmail.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesCompanion(')
          ..write('id: $id, ')
          ..write('employeeCode: $employeeCode, ')
          ..write('fullName: $fullName, ')
          ..write('department: $department, ')
          ..write('roleTitle: $roleTitle, ')
          ..write('basicSalary: $basicSalary, ')
          ..write('employmentStatus: $employmentStatus, ')
          ..write('joinedDate: $joinedDate, ')
          ..write('contactPhone: $contactPhone, ')
          ..write('contactEmail: $contactEmail, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTable extends Attendance
    with TableInfo<$AttendanceTable, AttendanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _checkInTimeMeta =
      const VerificationMeta('checkInTime');
  @override
  late final GeneratedColumn<DateTime> checkInTime = GeneratedColumn<DateTime>(
      'check_in_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _checkOutTimeMeta =
      const VerificationMeta('checkOutTime');
  @override
  late final GeneratedColumn<DateTime> checkOutTime = GeneratedColumn<DateTime>(
      'check_out_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lateMinutesMeta =
      const VerificationMeta('lateMinutes');
  @override
  late final GeneratedColumn<int> lateMinutes = GeneratedColumn<int>(
      'late_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, employeeId, date, status, checkInTime, checkOutTime, lateMinutes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance';
  @override
  VerificationContext validateIntegrity(Insertable<AttendanceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('check_in_time')) {
      context.handle(
          _checkInTimeMeta,
          checkInTime.isAcceptableOrUnknown(
              data['check_in_time']!, _checkInTimeMeta));
    }
    if (data.containsKey('check_out_time')) {
      context.handle(
          _checkOutTimeMeta,
          checkOutTime.isAcceptableOrUnknown(
              data['check_out_time']!, _checkOutTimeMeta));
    }
    if (data.containsKey('late_minutes')) {
      context.handle(
          _lateMinutesMeta,
          lateMinutes.isAcceptableOrUnknown(
              data['late_minutes']!, _lateMinutesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      checkInTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}check_in_time']),
      checkOutTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}check_out_time']),
      lateMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}late_minutes'])!,
    );
  }

  @override
  $AttendanceTable createAlias(String alias) {
    return $AttendanceTable(attachedDatabase, alias);
  }
}

class AttendanceData extends DataClass implements Insertable<AttendanceData> {
  final String id;
  final String employeeId;
  final DateTime date;
  final String status;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final int lateMinutes;
  const AttendanceData(
      {required this.id,
      required this.employeeId,
      required this.date,
      required this.status,
      this.checkInTime,
      this.checkOutTime,
      required this.lateMinutes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employee_id'] = Variable<String>(employeeId);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || checkInTime != null) {
      map['check_in_time'] = Variable<DateTime>(checkInTime);
    }
    if (!nullToAbsent || checkOutTime != null) {
      map['check_out_time'] = Variable<DateTime>(checkOutTime);
    }
    map['late_minutes'] = Variable<int>(lateMinutes);
    return map;
  }

  AttendanceCompanion toCompanion(bool nullToAbsent) {
    return AttendanceCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      date: Value(date),
      status: Value(status),
      checkInTime: checkInTime == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInTime),
      checkOutTime: checkOutTime == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOutTime),
      lateMinutes: Value(lateMinutes),
    );
  }

  factory AttendanceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceData(
      id: serializer.fromJson<String>(json['id']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
      checkInTime: serializer.fromJson<DateTime?>(json['checkInTime']),
      checkOutTime: serializer.fromJson<DateTime?>(json['checkOutTime']),
      lateMinutes: serializer.fromJson<int>(json['lateMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employeeId': serializer.toJson<String>(employeeId),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
      'checkInTime': serializer.toJson<DateTime?>(checkInTime),
      'checkOutTime': serializer.toJson<DateTime?>(checkOutTime),
      'lateMinutes': serializer.toJson<int>(lateMinutes),
    };
  }

  AttendanceData copyWith(
          {String? id,
          String? employeeId,
          DateTime? date,
          String? status,
          Value<DateTime?> checkInTime = const Value.absent(),
          Value<DateTime?> checkOutTime = const Value.absent(),
          int? lateMinutes}) =>
      AttendanceData(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        date: date ?? this.date,
        status: status ?? this.status,
        checkInTime: checkInTime.present ? checkInTime.value : this.checkInTime,
        checkOutTime:
            checkOutTime.present ? checkOutTime.value : this.checkOutTime,
        lateMinutes: lateMinutes ?? this.lateMinutes,
      );
  AttendanceData copyWithCompanion(AttendanceCompanion data) {
    return AttendanceData(
      id: data.id.present ? data.id.value : this.id,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      checkInTime:
          data.checkInTime.present ? data.checkInTime.value : this.checkInTime,
      checkOutTime: data.checkOutTime.present
          ? data.checkOutTime.value
          : this.checkOutTime,
      lateMinutes:
          data.lateMinutes.present ? data.lateMinutes.value : this.lateMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceData(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('checkInTime: $checkInTime, ')
          ..write('checkOutTime: $checkOutTime, ')
          ..write('lateMinutes: $lateMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, employeeId, date, status, checkInTime, checkOutTime, lateMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceData &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.date == this.date &&
          other.status == this.status &&
          other.checkInTime == this.checkInTime &&
          other.checkOutTime == this.checkOutTime &&
          other.lateMinutes == this.lateMinutes);
}

class AttendanceCompanion extends UpdateCompanion<AttendanceData> {
  final Value<String> id;
  final Value<String> employeeId;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<DateTime?> checkInTime;
  final Value<DateTime?> checkOutTime;
  final Value<int> lateMinutes;
  final Value<int> rowid;
  const AttendanceCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.checkInTime = const Value.absent(),
    this.checkOutTime = const Value.absent(),
    this.lateMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttendanceCompanion.insert({
    required String id,
    required String employeeId,
    required DateTime date,
    required String status,
    this.checkInTime = const Value.absent(),
    this.checkOutTime = const Value.absent(),
    this.lateMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employeeId = Value(employeeId),
        date = Value(date),
        status = Value(status);
  static Insertable<AttendanceData> custom({
    Expression<String>? id,
    Expression<String>? employeeId,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<DateTime>? checkInTime,
    Expression<DateTime>? checkOutTime,
    Expression<int>? lateMinutes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (checkInTime != null) 'check_in_time': checkInTime,
      if (checkOutTime != null) 'check_out_time': checkOutTime,
      if (lateMinutes != null) 'late_minutes': lateMinutes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttendanceCompanion copyWith(
      {Value<String>? id,
      Value<String>? employeeId,
      Value<DateTime>? date,
      Value<String>? status,
      Value<DateTime?>? checkInTime,
      Value<DateTime?>? checkOutTime,
      Value<int>? lateMinutes,
      Value<int>? rowid}) {
    return AttendanceCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      date: date ?? this.date,
      status: status ?? this.status,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      lateMinutes: lateMinutes ?? this.lateMinutes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (checkInTime.present) {
      map['check_in_time'] = Variable<DateTime>(checkInTime.value);
    }
    if (checkOutTime.present) {
      map['check_out_time'] = Variable<DateTime>(checkOutTime.value);
    }
    if (lateMinutes.present) {
      map['late_minutes'] = Variable<int>(lateMinutes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('checkInTime: $checkInTime, ')
          ..write('checkOutTime: $checkOutTime, ')
          ..write('lateMinutes: $lateMinutes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LeaveRequestsTable extends LeaveRequests
    with TableInfo<$LeaveRequestsTable, LeaveRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LeaveRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _leaveTypeMeta =
      const VerificationMeta('leaveType');
  @override
  late final GeneratedColumn<String> leaveType = GeneratedColumn<String>(
      'leave_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fromDateMeta =
      const VerificationMeta('fromDate');
  @override
  late final GeneratedColumn<DateTime> fromDate = GeneratedColumn<DateTime>(
      'from_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _toDateMeta = const VerificationMeta('toDate');
  @override
  late final GeneratedColumn<DateTime> toDate = GeneratedColumn<DateTime>(
      'to_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _daysMeta = const VerificationMeta('days');
  @override
  late final GeneratedColumn<int> days = GeneratedColumn<int>(
      'days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, employeeId, leaveType, fromDate, toDate, days, status, reason];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'leave_requests';
  @override
  VerificationContext validateIntegrity(Insertable<LeaveRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('leave_type')) {
      context.handle(_leaveTypeMeta,
          leaveType.isAcceptableOrUnknown(data['leave_type']!, _leaveTypeMeta));
    } else if (isInserting) {
      context.missing(_leaveTypeMeta);
    }
    if (data.containsKey('from_date')) {
      context.handle(_fromDateMeta,
          fromDate.isAcceptableOrUnknown(data['from_date']!, _fromDateMeta));
    } else if (isInserting) {
      context.missing(_fromDateMeta);
    }
    if (data.containsKey('to_date')) {
      context.handle(_toDateMeta,
          toDate.isAcceptableOrUnknown(data['to_date']!, _toDateMeta));
    } else if (isInserting) {
      context.missing(_toDateMeta);
    }
    if (data.containsKey('days')) {
      context.handle(
          _daysMeta, days.isAcceptableOrUnknown(data['days']!, _daysMeta));
    } else if (isInserting) {
      context.missing(_daysMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LeaveRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LeaveRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      leaveType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leave_type'])!,
      fromDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}from_date'])!,
      toDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}to_date'])!,
      days: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}days'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason']),
    );
  }

  @override
  $LeaveRequestsTable createAlias(String alias) {
    return $LeaveRequestsTable(attachedDatabase, alias);
  }
}

class LeaveRequest extends DataClass implements Insertable<LeaveRequest> {
  final String id;
  final String employeeId;
  final String leaveType;
  final DateTime fromDate;
  final DateTime toDate;
  final int days;
  final String status;
  final String? reason;
  const LeaveRequest(
      {required this.id,
      required this.employeeId,
      required this.leaveType,
      required this.fromDate,
      required this.toDate,
      required this.days,
      required this.status,
      this.reason});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employee_id'] = Variable<String>(employeeId);
    map['leave_type'] = Variable<String>(leaveType);
    map['from_date'] = Variable<DateTime>(fromDate);
    map['to_date'] = Variable<DateTime>(toDate);
    map['days'] = Variable<int>(days);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    return map;
  }

  LeaveRequestsCompanion toCompanion(bool nullToAbsent) {
    return LeaveRequestsCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      leaveType: Value(leaveType),
      fromDate: Value(fromDate),
      toDate: Value(toDate),
      days: Value(days),
      status: Value(status),
      reason:
          reason == null && nullToAbsent ? const Value.absent() : Value(reason),
    );
  }

  factory LeaveRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LeaveRequest(
      id: serializer.fromJson<String>(json['id']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      leaveType: serializer.fromJson<String>(json['leaveType']),
      fromDate: serializer.fromJson<DateTime>(json['fromDate']),
      toDate: serializer.fromJson<DateTime>(json['toDate']),
      days: serializer.fromJson<int>(json['days']),
      status: serializer.fromJson<String>(json['status']),
      reason: serializer.fromJson<String?>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employeeId': serializer.toJson<String>(employeeId),
      'leaveType': serializer.toJson<String>(leaveType),
      'fromDate': serializer.toJson<DateTime>(fromDate),
      'toDate': serializer.toJson<DateTime>(toDate),
      'days': serializer.toJson<int>(days),
      'status': serializer.toJson<String>(status),
      'reason': serializer.toJson<String?>(reason),
    };
  }

  LeaveRequest copyWith(
          {String? id,
          String? employeeId,
          String? leaveType,
          DateTime? fromDate,
          DateTime? toDate,
          int? days,
          String? status,
          Value<String?> reason = const Value.absent()}) =>
      LeaveRequest(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        leaveType: leaveType ?? this.leaveType,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        days: days ?? this.days,
        status: status ?? this.status,
        reason: reason.present ? reason.value : this.reason,
      );
  LeaveRequest copyWithCompanion(LeaveRequestsCompanion data) {
    return LeaveRequest(
      id: data.id.present ? data.id.value : this.id,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      leaveType: data.leaveType.present ? data.leaveType.value : this.leaveType,
      fromDate: data.fromDate.present ? data.fromDate.value : this.fromDate,
      toDate: data.toDate.present ? data.toDate.value : this.toDate,
      days: data.days.present ? data.days.value : this.days,
      status: data.status.present ? data.status.value : this.status,
      reason: data.reason.present ? data.reason.value : this.reason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LeaveRequest(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('leaveType: $leaveType, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate, ')
          ..write('days: $days, ')
          ..write('status: $status, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, employeeId, leaveType, fromDate, toDate, days, status, reason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LeaveRequest &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.leaveType == this.leaveType &&
          other.fromDate == this.fromDate &&
          other.toDate == this.toDate &&
          other.days == this.days &&
          other.status == this.status &&
          other.reason == this.reason);
}

class LeaveRequestsCompanion extends UpdateCompanion<LeaveRequest> {
  final Value<String> id;
  final Value<String> employeeId;
  final Value<String> leaveType;
  final Value<DateTime> fromDate;
  final Value<DateTime> toDate;
  final Value<int> days;
  final Value<String> status;
  final Value<String?> reason;
  final Value<int> rowid;
  const LeaveRequestsCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.leaveType = const Value.absent(),
    this.fromDate = const Value.absent(),
    this.toDate = const Value.absent(),
    this.days = const Value.absent(),
    this.status = const Value.absent(),
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LeaveRequestsCompanion.insert({
    required String id,
    required String employeeId,
    required String leaveType,
    required DateTime fromDate,
    required DateTime toDate,
    required int days,
    this.status = const Value.absent(),
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employeeId = Value(employeeId),
        leaveType = Value(leaveType),
        fromDate = Value(fromDate),
        toDate = Value(toDate),
        days = Value(days);
  static Insertable<LeaveRequest> custom({
    Expression<String>? id,
    Expression<String>? employeeId,
    Expression<String>? leaveType,
    Expression<DateTime>? fromDate,
    Expression<DateTime>? toDate,
    Expression<int>? days,
    Expression<String>? status,
    Expression<String>? reason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (leaveType != null) 'leave_type': leaveType,
      if (fromDate != null) 'from_date': fromDate,
      if (toDate != null) 'to_date': toDate,
      if (days != null) 'days': days,
      if (status != null) 'status': status,
      if (reason != null) 'reason': reason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LeaveRequestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? employeeId,
      Value<String>? leaveType,
      Value<DateTime>? fromDate,
      Value<DateTime>? toDate,
      Value<int>? days,
      Value<String>? status,
      Value<String?>? reason,
      Value<int>? rowid}) {
    return LeaveRequestsCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      leaveType: leaveType ?? this.leaveType,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      days: days ?? this.days,
      status: status ?? this.status,
      reason: reason ?? this.reason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (leaveType.present) {
      map['leave_type'] = Variable<String>(leaveType.value);
    }
    if (fromDate.present) {
      map['from_date'] = Variable<DateTime>(fromDate.value);
    }
    if (toDate.present) {
      map['to_date'] = Variable<DateTime>(toDate.value);
    }
    if (days.present) {
      map['days'] = Variable<int>(days.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LeaveRequestsCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('leaveType: $leaveType, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate, ')
          ..write('days: $days, ')
          ..write('status: $status, ')
          ..write('reason: $reason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LeaveBalancesTable extends LeaveBalances
    with TableInfo<$LeaveBalancesTable, LeaveBalance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LeaveBalancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _leaveTypeMeta =
      const VerificationMeta('leaveType');
  @override
  late final GeneratedColumn<String> leaveType = GeneratedColumn<String>(
      'leave_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fiscalYearMeta =
      const VerificationMeta('fiscalYear');
  @override
  late final GeneratedColumn<String> fiscalYear = GeneratedColumn<String>(
      'fiscal_year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _balanceDaysMeta =
      const VerificationMeta('balanceDays');
  @override
  late final GeneratedColumn<int> balanceDays = GeneratedColumn<int>(
      'balance_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, employeeId, leaveType, fiscalYear, balanceDays];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'leave_balances';
  @override
  VerificationContext validateIntegrity(Insertable<LeaveBalance> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('leave_type')) {
      context.handle(_leaveTypeMeta,
          leaveType.isAcceptableOrUnknown(data['leave_type']!, _leaveTypeMeta));
    } else if (isInserting) {
      context.missing(_leaveTypeMeta);
    }
    if (data.containsKey('fiscal_year')) {
      context.handle(
          _fiscalYearMeta,
          fiscalYear.isAcceptableOrUnknown(
              data['fiscal_year']!, _fiscalYearMeta));
    } else if (isInserting) {
      context.missing(_fiscalYearMeta);
    }
    if (data.containsKey('balance_days')) {
      context.handle(
          _balanceDaysMeta,
          balanceDays.isAcceptableOrUnknown(
              data['balance_days']!, _balanceDaysMeta));
    } else if (isInserting) {
      context.missing(_balanceDaysMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LeaveBalance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LeaveBalance(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      leaveType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leave_type'])!,
      fiscalYear: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fiscal_year'])!,
      balanceDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}balance_days'])!,
    );
  }

  @override
  $LeaveBalancesTable createAlias(String alias) {
    return $LeaveBalancesTable(attachedDatabase, alias);
  }
}

class LeaveBalance extends DataClass implements Insertable<LeaveBalance> {
  final String id;
  final String employeeId;
  final String leaveType;
  final String fiscalYear;
  final int balanceDays;
  const LeaveBalance(
      {required this.id,
      required this.employeeId,
      required this.leaveType,
      required this.fiscalYear,
      required this.balanceDays});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employee_id'] = Variable<String>(employeeId);
    map['leave_type'] = Variable<String>(leaveType);
    map['fiscal_year'] = Variable<String>(fiscalYear);
    map['balance_days'] = Variable<int>(balanceDays);
    return map;
  }

  LeaveBalancesCompanion toCompanion(bool nullToAbsent) {
    return LeaveBalancesCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      leaveType: Value(leaveType),
      fiscalYear: Value(fiscalYear),
      balanceDays: Value(balanceDays),
    );
  }

  factory LeaveBalance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LeaveBalance(
      id: serializer.fromJson<String>(json['id']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      leaveType: serializer.fromJson<String>(json['leaveType']),
      fiscalYear: serializer.fromJson<String>(json['fiscalYear']),
      balanceDays: serializer.fromJson<int>(json['balanceDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employeeId': serializer.toJson<String>(employeeId),
      'leaveType': serializer.toJson<String>(leaveType),
      'fiscalYear': serializer.toJson<String>(fiscalYear),
      'balanceDays': serializer.toJson<int>(balanceDays),
    };
  }

  LeaveBalance copyWith(
          {String? id,
          String? employeeId,
          String? leaveType,
          String? fiscalYear,
          int? balanceDays}) =>
      LeaveBalance(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        leaveType: leaveType ?? this.leaveType,
        fiscalYear: fiscalYear ?? this.fiscalYear,
        balanceDays: balanceDays ?? this.balanceDays,
      );
  LeaveBalance copyWithCompanion(LeaveBalancesCompanion data) {
    return LeaveBalance(
      id: data.id.present ? data.id.value : this.id,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      leaveType: data.leaveType.present ? data.leaveType.value : this.leaveType,
      fiscalYear:
          data.fiscalYear.present ? data.fiscalYear.value : this.fiscalYear,
      balanceDays:
          data.balanceDays.present ? data.balanceDays.value : this.balanceDays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LeaveBalance(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('leaveType: $leaveType, ')
          ..write('fiscalYear: $fiscalYear, ')
          ..write('balanceDays: $balanceDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, employeeId, leaveType, fiscalYear, balanceDays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LeaveBalance &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.leaveType == this.leaveType &&
          other.fiscalYear == this.fiscalYear &&
          other.balanceDays == this.balanceDays);
}

class LeaveBalancesCompanion extends UpdateCompanion<LeaveBalance> {
  final Value<String> id;
  final Value<String> employeeId;
  final Value<String> leaveType;
  final Value<String> fiscalYear;
  final Value<int> balanceDays;
  final Value<int> rowid;
  const LeaveBalancesCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.leaveType = const Value.absent(),
    this.fiscalYear = const Value.absent(),
    this.balanceDays = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LeaveBalancesCompanion.insert({
    required String id,
    required String employeeId,
    required String leaveType,
    required String fiscalYear,
    required int balanceDays,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employeeId = Value(employeeId),
        leaveType = Value(leaveType),
        fiscalYear = Value(fiscalYear),
        balanceDays = Value(balanceDays);
  static Insertable<LeaveBalance> custom({
    Expression<String>? id,
    Expression<String>? employeeId,
    Expression<String>? leaveType,
    Expression<String>? fiscalYear,
    Expression<int>? balanceDays,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (leaveType != null) 'leave_type': leaveType,
      if (fiscalYear != null) 'fiscal_year': fiscalYear,
      if (balanceDays != null) 'balance_days': balanceDays,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LeaveBalancesCompanion copyWith(
      {Value<String>? id,
      Value<String>? employeeId,
      Value<String>? leaveType,
      Value<String>? fiscalYear,
      Value<int>? balanceDays,
      Value<int>? rowid}) {
    return LeaveBalancesCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      leaveType: leaveType ?? this.leaveType,
      fiscalYear: fiscalYear ?? this.fiscalYear,
      balanceDays: balanceDays ?? this.balanceDays,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (leaveType.present) {
      map['leave_type'] = Variable<String>(leaveType.value);
    }
    if (fiscalYear.present) {
      map['fiscal_year'] = Variable<String>(fiscalYear.value);
    }
    if (balanceDays.present) {
      map['balance_days'] = Variable<int>(balanceDays.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LeaveBalancesCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('leaveType: $leaveType, ')
          ..write('fiscalYear: $fiscalYear, ')
          ..write('balanceDays: $balanceDays, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PayrollRunsTable extends PayrollRuns
    with TableInfo<$PayrollRunsTable, PayrollRun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayrollRunsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _periodMonthMeta =
      const VerificationMeta('periodMonth');
  @override
  late final GeneratedColumn<int> periodMonth = GeneratedColumn<int>(
      'period_month', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _periodYearMeta =
      const VerificationMeta('periodYear');
  @override
  late final GeneratedColumn<int> periodYear = GeneratedColumn<int>(
      'period_year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _grossPayrollMeta =
      const VerificationMeta('grossPayroll');
  @override
  late final GeneratedColumn<int> grossPayroll = GeneratedColumn<int>(
      'gross_payroll', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _allowancesMeta =
      const VerificationMeta('allowances');
  @override
  late final GeneratedColumn<int> allowances = GeneratedColumn<int>(
      'allowances', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _overtimeMeta =
      const VerificationMeta('overtime');
  @override
  late final GeneratedColumn<int> overtime = GeneratedColumn<int>(
      'overtime', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deductionsMeta =
      const VerificationMeta('deductions');
  @override
  late final GeneratedColumn<int> deductions = GeneratedColumn<int>(
      'deductions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _netPayMeta = const VerificationMeta('netPay');
  @override
  late final GeneratedColumn<int> netPay = GeneratedColumn<int>(
      'net_pay', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
      'generated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        periodMonth,
        periodYear,
        status,
        grossPayroll,
        allowances,
        overtime,
        deductions,
        netPay,
        generatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payroll_runs';
  @override
  VerificationContext validateIntegrity(Insertable<PayrollRun> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('period_month')) {
      context.handle(
          _periodMonthMeta,
          periodMonth.isAcceptableOrUnknown(
              data['period_month']!, _periodMonthMeta));
    } else if (isInserting) {
      context.missing(_periodMonthMeta);
    }
    if (data.containsKey('period_year')) {
      context.handle(
          _periodYearMeta,
          periodYear.isAcceptableOrUnknown(
              data['period_year']!, _periodYearMeta));
    } else if (isInserting) {
      context.missing(_periodYearMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('gross_payroll')) {
      context.handle(
          _grossPayrollMeta,
          grossPayroll.isAcceptableOrUnknown(
              data['gross_payroll']!, _grossPayrollMeta));
    } else if (isInserting) {
      context.missing(_grossPayrollMeta);
    }
    if (data.containsKey('allowances')) {
      context.handle(
          _allowancesMeta,
          allowances.isAcceptableOrUnknown(
              data['allowances']!, _allowancesMeta));
    } else if (isInserting) {
      context.missing(_allowancesMeta);
    }
    if (data.containsKey('overtime')) {
      context.handle(_overtimeMeta,
          overtime.isAcceptableOrUnknown(data['overtime']!, _overtimeMeta));
    } else if (isInserting) {
      context.missing(_overtimeMeta);
    }
    if (data.containsKey('deductions')) {
      context.handle(
          _deductionsMeta,
          deductions.isAcceptableOrUnknown(
              data['deductions']!, _deductionsMeta));
    } else if (isInserting) {
      context.missing(_deductionsMeta);
    }
    if (data.containsKey('net_pay')) {
      context.handle(_netPayMeta,
          netPay.isAcceptableOrUnknown(data['net_pay']!, _netPayMeta));
    } else if (isInserting) {
      context.missing(_netPayMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PayrollRun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PayrollRun(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      periodMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_month'])!,
      periodYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_year'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      grossPayroll: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gross_payroll'])!,
      allowances: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}allowances'])!,
      overtime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}overtime'])!,
      deductions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deductions'])!,
      netPay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}net_pay'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}generated_at'])!,
    );
  }

  @override
  $PayrollRunsTable createAlias(String alias) {
    return $PayrollRunsTable(attachedDatabase, alias);
  }
}

class PayrollRun extends DataClass implements Insertable<PayrollRun> {
  final String id;
  final int periodMonth;
  final int periodYear;
  final String status;
  final int grossPayroll;
  final int allowances;
  final int overtime;
  final int deductions;
  final int netPay;
  final DateTime generatedAt;
  const PayrollRun(
      {required this.id,
      required this.periodMonth,
      required this.periodYear,
      required this.status,
      required this.grossPayroll,
      required this.allowances,
      required this.overtime,
      required this.deductions,
      required this.netPay,
      required this.generatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['period_month'] = Variable<int>(periodMonth);
    map['period_year'] = Variable<int>(periodYear);
    map['status'] = Variable<String>(status);
    map['gross_payroll'] = Variable<int>(grossPayroll);
    map['allowances'] = Variable<int>(allowances);
    map['overtime'] = Variable<int>(overtime);
    map['deductions'] = Variable<int>(deductions);
    map['net_pay'] = Variable<int>(netPay);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    return map;
  }

  PayrollRunsCompanion toCompanion(bool nullToAbsent) {
    return PayrollRunsCompanion(
      id: Value(id),
      periodMonth: Value(periodMonth),
      periodYear: Value(periodYear),
      status: Value(status),
      grossPayroll: Value(grossPayroll),
      allowances: Value(allowances),
      overtime: Value(overtime),
      deductions: Value(deductions),
      netPay: Value(netPay),
      generatedAt: Value(generatedAt),
    );
  }

  factory PayrollRun.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PayrollRun(
      id: serializer.fromJson<String>(json['id']),
      periodMonth: serializer.fromJson<int>(json['periodMonth']),
      periodYear: serializer.fromJson<int>(json['periodYear']),
      status: serializer.fromJson<String>(json['status']),
      grossPayroll: serializer.fromJson<int>(json['grossPayroll']),
      allowances: serializer.fromJson<int>(json['allowances']),
      overtime: serializer.fromJson<int>(json['overtime']),
      deductions: serializer.fromJson<int>(json['deductions']),
      netPay: serializer.fromJson<int>(json['netPay']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'periodMonth': serializer.toJson<int>(periodMonth),
      'periodYear': serializer.toJson<int>(periodYear),
      'status': serializer.toJson<String>(status),
      'grossPayroll': serializer.toJson<int>(grossPayroll),
      'allowances': serializer.toJson<int>(allowances),
      'overtime': serializer.toJson<int>(overtime),
      'deductions': serializer.toJson<int>(deductions),
      'netPay': serializer.toJson<int>(netPay),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
    };
  }

  PayrollRun copyWith(
          {String? id,
          int? periodMonth,
          int? periodYear,
          String? status,
          int? grossPayroll,
          int? allowances,
          int? overtime,
          int? deductions,
          int? netPay,
          DateTime? generatedAt}) =>
      PayrollRun(
        id: id ?? this.id,
        periodMonth: periodMonth ?? this.periodMonth,
        periodYear: periodYear ?? this.periodYear,
        status: status ?? this.status,
        grossPayroll: grossPayroll ?? this.grossPayroll,
        allowances: allowances ?? this.allowances,
        overtime: overtime ?? this.overtime,
        deductions: deductions ?? this.deductions,
        netPay: netPay ?? this.netPay,
        generatedAt: generatedAt ?? this.generatedAt,
      );
  PayrollRun copyWithCompanion(PayrollRunsCompanion data) {
    return PayrollRun(
      id: data.id.present ? data.id.value : this.id,
      periodMonth:
          data.periodMonth.present ? data.periodMonth.value : this.periodMonth,
      periodYear:
          data.periodYear.present ? data.periodYear.value : this.periodYear,
      status: data.status.present ? data.status.value : this.status,
      grossPayroll: data.grossPayroll.present
          ? data.grossPayroll.value
          : this.grossPayroll,
      allowances:
          data.allowances.present ? data.allowances.value : this.allowances,
      overtime: data.overtime.present ? data.overtime.value : this.overtime,
      deductions:
          data.deductions.present ? data.deductions.value : this.deductions,
      netPay: data.netPay.present ? data.netPay.value : this.netPay,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PayrollRun(')
          ..write('id: $id, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('periodYear: $periodYear, ')
          ..write('status: $status, ')
          ..write('grossPayroll: $grossPayroll, ')
          ..write('allowances: $allowances, ')
          ..write('overtime: $overtime, ')
          ..write('deductions: $deductions, ')
          ..write('netPay: $netPay, ')
          ..write('generatedAt: $generatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, periodMonth, periodYear, status,
      grossPayroll, allowances, overtime, deductions, netPay, generatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PayrollRun &&
          other.id == this.id &&
          other.periodMonth == this.periodMonth &&
          other.periodYear == this.periodYear &&
          other.status == this.status &&
          other.grossPayroll == this.grossPayroll &&
          other.allowances == this.allowances &&
          other.overtime == this.overtime &&
          other.deductions == this.deductions &&
          other.netPay == this.netPay &&
          other.generatedAt == this.generatedAt);
}

class PayrollRunsCompanion extends UpdateCompanion<PayrollRun> {
  final Value<String> id;
  final Value<int> periodMonth;
  final Value<int> periodYear;
  final Value<String> status;
  final Value<int> grossPayroll;
  final Value<int> allowances;
  final Value<int> overtime;
  final Value<int> deductions;
  final Value<int> netPay;
  final Value<DateTime> generatedAt;
  final Value<int> rowid;
  const PayrollRunsCompanion({
    this.id = const Value.absent(),
    this.periodMonth = const Value.absent(),
    this.periodYear = const Value.absent(),
    this.status = const Value.absent(),
    this.grossPayroll = const Value.absent(),
    this.allowances = const Value.absent(),
    this.overtime = const Value.absent(),
    this.deductions = const Value.absent(),
    this.netPay = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PayrollRunsCompanion.insert({
    required String id,
    required int periodMonth,
    required int periodYear,
    this.status = const Value.absent(),
    required int grossPayroll,
    required int allowances,
    required int overtime,
    required int deductions,
    required int netPay,
    required DateTime generatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        periodMonth = Value(periodMonth),
        periodYear = Value(periodYear),
        grossPayroll = Value(grossPayroll),
        allowances = Value(allowances),
        overtime = Value(overtime),
        deductions = Value(deductions),
        netPay = Value(netPay),
        generatedAt = Value(generatedAt);
  static Insertable<PayrollRun> custom({
    Expression<String>? id,
    Expression<int>? periodMonth,
    Expression<int>? periodYear,
    Expression<String>? status,
    Expression<int>? grossPayroll,
    Expression<int>? allowances,
    Expression<int>? overtime,
    Expression<int>? deductions,
    Expression<int>? netPay,
    Expression<DateTime>? generatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodMonth != null) 'period_month': periodMonth,
      if (periodYear != null) 'period_year': periodYear,
      if (status != null) 'status': status,
      if (grossPayroll != null) 'gross_payroll': grossPayroll,
      if (allowances != null) 'allowances': allowances,
      if (overtime != null) 'overtime': overtime,
      if (deductions != null) 'deductions': deductions,
      if (netPay != null) 'net_pay': netPay,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PayrollRunsCompanion copyWith(
      {Value<String>? id,
      Value<int>? periodMonth,
      Value<int>? periodYear,
      Value<String>? status,
      Value<int>? grossPayroll,
      Value<int>? allowances,
      Value<int>? overtime,
      Value<int>? deductions,
      Value<int>? netPay,
      Value<DateTime>? generatedAt,
      Value<int>? rowid}) {
    return PayrollRunsCompanion(
      id: id ?? this.id,
      periodMonth: periodMonth ?? this.periodMonth,
      periodYear: periodYear ?? this.periodYear,
      status: status ?? this.status,
      grossPayroll: grossPayroll ?? this.grossPayroll,
      allowances: allowances ?? this.allowances,
      overtime: overtime ?? this.overtime,
      deductions: deductions ?? this.deductions,
      netPay: netPay ?? this.netPay,
      generatedAt: generatedAt ?? this.generatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (periodMonth.present) {
      map['period_month'] = Variable<int>(periodMonth.value);
    }
    if (periodYear.present) {
      map['period_year'] = Variable<int>(periodYear.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (grossPayroll.present) {
      map['gross_payroll'] = Variable<int>(grossPayroll.value);
    }
    if (allowances.present) {
      map['allowances'] = Variable<int>(allowances.value);
    }
    if (overtime.present) {
      map['overtime'] = Variable<int>(overtime.value);
    }
    if (deductions.present) {
      map['deductions'] = Variable<int>(deductions.value);
    }
    if (netPay.present) {
      map['net_pay'] = Variable<int>(netPay.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayrollRunsCompanion(')
          ..write('id: $id, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('periodYear: $periodYear, ')
          ..write('status: $status, ')
          ..write('grossPayroll: $grossPayroll, ')
          ..write('allowances: $allowances, ')
          ..write('overtime: $overtime, ')
          ..write('deductions: $deductions, ')
          ..write('netPay: $netPay, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PayrollItemsTable extends PayrollItems
    with TableInfo<$PayrollItemsTable, PayrollItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayrollItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payrollRunIdMeta =
      const VerificationMeta('payrollRunId');
  @override
  late final GeneratedColumn<String> payrollRunId = GeneratedColumn<String>(
      'payroll_run_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basicSalaryMeta =
      const VerificationMeta('basicSalary');
  @override
  late final GeneratedColumn<int> basicSalary = GeneratedColumn<int>(
      'basic_salary', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _allowancesMeta =
      const VerificationMeta('allowances');
  @override
  late final GeneratedColumn<int> allowances = GeneratedColumn<int>(
      'allowances', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _overtimeMeta =
      const VerificationMeta('overtime');
  @override
  late final GeneratedColumn<int> overtime = GeneratedColumn<int>(
      'overtime', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deductionsMeta =
      const VerificationMeta('deductions');
  @override
  late final GeneratedColumn<int> deductions = GeneratedColumn<int>(
      'deductions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _netPayMeta = const VerificationMeta('netPay');
  @override
  late final GeneratedColumn<int> netPay = GeneratedColumn<int>(
      'net_pay', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        payrollRunId,
        employeeId,
        basicSalary,
        allowances,
        overtime,
        deductions,
        netPay
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payroll_items';
  @override
  VerificationContext validateIntegrity(Insertable<PayrollItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payroll_run_id')) {
      context.handle(
          _payrollRunIdMeta,
          payrollRunId.isAcceptableOrUnknown(
              data['payroll_run_id']!, _payrollRunIdMeta));
    } else if (isInserting) {
      context.missing(_payrollRunIdMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('basic_salary')) {
      context.handle(
          _basicSalaryMeta,
          basicSalary.isAcceptableOrUnknown(
              data['basic_salary']!, _basicSalaryMeta));
    } else if (isInserting) {
      context.missing(_basicSalaryMeta);
    }
    if (data.containsKey('allowances')) {
      context.handle(
          _allowancesMeta,
          allowances.isAcceptableOrUnknown(
              data['allowances']!, _allowancesMeta));
    } else if (isInserting) {
      context.missing(_allowancesMeta);
    }
    if (data.containsKey('overtime')) {
      context.handle(_overtimeMeta,
          overtime.isAcceptableOrUnknown(data['overtime']!, _overtimeMeta));
    } else if (isInserting) {
      context.missing(_overtimeMeta);
    }
    if (data.containsKey('deductions')) {
      context.handle(
          _deductionsMeta,
          deductions.isAcceptableOrUnknown(
              data['deductions']!, _deductionsMeta));
    } else if (isInserting) {
      context.missing(_deductionsMeta);
    }
    if (data.containsKey('net_pay')) {
      context.handle(_netPayMeta,
          netPay.isAcceptableOrUnknown(data['net_pay']!, _netPayMeta));
    } else if (isInserting) {
      context.missing(_netPayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PayrollItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PayrollItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      payrollRunId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payroll_run_id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      basicSalary: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}basic_salary'])!,
      allowances: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}allowances'])!,
      overtime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}overtime'])!,
      deductions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deductions'])!,
      netPay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}net_pay'])!,
    );
  }

  @override
  $PayrollItemsTable createAlias(String alias) {
    return $PayrollItemsTable(attachedDatabase, alias);
  }
}

class PayrollItem extends DataClass implements Insertable<PayrollItem> {
  final String id;
  final String payrollRunId;
  final String employeeId;
  final int basicSalary;
  final int allowances;
  final int overtime;
  final int deductions;
  final int netPay;
  const PayrollItem(
      {required this.id,
      required this.payrollRunId,
      required this.employeeId,
      required this.basicSalary,
      required this.allowances,
      required this.overtime,
      required this.deductions,
      required this.netPay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payroll_run_id'] = Variable<String>(payrollRunId);
    map['employee_id'] = Variable<String>(employeeId);
    map['basic_salary'] = Variable<int>(basicSalary);
    map['allowances'] = Variable<int>(allowances);
    map['overtime'] = Variable<int>(overtime);
    map['deductions'] = Variable<int>(deductions);
    map['net_pay'] = Variable<int>(netPay);
    return map;
  }

  PayrollItemsCompanion toCompanion(bool nullToAbsent) {
    return PayrollItemsCompanion(
      id: Value(id),
      payrollRunId: Value(payrollRunId),
      employeeId: Value(employeeId),
      basicSalary: Value(basicSalary),
      allowances: Value(allowances),
      overtime: Value(overtime),
      deductions: Value(deductions),
      netPay: Value(netPay),
    );
  }

  factory PayrollItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PayrollItem(
      id: serializer.fromJson<String>(json['id']),
      payrollRunId: serializer.fromJson<String>(json['payrollRunId']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      basicSalary: serializer.fromJson<int>(json['basicSalary']),
      allowances: serializer.fromJson<int>(json['allowances']),
      overtime: serializer.fromJson<int>(json['overtime']),
      deductions: serializer.fromJson<int>(json['deductions']),
      netPay: serializer.fromJson<int>(json['netPay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'payrollRunId': serializer.toJson<String>(payrollRunId),
      'employeeId': serializer.toJson<String>(employeeId),
      'basicSalary': serializer.toJson<int>(basicSalary),
      'allowances': serializer.toJson<int>(allowances),
      'overtime': serializer.toJson<int>(overtime),
      'deductions': serializer.toJson<int>(deductions),
      'netPay': serializer.toJson<int>(netPay),
    };
  }

  PayrollItem copyWith(
          {String? id,
          String? payrollRunId,
          String? employeeId,
          int? basicSalary,
          int? allowances,
          int? overtime,
          int? deductions,
          int? netPay}) =>
      PayrollItem(
        id: id ?? this.id,
        payrollRunId: payrollRunId ?? this.payrollRunId,
        employeeId: employeeId ?? this.employeeId,
        basicSalary: basicSalary ?? this.basicSalary,
        allowances: allowances ?? this.allowances,
        overtime: overtime ?? this.overtime,
        deductions: deductions ?? this.deductions,
        netPay: netPay ?? this.netPay,
      );
  PayrollItem copyWithCompanion(PayrollItemsCompanion data) {
    return PayrollItem(
      id: data.id.present ? data.id.value : this.id,
      payrollRunId: data.payrollRunId.present
          ? data.payrollRunId.value
          : this.payrollRunId,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      basicSalary:
          data.basicSalary.present ? data.basicSalary.value : this.basicSalary,
      allowances:
          data.allowances.present ? data.allowances.value : this.allowances,
      overtime: data.overtime.present ? data.overtime.value : this.overtime,
      deductions:
          data.deductions.present ? data.deductions.value : this.deductions,
      netPay: data.netPay.present ? data.netPay.value : this.netPay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PayrollItem(')
          ..write('id: $id, ')
          ..write('payrollRunId: $payrollRunId, ')
          ..write('employeeId: $employeeId, ')
          ..write('basicSalary: $basicSalary, ')
          ..write('allowances: $allowances, ')
          ..write('overtime: $overtime, ')
          ..write('deductions: $deductions, ')
          ..write('netPay: $netPay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, payrollRunId, employeeId, basicSalary,
      allowances, overtime, deductions, netPay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PayrollItem &&
          other.id == this.id &&
          other.payrollRunId == this.payrollRunId &&
          other.employeeId == this.employeeId &&
          other.basicSalary == this.basicSalary &&
          other.allowances == this.allowances &&
          other.overtime == this.overtime &&
          other.deductions == this.deductions &&
          other.netPay == this.netPay);
}

class PayrollItemsCompanion extends UpdateCompanion<PayrollItem> {
  final Value<String> id;
  final Value<String> payrollRunId;
  final Value<String> employeeId;
  final Value<int> basicSalary;
  final Value<int> allowances;
  final Value<int> overtime;
  final Value<int> deductions;
  final Value<int> netPay;
  final Value<int> rowid;
  const PayrollItemsCompanion({
    this.id = const Value.absent(),
    this.payrollRunId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.basicSalary = const Value.absent(),
    this.allowances = const Value.absent(),
    this.overtime = const Value.absent(),
    this.deductions = const Value.absent(),
    this.netPay = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PayrollItemsCompanion.insert({
    required String id,
    required String payrollRunId,
    required String employeeId,
    required int basicSalary,
    required int allowances,
    required int overtime,
    required int deductions,
    required int netPay,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        payrollRunId = Value(payrollRunId),
        employeeId = Value(employeeId),
        basicSalary = Value(basicSalary),
        allowances = Value(allowances),
        overtime = Value(overtime),
        deductions = Value(deductions),
        netPay = Value(netPay);
  static Insertable<PayrollItem> custom({
    Expression<String>? id,
    Expression<String>? payrollRunId,
    Expression<String>? employeeId,
    Expression<int>? basicSalary,
    Expression<int>? allowances,
    Expression<int>? overtime,
    Expression<int>? deductions,
    Expression<int>? netPay,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payrollRunId != null) 'payroll_run_id': payrollRunId,
      if (employeeId != null) 'employee_id': employeeId,
      if (basicSalary != null) 'basic_salary': basicSalary,
      if (allowances != null) 'allowances': allowances,
      if (overtime != null) 'overtime': overtime,
      if (deductions != null) 'deductions': deductions,
      if (netPay != null) 'net_pay': netPay,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PayrollItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? payrollRunId,
      Value<String>? employeeId,
      Value<int>? basicSalary,
      Value<int>? allowances,
      Value<int>? overtime,
      Value<int>? deductions,
      Value<int>? netPay,
      Value<int>? rowid}) {
    return PayrollItemsCompanion(
      id: id ?? this.id,
      payrollRunId: payrollRunId ?? this.payrollRunId,
      employeeId: employeeId ?? this.employeeId,
      basicSalary: basicSalary ?? this.basicSalary,
      allowances: allowances ?? this.allowances,
      overtime: overtime ?? this.overtime,
      deductions: deductions ?? this.deductions,
      netPay: netPay ?? this.netPay,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (payrollRunId.present) {
      map['payroll_run_id'] = Variable<String>(payrollRunId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (basicSalary.present) {
      map['basic_salary'] = Variable<int>(basicSalary.value);
    }
    if (allowances.present) {
      map['allowances'] = Variable<int>(allowances.value);
    }
    if (overtime.present) {
      map['overtime'] = Variable<int>(overtime.value);
    }
    if (deductions.present) {
      map['deductions'] = Variable<int>(deductions.value);
    }
    if (netPay.present) {
      map['net_pay'] = Variable<int>(netPay.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayrollItemsCompanion(')
          ..write('id: $id, ')
          ..write('payrollRunId: $payrollRunId, ')
          ..write('employeeId: $employeeId, ')
          ..write('basicSalary: $basicSalary, ')
          ..write('allowances: $allowances, ')
          ..write('overtime: $overtime, ')
          ..write('deductions: $deductions, ')
          ..write('netPay: $netPay, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmploymentContractsTable extends EmploymentContracts
    with TableInfo<$EmploymentContractsTable, EmploymentContract> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmploymentContractsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<String> employeeId = GeneratedColumn<String>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
      'position', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contractTypeMeta =
      const VerificationMeta('contractType');
  @override
  late final GeneratedColumn<String> contractType = GeneratedColumn<String>(
      'contract_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, employeeId, position, contractType, startDate, expiryDate, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employment_contracts';
  @override
  VerificationContext validateIntegrity(Insertable<EmploymentContract> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('contract_type')) {
      context.handle(
          _contractTypeMeta,
          contractType.isAcceptableOrUnknown(
              data['contract_type']!, _contractTypeMeta));
    } else if (isInserting) {
      context.missing(_contractTypeMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmploymentContract map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmploymentContract(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_id'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}position'])!,
      contractType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contract_type'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $EmploymentContractsTable createAlias(String alias) {
    return $EmploymentContractsTable(attachedDatabase, alias);
  }
}

class EmploymentContract extends DataClass
    implements Insertable<EmploymentContract> {
  final String id;
  final String employeeId;
  final String position;
  final String contractType;
  final DateTime startDate;
  final DateTime? expiryDate;
  final String status;
  const EmploymentContract(
      {required this.id,
      required this.employeeId,
      required this.position,
      required this.contractType,
      required this.startDate,
      this.expiryDate,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employee_id'] = Variable<String>(employeeId);
    map['position'] = Variable<String>(position);
    map['contract_type'] = Variable<String>(contractType);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || expiryDate != null) {
      map['expiry_date'] = Variable<DateTime>(expiryDate);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  EmploymentContractsCompanion toCompanion(bool nullToAbsent) {
    return EmploymentContractsCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      position: Value(position),
      contractType: Value(contractType),
      startDate: Value(startDate),
      expiryDate: expiryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryDate),
      status: Value(status),
    );
  }

  factory EmploymentContract.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmploymentContract(
      id: serializer.fromJson<String>(json['id']),
      employeeId: serializer.fromJson<String>(json['employeeId']),
      position: serializer.fromJson<String>(json['position']),
      contractType: serializer.fromJson<String>(json['contractType']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      expiryDate: serializer.fromJson<DateTime?>(json['expiryDate']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employeeId': serializer.toJson<String>(employeeId),
      'position': serializer.toJson<String>(position),
      'contractType': serializer.toJson<String>(contractType),
      'startDate': serializer.toJson<DateTime>(startDate),
      'expiryDate': serializer.toJson<DateTime?>(expiryDate),
      'status': serializer.toJson<String>(status),
    };
  }

  EmploymentContract copyWith(
          {String? id,
          String? employeeId,
          String? position,
          String? contractType,
          DateTime? startDate,
          Value<DateTime?> expiryDate = const Value.absent(),
          String? status}) =>
      EmploymentContract(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        position: position ?? this.position,
        contractType: contractType ?? this.contractType,
        startDate: startDate ?? this.startDate,
        expiryDate: expiryDate.present ? expiryDate.value : this.expiryDate,
        status: status ?? this.status,
      );
  EmploymentContract copyWithCompanion(EmploymentContractsCompanion data) {
    return EmploymentContract(
      id: data.id.present ? data.id.value : this.id,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      position: data.position.present ? data.position.value : this.position,
      contractType: data.contractType.present
          ? data.contractType.value
          : this.contractType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmploymentContract(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('position: $position, ')
          ..write('contractType: $contractType, ')
          ..write('startDate: $startDate, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, employeeId, position, contractType, startDate, expiryDate, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmploymentContract &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.position == this.position &&
          other.contractType == this.contractType &&
          other.startDate == this.startDate &&
          other.expiryDate == this.expiryDate &&
          other.status == this.status);
}

class EmploymentContractsCompanion extends UpdateCompanion<EmploymentContract> {
  final Value<String> id;
  final Value<String> employeeId;
  final Value<String> position;
  final Value<String> contractType;
  final Value<DateTime> startDate;
  final Value<DateTime?> expiryDate;
  final Value<String> status;
  final Value<int> rowid;
  const EmploymentContractsCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.position = const Value.absent(),
    this.contractType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmploymentContractsCompanion.insert({
    required String id,
    required String employeeId,
    required String position,
    required String contractType,
    required DateTime startDate,
    this.expiryDate = const Value.absent(),
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employeeId = Value(employeeId),
        position = Value(position),
        contractType = Value(contractType),
        startDate = Value(startDate),
        status = Value(status);
  static Insertable<EmploymentContract> custom({
    Expression<String>? id,
    Expression<String>? employeeId,
    Expression<String>? position,
    Expression<String>? contractType,
    Expression<DateTime>? startDate,
    Expression<DateTime>? expiryDate,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (position != null) 'position': position,
      if (contractType != null) 'contract_type': contractType,
      if (startDate != null) 'start_date': startDate,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmploymentContractsCompanion copyWith(
      {Value<String>? id,
      Value<String>? employeeId,
      Value<String>? position,
      Value<String>? contractType,
      Value<DateTime>? startDate,
      Value<DateTime?>? expiryDate,
      Value<String>? status,
      Value<int>? rowid}) {
    return EmploymentContractsCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      position: position ?? this.position,
      contractType: contractType ?? this.contractType,
      startDate: startDate ?? this.startDate,
      expiryDate: expiryDate ?? this.expiryDate,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<String>(employeeId.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (contractType.present) {
      map['contract_type'] = Variable<String>(contractType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmploymentContractsCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('position: $position, ')
          ..write('contractType: $contractType, ')
          ..write('startDate: $startDate, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssetsTable extends Assets with TableInfo<$AssetsTable, Asset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assetCodeMeta =
      const VerificationMeta('assetCode');
  @override
  late final GeneratedColumn<String> assetCode = GeneratedColumn<String>(
      'asset_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _purchaseCostMeta =
      const VerificationMeta('purchaseCost');
  @override
  late final GeneratedColumn<int> purchaseCost = GeneratedColumn<int>(
      'purchase_cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _depreciationMethodMeta =
      const VerificationMeta('depreciationMethod');
  @override
  late final GeneratedColumn<String> depreciationMethod =
      GeneratedColumn<String>('depreciation_method', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usefulLifeYearsMeta =
      const VerificationMeta('usefulLifeYears');
  @override
  late final GeneratedColumn<int> usefulLifeYears = GeneratedColumn<int>(
      'useful_life_years', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _salvageValueMeta =
      const VerificationMeta('salvageValue');
  @override
  late final GeneratedColumn<int> salvageValue = GeneratedColumn<int>(
      'salvage_value', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('in_use'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assetCode,
        name,
        category,
        purchaseDate,
        purchaseCost,
        depreciationMethod,
        usefulLifeYears,
        salvageValue,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assets';
  @override
  VerificationContext validateIntegrity(Insertable<Asset> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('asset_code')) {
      context.handle(_assetCodeMeta,
          assetCode.isAcceptableOrUnknown(data['asset_code']!, _assetCodeMeta));
    } else if (isInserting) {
      context.missing(_assetCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('purchase_cost')) {
      context.handle(
          _purchaseCostMeta,
          purchaseCost.isAcceptableOrUnknown(
              data['purchase_cost']!, _purchaseCostMeta));
    } else if (isInserting) {
      context.missing(_purchaseCostMeta);
    }
    if (data.containsKey('depreciation_method')) {
      context.handle(
          _depreciationMethodMeta,
          depreciationMethod.isAcceptableOrUnknown(
              data['depreciation_method']!, _depreciationMethodMeta));
    } else if (isInserting) {
      context.missing(_depreciationMethodMeta);
    }
    if (data.containsKey('useful_life_years')) {
      context.handle(
          _usefulLifeYearsMeta,
          usefulLifeYears.isAcceptableOrUnknown(
              data['useful_life_years']!, _usefulLifeYearsMeta));
    } else if (isInserting) {
      context.missing(_usefulLifeYearsMeta);
    }
    if (data.containsKey('salvage_value')) {
      context.handle(
          _salvageValueMeta,
          salvageValue.isAcceptableOrUnknown(
              data['salvage_value']!, _salvageValueMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Asset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Asset(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assetCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      purchaseCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_cost'])!,
      depreciationMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}depreciation_method'])!,
      usefulLifeYears: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}useful_life_years'])!,
      salvageValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}salvage_value'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $AssetsTable createAlias(String alias) {
    return $AssetsTable(attachedDatabase, alias);
  }
}

class Asset extends DataClass implements Insertable<Asset> {
  final String id;
  final String assetCode;
  final String name;
  final String category;
  final DateTime purchaseDate;
  final int purchaseCost;
  final String depreciationMethod;
  final int usefulLifeYears;
  final int salvageValue;
  final String status;
  const Asset(
      {required this.id,
      required this.assetCode,
      required this.name,
      required this.category,
      required this.purchaseDate,
      required this.purchaseCost,
      required this.depreciationMethod,
      required this.usefulLifeYears,
      required this.salvageValue,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['asset_code'] = Variable<String>(assetCode);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    map['purchase_cost'] = Variable<int>(purchaseCost);
    map['depreciation_method'] = Variable<String>(depreciationMethod);
    map['useful_life_years'] = Variable<int>(usefulLifeYears);
    map['salvage_value'] = Variable<int>(salvageValue);
    map['status'] = Variable<String>(status);
    return map;
  }

  AssetsCompanion toCompanion(bool nullToAbsent) {
    return AssetsCompanion(
      id: Value(id),
      assetCode: Value(assetCode),
      name: Value(name),
      category: Value(category),
      purchaseDate: Value(purchaseDate),
      purchaseCost: Value(purchaseCost),
      depreciationMethod: Value(depreciationMethod),
      usefulLifeYears: Value(usefulLifeYears),
      salvageValue: Value(salvageValue),
      status: Value(status),
    );
  }

  factory Asset.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Asset(
      id: serializer.fromJson<String>(json['id']),
      assetCode: serializer.fromJson<String>(json['assetCode']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      purchaseCost: serializer.fromJson<int>(json['purchaseCost']),
      depreciationMethod:
          serializer.fromJson<String>(json['depreciationMethod']),
      usefulLifeYears: serializer.fromJson<int>(json['usefulLifeYears']),
      salvageValue: serializer.fromJson<int>(json['salvageValue']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assetCode': serializer.toJson<String>(assetCode),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'purchaseCost': serializer.toJson<int>(purchaseCost),
      'depreciationMethod': serializer.toJson<String>(depreciationMethod),
      'usefulLifeYears': serializer.toJson<int>(usefulLifeYears),
      'salvageValue': serializer.toJson<int>(salvageValue),
      'status': serializer.toJson<String>(status),
    };
  }

  Asset copyWith(
          {String? id,
          String? assetCode,
          String? name,
          String? category,
          DateTime? purchaseDate,
          int? purchaseCost,
          String? depreciationMethod,
          int? usefulLifeYears,
          int? salvageValue,
          String? status}) =>
      Asset(
        id: id ?? this.id,
        assetCode: assetCode ?? this.assetCode,
        name: name ?? this.name,
        category: category ?? this.category,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        purchaseCost: purchaseCost ?? this.purchaseCost,
        depreciationMethod: depreciationMethod ?? this.depreciationMethod,
        usefulLifeYears: usefulLifeYears ?? this.usefulLifeYears,
        salvageValue: salvageValue ?? this.salvageValue,
        status: status ?? this.status,
      );
  Asset copyWithCompanion(AssetsCompanion data) {
    return Asset(
      id: data.id.present ? data.id.value : this.id,
      assetCode: data.assetCode.present ? data.assetCode.value : this.assetCode,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      purchaseCost: data.purchaseCost.present
          ? data.purchaseCost.value
          : this.purchaseCost,
      depreciationMethod: data.depreciationMethod.present
          ? data.depreciationMethod.value
          : this.depreciationMethod,
      usefulLifeYears: data.usefulLifeYears.present
          ? data.usefulLifeYears.value
          : this.usefulLifeYears,
      salvageValue: data.salvageValue.present
          ? data.salvageValue.value
          : this.salvageValue,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Asset(')
          ..write('id: $id, ')
          ..write('assetCode: $assetCode, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('depreciationMethod: $depreciationMethod, ')
          ..write('usefulLifeYears: $usefulLifeYears, ')
          ..write('salvageValue: $salvageValue, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, assetCode, name, category, purchaseDate,
      purchaseCost, depreciationMethod, usefulLifeYears, salvageValue, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Asset &&
          other.id == this.id &&
          other.assetCode == this.assetCode &&
          other.name == this.name &&
          other.category == this.category &&
          other.purchaseDate == this.purchaseDate &&
          other.purchaseCost == this.purchaseCost &&
          other.depreciationMethod == this.depreciationMethod &&
          other.usefulLifeYears == this.usefulLifeYears &&
          other.salvageValue == this.salvageValue &&
          other.status == this.status);
}

class AssetsCompanion extends UpdateCompanion<Asset> {
  final Value<String> id;
  final Value<String> assetCode;
  final Value<String> name;
  final Value<String> category;
  final Value<DateTime> purchaseDate;
  final Value<int> purchaseCost;
  final Value<String> depreciationMethod;
  final Value<int> usefulLifeYears;
  final Value<int> salvageValue;
  final Value<String> status;
  final Value<int> rowid;
  const AssetsCompanion({
    this.id = const Value.absent(),
    this.assetCode = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.purchaseCost = const Value.absent(),
    this.depreciationMethod = const Value.absent(),
    this.usefulLifeYears = const Value.absent(),
    this.salvageValue = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetsCompanion.insert({
    required String id,
    required String assetCode,
    required String name,
    required String category,
    required DateTime purchaseDate,
    required int purchaseCost,
    required String depreciationMethod,
    required int usefulLifeYears,
    this.salvageValue = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assetCode = Value(assetCode),
        name = Value(name),
        category = Value(category),
        purchaseDate = Value(purchaseDate),
        purchaseCost = Value(purchaseCost),
        depreciationMethod = Value(depreciationMethod),
        usefulLifeYears = Value(usefulLifeYears);
  static Insertable<Asset> custom({
    Expression<String>? id,
    Expression<String>? assetCode,
    Expression<String>? name,
    Expression<String>? category,
    Expression<DateTime>? purchaseDate,
    Expression<int>? purchaseCost,
    Expression<String>? depreciationMethod,
    Expression<int>? usefulLifeYears,
    Expression<int>? salvageValue,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assetCode != null) 'asset_code': assetCode,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (purchaseCost != null) 'purchase_cost': purchaseCost,
      if (depreciationMethod != null) 'depreciation_method': depreciationMethod,
      if (usefulLifeYears != null) 'useful_life_years': usefulLifeYears,
      if (salvageValue != null) 'salvage_value': salvageValue,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assetCode,
      Value<String>? name,
      Value<String>? category,
      Value<DateTime>? purchaseDate,
      Value<int>? purchaseCost,
      Value<String>? depreciationMethod,
      Value<int>? usefulLifeYears,
      Value<int>? salvageValue,
      Value<String>? status,
      Value<int>? rowid}) {
    return AssetsCompanion(
      id: id ?? this.id,
      assetCode: assetCode ?? this.assetCode,
      name: name ?? this.name,
      category: category ?? this.category,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      purchaseCost: purchaseCost ?? this.purchaseCost,
      depreciationMethod: depreciationMethod ?? this.depreciationMethod,
      usefulLifeYears: usefulLifeYears ?? this.usefulLifeYears,
      salvageValue: salvageValue ?? this.salvageValue,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assetCode.present) {
      map['asset_code'] = Variable<String>(assetCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (purchaseCost.present) {
      map['purchase_cost'] = Variable<int>(purchaseCost.value);
    }
    if (depreciationMethod.present) {
      map['depreciation_method'] = Variable<String>(depreciationMethod.value);
    }
    if (usefulLifeYears.present) {
      map['useful_life_years'] = Variable<int>(usefulLifeYears.value);
    }
    if (salvageValue.present) {
      map['salvage_value'] = Variable<int>(salvageValue.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetsCompanion(')
          ..write('id: $id, ')
          ..write('assetCode: $assetCode, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('purchaseCost: $purchaseCost, ')
          ..write('depreciationMethod: $depreciationMethod, ')
          ..write('usefulLifeYears: $usefulLifeYears, ')
          ..write('salvageValue: $salvageValue, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssetDepreciationScheduleTable extends AssetDepreciationSchedule
    with
        TableInfo<$AssetDepreciationScheduleTable,
            AssetDepreciationScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetDepreciationScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assetIdMeta =
      const VerificationMeta('assetId');
  @override
  late final GeneratedColumn<String> assetId = GeneratedColumn<String>(
      'asset_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _periodMonthMeta =
      const VerificationMeta('periodMonth');
  @override
  late final GeneratedColumn<int> periodMonth = GeneratedColumn<int>(
      'period_month', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _periodYearMeta =
      const VerificationMeta('periodYear');
  @override
  late final GeneratedColumn<int> periodYear = GeneratedColumn<int>(
      'period_year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _depreciationAmountMeta =
      const VerificationMeta('depreciationAmount');
  @override
  late final GeneratedColumn<int> depreciationAmount = GeneratedColumn<int>(
      'depreciation_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _accumulatedDepreciationMeta =
      const VerificationMeta('accumulatedDepreciation');
  @override
  late final GeneratedColumn<int> accumulatedDepreciation =
      GeneratedColumn<int>('accumulated_depreciation', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bookValueMeta =
      const VerificationMeta('bookValue');
  @override
  late final GeneratedColumn<int> bookValue = GeneratedColumn<int>(
      'book_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assetId,
        periodMonth,
        periodYear,
        depreciationAmount,
        accumulatedDepreciation,
        bookValue
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asset_depreciation_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<AssetDepreciationScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('asset_id')) {
      context.handle(_assetIdMeta,
          assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta));
    } else if (isInserting) {
      context.missing(_assetIdMeta);
    }
    if (data.containsKey('period_month')) {
      context.handle(
          _periodMonthMeta,
          periodMonth.isAcceptableOrUnknown(
              data['period_month']!, _periodMonthMeta));
    } else if (isInserting) {
      context.missing(_periodMonthMeta);
    }
    if (data.containsKey('period_year')) {
      context.handle(
          _periodYearMeta,
          periodYear.isAcceptableOrUnknown(
              data['period_year']!, _periodYearMeta));
    } else if (isInserting) {
      context.missing(_periodYearMeta);
    }
    if (data.containsKey('depreciation_amount')) {
      context.handle(
          _depreciationAmountMeta,
          depreciationAmount.isAcceptableOrUnknown(
              data['depreciation_amount']!, _depreciationAmountMeta));
    } else if (isInserting) {
      context.missing(_depreciationAmountMeta);
    }
    if (data.containsKey('accumulated_depreciation')) {
      context.handle(
          _accumulatedDepreciationMeta,
          accumulatedDepreciation.isAcceptableOrUnknown(
              data['accumulated_depreciation']!, _accumulatedDepreciationMeta));
    } else if (isInserting) {
      context.missing(_accumulatedDepreciationMeta);
    }
    if (data.containsKey('book_value')) {
      context.handle(_bookValueMeta,
          bookValue.isAcceptableOrUnknown(data['book_value']!, _bookValueMeta));
    } else if (isInserting) {
      context.missing(_bookValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssetDepreciationScheduleData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetDepreciationScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assetId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_id'])!,
      periodMonth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_month'])!,
      periodYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period_year'])!,
      depreciationAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}depreciation_amount'])!,
      accumulatedDepreciation: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}accumulated_depreciation'])!,
      bookValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_value'])!,
    );
  }

  @override
  $AssetDepreciationScheduleTable createAlias(String alias) {
    return $AssetDepreciationScheduleTable(attachedDatabase, alias);
  }
}

class AssetDepreciationScheduleData extends DataClass
    implements Insertable<AssetDepreciationScheduleData> {
  final String id;
  final String assetId;
  final int periodMonth;
  final int periodYear;
  final int depreciationAmount;
  final int accumulatedDepreciation;
  final int bookValue;
  const AssetDepreciationScheduleData(
      {required this.id,
      required this.assetId,
      required this.periodMonth,
      required this.periodYear,
      required this.depreciationAmount,
      required this.accumulatedDepreciation,
      required this.bookValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['asset_id'] = Variable<String>(assetId);
    map['period_month'] = Variable<int>(periodMonth);
    map['period_year'] = Variable<int>(periodYear);
    map['depreciation_amount'] = Variable<int>(depreciationAmount);
    map['accumulated_depreciation'] = Variable<int>(accumulatedDepreciation);
    map['book_value'] = Variable<int>(bookValue);
    return map;
  }

  AssetDepreciationScheduleCompanion toCompanion(bool nullToAbsent) {
    return AssetDepreciationScheduleCompanion(
      id: Value(id),
      assetId: Value(assetId),
      periodMonth: Value(periodMonth),
      periodYear: Value(periodYear),
      depreciationAmount: Value(depreciationAmount),
      accumulatedDepreciation: Value(accumulatedDepreciation),
      bookValue: Value(bookValue),
    );
  }

  factory AssetDepreciationScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetDepreciationScheduleData(
      id: serializer.fromJson<String>(json['id']),
      assetId: serializer.fromJson<String>(json['assetId']),
      periodMonth: serializer.fromJson<int>(json['periodMonth']),
      periodYear: serializer.fromJson<int>(json['periodYear']),
      depreciationAmount: serializer.fromJson<int>(json['depreciationAmount']),
      accumulatedDepreciation:
          serializer.fromJson<int>(json['accumulatedDepreciation']),
      bookValue: serializer.fromJson<int>(json['bookValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assetId': serializer.toJson<String>(assetId),
      'periodMonth': serializer.toJson<int>(periodMonth),
      'periodYear': serializer.toJson<int>(periodYear),
      'depreciationAmount': serializer.toJson<int>(depreciationAmount),
      'accumulatedDepreciation':
          serializer.toJson<int>(accumulatedDepreciation),
      'bookValue': serializer.toJson<int>(bookValue),
    };
  }

  AssetDepreciationScheduleData copyWith(
          {String? id,
          String? assetId,
          int? periodMonth,
          int? periodYear,
          int? depreciationAmount,
          int? accumulatedDepreciation,
          int? bookValue}) =>
      AssetDepreciationScheduleData(
        id: id ?? this.id,
        assetId: assetId ?? this.assetId,
        periodMonth: periodMonth ?? this.periodMonth,
        periodYear: periodYear ?? this.periodYear,
        depreciationAmount: depreciationAmount ?? this.depreciationAmount,
        accumulatedDepreciation:
            accumulatedDepreciation ?? this.accumulatedDepreciation,
        bookValue: bookValue ?? this.bookValue,
      );
  AssetDepreciationScheduleData copyWithCompanion(
      AssetDepreciationScheduleCompanion data) {
    return AssetDepreciationScheduleData(
      id: data.id.present ? data.id.value : this.id,
      assetId: data.assetId.present ? data.assetId.value : this.assetId,
      periodMonth:
          data.periodMonth.present ? data.periodMonth.value : this.periodMonth,
      periodYear:
          data.periodYear.present ? data.periodYear.value : this.periodYear,
      depreciationAmount: data.depreciationAmount.present
          ? data.depreciationAmount.value
          : this.depreciationAmount,
      accumulatedDepreciation: data.accumulatedDepreciation.present
          ? data.accumulatedDepreciation.value
          : this.accumulatedDepreciation,
      bookValue: data.bookValue.present ? data.bookValue.value : this.bookValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetDepreciationScheduleData(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('periodYear: $periodYear, ')
          ..write('depreciationAmount: $depreciationAmount, ')
          ..write('accumulatedDepreciation: $accumulatedDepreciation, ')
          ..write('bookValue: $bookValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, assetId, periodMonth, periodYear,
      depreciationAmount, accumulatedDepreciation, bookValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetDepreciationScheduleData &&
          other.id == this.id &&
          other.assetId == this.assetId &&
          other.periodMonth == this.periodMonth &&
          other.periodYear == this.periodYear &&
          other.depreciationAmount == this.depreciationAmount &&
          other.accumulatedDepreciation == this.accumulatedDepreciation &&
          other.bookValue == this.bookValue);
}

class AssetDepreciationScheduleCompanion
    extends UpdateCompanion<AssetDepreciationScheduleData> {
  final Value<String> id;
  final Value<String> assetId;
  final Value<int> periodMonth;
  final Value<int> periodYear;
  final Value<int> depreciationAmount;
  final Value<int> accumulatedDepreciation;
  final Value<int> bookValue;
  final Value<int> rowid;
  const AssetDepreciationScheduleCompanion({
    this.id = const Value.absent(),
    this.assetId = const Value.absent(),
    this.periodMonth = const Value.absent(),
    this.periodYear = const Value.absent(),
    this.depreciationAmount = const Value.absent(),
    this.accumulatedDepreciation = const Value.absent(),
    this.bookValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetDepreciationScheduleCompanion.insert({
    required String id,
    required String assetId,
    required int periodMonth,
    required int periodYear,
    required int depreciationAmount,
    required int accumulatedDepreciation,
    required int bookValue,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assetId = Value(assetId),
        periodMonth = Value(periodMonth),
        periodYear = Value(periodYear),
        depreciationAmount = Value(depreciationAmount),
        accumulatedDepreciation = Value(accumulatedDepreciation),
        bookValue = Value(bookValue);
  static Insertable<AssetDepreciationScheduleData> custom({
    Expression<String>? id,
    Expression<String>? assetId,
    Expression<int>? periodMonth,
    Expression<int>? periodYear,
    Expression<int>? depreciationAmount,
    Expression<int>? accumulatedDepreciation,
    Expression<int>? bookValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assetId != null) 'asset_id': assetId,
      if (periodMonth != null) 'period_month': periodMonth,
      if (periodYear != null) 'period_year': periodYear,
      if (depreciationAmount != null) 'depreciation_amount': depreciationAmount,
      if (accumulatedDepreciation != null)
        'accumulated_depreciation': accumulatedDepreciation,
      if (bookValue != null) 'book_value': bookValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetDepreciationScheduleCompanion copyWith(
      {Value<String>? id,
      Value<String>? assetId,
      Value<int>? periodMonth,
      Value<int>? periodYear,
      Value<int>? depreciationAmount,
      Value<int>? accumulatedDepreciation,
      Value<int>? bookValue,
      Value<int>? rowid}) {
    return AssetDepreciationScheduleCompanion(
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      periodMonth: periodMonth ?? this.periodMonth,
      periodYear: periodYear ?? this.periodYear,
      depreciationAmount: depreciationAmount ?? this.depreciationAmount,
      accumulatedDepreciation:
          accumulatedDepreciation ?? this.accumulatedDepreciation,
      bookValue: bookValue ?? this.bookValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assetId.present) {
      map['asset_id'] = Variable<String>(assetId.value);
    }
    if (periodMonth.present) {
      map['period_month'] = Variable<int>(periodMonth.value);
    }
    if (periodYear.present) {
      map['period_year'] = Variable<int>(periodYear.value);
    }
    if (depreciationAmount.present) {
      map['depreciation_amount'] = Variable<int>(depreciationAmount.value);
    }
    if (accumulatedDepreciation.present) {
      map['accumulated_depreciation'] =
          Variable<int>(accumulatedDepreciation.value);
    }
    if (bookValue.present) {
      map['book_value'] = Variable<int>(bookValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetDepreciationScheduleCompanion(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('periodMonth: $periodMonth, ')
          ..write('periodYear: $periodYear, ')
          ..write('depreciationAmount: $depreciationAmount, ')
          ..write('accumulatedDepreciation: $accumulatedDepreciation, ')
          ..write('bookValue: $bookValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssetValuationsTable extends AssetValuations
    with TableInfo<$AssetValuationsTable, AssetValuation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetValuationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assetIdMeta =
      const VerificationMeta('assetId');
  @override
  late final GeneratedColumn<String> assetId = GeneratedColumn<String>(
      'asset_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valuationDateMeta =
      const VerificationMeta('valuationDate');
  @override
  late final GeneratedColumn<DateTime> valuationDate =
      GeneratedColumn<DateTime>('valuation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _valuationAmountMeta =
      const VerificationMeta('valuationAmount');
  @override
  late final GeneratedColumn<int> valuationAmount = GeneratedColumn<int>(
      'valuation_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _valuerNameMeta =
      const VerificationMeta('valuerName');
  @override
  late final GeneratedColumn<String> valuerName = GeneratedColumn<String>(
      'valuer_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, assetId, valuationDate, valuationAmount, valuerName, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asset_valuations';
  @override
  VerificationContext validateIntegrity(Insertable<AssetValuation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('asset_id')) {
      context.handle(_assetIdMeta,
          assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta));
    } else if (isInserting) {
      context.missing(_assetIdMeta);
    }
    if (data.containsKey('valuation_date')) {
      context.handle(
          _valuationDateMeta,
          valuationDate.isAcceptableOrUnknown(
              data['valuation_date']!, _valuationDateMeta));
    } else if (isInserting) {
      context.missing(_valuationDateMeta);
    }
    if (data.containsKey('valuation_amount')) {
      context.handle(
          _valuationAmountMeta,
          valuationAmount.isAcceptableOrUnknown(
              data['valuation_amount']!, _valuationAmountMeta));
    } else if (isInserting) {
      context.missing(_valuationAmountMeta);
    }
    if (data.containsKey('valuer_name')) {
      context.handle(
          _valuerNameMeta,
          valuerName.isAcceptableOrUnknown(
              data['valuer_name']!, _valuerNameMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssetValuation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetValuation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assetId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_id'])!,
      valuationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}valuation_date'])!,
      valuationAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}valuation_amount'])!,
      valuerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}valuer_name']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $AssetValuationsTable createAlias(String alias) {
    return $AssetValuationsTable(attachedDatabase, alias);
  }
}

class AssetValuation extends DataClass implements Insertable<AssetValuation> {
  final String id;
  final String assetId;
  final DateTime valuationDate;
  final int valuationAmount;
  final String? valuerName;
  final String? notes;
  const AssetValuation(
      {required this.id,
      required this.assetId,
      required this.valuationDate,
      required this.valuationAmount,
      this.valuerName,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['asset_id'] = Variable<String>(assetId);
    map['valuation_date'] = Variable<DateTime>(valuationDate);
    map['valuation_amount'] = Variable<int>(valuationAmount);
    if (!nullToAbsent || valuerName != null) {
      map['valuer_name'] = Variable<String>(valuerName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  AssetValuationsCompanion toCompanion(bool nullToAbsent) {
    return AssetValuationsCompanion(
      id: Value(id),
      assetId: Value(assetId),
      valuationDate: Value(valuationDate),
      valuationAmount: Value(valuationAmount),
      valuerName: valuerName == null && nullToAbsent
          ? const Value.absent()
          : Value(valuerName),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory AssetValuation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetValuation(
      id: serializer.fromJson<String>(json['id']),
      assetId: serializer.fromJson<String>(json['assetId']),
      valuationDate: serializer.fromJson<DateTime>(json['valuationDate']),
      valuationAmount: serializer.fromJson<int>(json['valuationAmount']),
      valuerName: serializer.fromJson<String?>(json['valuerName']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assetId': serializer.toJson<String>(assetId),
      'valuationDate': serializer.toJson<DateTime>(valuationDate),
      'valuationAmount': serializer.toJson<int>(valuationAmount),
      'valuerName': serializer.toJson<String?>(valuerName),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  AssetValuation copyWith(
          {String? id,
          String? assetId,
          DateTime? valuationDate,
          int? valuationAmount,
          Value<String?> valuerName = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      AssetValuation(
        id: id ?? this.id,
        assetId: assetId ?? this.assetId,
        valuationDate: valuationDate ?? this.valuationDate,
        valuationAmount: valuationAmount ?? this.valuationAmount,
        valuerName: valuerName.present ? valuerName.value : this.valuerName,
        notes: notes.present ? notes.value : this.notes,
      );
  AssetValuation copyWithCompanion(AssetValuationsCompanion data) {
    return AssetValuation(
      id: data.id.present ? data.id.value : this.id,
      assetId: data.assetId.present ? data.assetId.value : this.assetId,
      valuationDate: data.valuationDate.present
          ? data.valuationDate.value
          : this.valuationDate,
      valuationAmount: data.valuationAmount.present
          ? data.valuationAmount.value
          : this.valuationAmount,
      valuerName:
          data.valuerName.present ? data.valuerName.value : this.valuerName,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetValuation(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('valuationDate: $valuationDate, ')
          ..write('valuationAmount: $valuationAmount, ')
          ..write('valuerName: $valuerName, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, assetId, valuationDate, valuationAmount, valuerName, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetValuation &&
          other.id == this.id &&
          other.assetId == this.assetId &&
          other.valuationDate == this.valuationDate &&
          other.valuationAmount == this.valuationAmount &&
          other.valuerName == this.valuerName &&
          other.notes == this.notes);
}

class AssetValuationsCompanion extends UpdateCompanion<AssetValuation> {
  final Value<String> id;
  final Value<String> assetId;
  final Value<DateTime> valuationDate;
  final Value<int> valuationAmount;
  final Value<String?> valuerName;
  final Value<String?> notes;
  final Value<int> rowid;
  const AssetValuationsCompanion({
    this.id = const Value.absent(),
    this.assetId = const Value.absent(),
    this.valuationDate = const Value.absent(),
    this.valuationAmount = const Value.absent(),
    this.valuerName = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetValuationsCompanion.insert({
    required String id,
    required String assetId,
    required DateTime valuationDate,
    required int valuationAmount,
    this.valuerName = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assetId = Value(assetId),
        valuationDate = Value(valuationDate),
        valuationAmount = Value(valuationAmount);
  static Insertable<AssetValuation> custom({
    Expression<String>? id,
    Expression<String>? assetId,
    Expression<DateTime>? valuationDate,
    Expression<int>? valuationAmount,
    Expression<String>? valuerName,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assetId != null) 'asset_id': assetId,
      if (valuationDate != null) 'valuation_date': valuationDate,
      if (valuationAmount != null) 'valuation_amount': valuationAmount,
      if (valuerName != null) 'valuer_name': valuerName,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetValuationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assetId,
      Value<DateTime>? valuationDate,
      Value<int>? valuationAmount,
      Value<String?>? valuerName,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return AssetValuationsCompanion(
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      valuationDate: valuationDate ?? this.valuationDate,
      valuationAmount: valuationAmount ?? this.valuationAmount,
      valuerName: valuerName ?? this.valuerName,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assetId.present) {
      map['asset_id'] = Variable<String>(assetId.value);
    }
    if (valuationDate.present) {
      map['valuation_date'] = Variable<DateTime>(valuationDate.value);
    }
    if (valuationAmount.present) {
      map['valuation_amount'] = Variable<int>(valuationAmount.value);
    }
    if (valuerName.present) {
      map['valuer_name'] = Variable<String>(valuerName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetValuationsCompanion(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('valuationDate: $valuationDate, ')
          ..write('valuationAmount: $valuationAmount, ')
          ..write('valuerName: $valuerName, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemCodeMeta =
      const VerificationMeta('itemCode');
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
      'item_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitCostMeta =
      const VerificationMeta('unitCost');
  @override
  late final GeneratedColumn<int> unitCost = GeneratedColumn<int>(
      'unit_cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityOnHandMeta =
      const VerificationMeta('quantityOnHand');
  @override
  late final GeneratedColumn<int> quantityOnHand = GeneratedColumn<int>(
      'quantity_on_hand', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minimumLevelMeta =
      const VerificationMeta('minimumLevel');
  @override
  late final GeneratedColumn<int> minimumLevel = GeneratedColumn<int>(
      'minimum_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemCode,
        itemName,
        category,
        unit,
        unitCost,
        quantityOnHand,
        minimumLevel
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta));
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(_unitCostMeta,
          unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta));
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    if (data.containsKey('quantity_on_hand')) {
      context.handle(
          _quantityOnHandMeta,
          quantityOnHand.isAcceptableOrUnknown(
              data['quantity_on_hand']!, _quantityOnHandMeta));
    } else if (isInserting) {
      context.missing(_quantityOnHandMeta);
    }
    if (data.containsKey('minimum_level')) {
      context.handle(
          _minimumLevelMeta,
          minimumLevel.isAcceptableOrUnknown(
              data['minimum_level']!, _minimumLevelMeta));
    } else if (isInserting) {
      context.missing(_minimumLevelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_code'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      unitCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_cost'])!,
      quantityOnHand: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity_on_hand'])!,
      minimumLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minimum_level'])!,
    );
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(attachedDatabase, alias);
  }
}

class InventoryItem extends DataClass implements Insertable<InventoryItem> {
  final String id;
  final String itemCode;
  final String itemName;
  final String category;
  final String unit;
  final int unitCost;
  final int quantityOnHand;
  final int minimumLevel;
  const InventoryItem(
      {required this.id,
      required this.itemCode,
      required this.itemName,
      required this.category,
      required this.unit,
      required this.unitCost,
      required this.quantityOnHand,
      required this.minimumLevel});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_code'] = Variable<String>(itemCode);
    map['item_name'] = Variable<String>(itemName);
    map['category'] = Variable<String>(category);
    map['unit'] = Variable<String>(unit);
    map['unit_cost'] = Variable<int>(unitCost);
    map['quantity_on_hand'] = Variable<int>(quantityOnHand);
    map['minimum_level'] = Variable<int>(minimumLevel);
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: Value(id),
      itemCode: Value(itemCode),
      itemName: Value(itemName),
      category: Value(category),
      unit: Value(unit),
      unitCost: Value(unitCost),
      quantityOnHand: Value(quantityOnHand),
      minimumLevel: Value(minimumLevel),
    );
  }

  factory InventoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItem(
      id: serializer.fromJson<String>(json['id']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      itemName: serializer.fromJson<String>(json['itemName']),
      category: serializer.fromJson<String>(json['category']),
      unit: serializer.fromJson<String>(json['unit']),
      unitCost: serializer.fromJson<int>(json['unitCost']),
      quantityOnHand: serializer.fromJson<int>(json['quantityOnHand']),
      minimumLevel: serializer.fromJson<int>(json['minimumLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemCode': serializer.toJson<String>(itemCode),
      'itemName': serializer.toJson<String>(itemName),
      'category': serializer.toJson<String>(category),
      'unit': serializer.toJson<String>(unit),
      'unitCost': serializer.toJson<int>(unitCost),
      'quantityOnHand': serializer.toJson<int>(quantityOnHand),
      'minimumLevel': serializer.toJson<int>(minimumLevel),
    };
  }

  InventoryItem copyWith(
          {String? id,
          String? itemCode,
          String? itemName,
          String? category,
          String? unit,
          int? unitCost,
          int? quantityOnHand,
          int? minimumLevel}) =>
      InventoryItem(
        id: id ?? this.id,
        itemCode: itemCode ?? this.itemCode,
        itemName: itemName ?? this.itemName,
        category: category ?? this.category,
        unit: unit ?? this.unit,
        unitCost: unitCost ?? this.unitCost,
        quantityOnHand: quantityOnHand ?? this.quantityOnHand,
        minimumLevel: minimumLevel ?? this.minimumLevel,
      );
  InventoryItem copyWithCompanion(InventoryItemsCompanion data) {
    return InventoryItem(
      id: data.id.present ? data.id.value : this.id,
      itemCode: data.itemCode.present ? data.itemCode.value : this.itemCode,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      category: data.category.present ? data.category.value : this.category,
      unit: data.unit.present ? data.unit.value : this.unit,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
      quantityOnHand: data.quantityOnHand.present
          ? data.quantityOnHand.value
          : this.quantityOnHand,
      minimumLevel: data.minimumLevel.present
          ? data.minimumLevel.value
          : this.minimumLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItem(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('category: $category, ')
          ..write('unit: $unit, ')
          ..write('unitCost: $unitCost, ')
          ..write('quantityOnHand: $quantityOnHand, ')
          ..write('minimumLevel: $minimumLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemCode, itemName, category, unit,
      unitCost, quantityOnHand, minimumLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItem &&
          other.id == this.id &&
          other.itemCode == this.itemCode &&
          other.itemName == this.itemName &&
          other.category == this.category &&
          other.unit == this.unit &&
          other.unitCost == this.unitCost &&
          other.quantityOnHand == this.quantityOnHand &&
          other.minimumLevel == this.minimumLevel);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItem> {
  final Value<String> id;
  final Value<String> itemCode;
  final Value<String> itemName;
  final Value<String> category;
  final Value<String> unit;
  final Value<int> unitCost;
  final Value<int> quantityOnHand;
  final Value<int> minimumLevel;
  final Value<int> rowid;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.itemName = const Value.absent(),
    this.category = const Value.absent(),
    this.unit = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.quantityOnHand = const Value.absent(),
    this.minimumLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    required String id,
    required String itemCode,
    required String itemName,
    required String category,
    required String unit,
    required int unitCost,
    required int quantityOnHand,
    required int minimumLevel,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemCode = Value(itemCode),
        itemName = Value(itemName),
        category = Value(category),
        unit = Value(unit),
        unitCost = Value(unitCost),
        quantityOnHand = Value(quantityOnHand),
        minimumLevel = Value(minimumLevel);
  static Insertable<InventoryItem> custom({
    Expression<String>? id,
    Expression<String>? itemCode,
    Expression<String>? itemName,
    Expression<String>? category,
    Expression<String>? unit,
    Expression<int>? unitCost,
    Expression<int>? quantityOnHand,
    Expression<int>? minimumLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemCode != null) 'item_code': itemCode,
      if (itemName != null) 'item_name': itemName,
      if (category != null) 'category': category,
      if (unit != null) 'unit': unit,
      if (unitCost != null) 'unit_cost': unitCost,
      if (quantityOnHand != null) 'quantity_on_hand': quantityOnHand,
      if (minimumLevel != null) 'minimum_level': minimumLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemCode,
      Value<String>? itemName,
      Value<String>? category,
      Value<String>? unit,
      Value<int>? unitCost,
      Value<int>? quantityOnHand,
      Value<int>? minimumLevel,
      Value<int>? rowid}) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      unitCost: unitCost ?? this.unitCost,
      quantityOnHand: quantityOnHand ?? this.quantityOnHand,
      minimumLevel: minimumLevel ?? this.minimumLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<int>(unitCost.value);
    }
    if (quantityOnHand.present) {
      map['quantity_on_hand'] = Variable<int>(quantityOnHand.value);
    }
    if (minimumLevel.present) {
      map['minimum_level'] = Variable<int>(minimumLevel.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('category: $category, ')
          ..write('unit: $unit, ')
          ..write('unitCost: $unitCost, ')
          ..write('quantityOnHand: $quantityOnHand, ')
          ..write('minimumLevel: $minimumLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryPurchasesTable extends InventoryPurchases
    with TableInfo<$InventoryPurchasesTable, InventoryPurchase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryPurchasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _supplierNameMeta =
      const VerificationMeta('supplierName');
  @override
  late final GeneratedColumn<String> supplierName = GeneratedColumn<String>(
      'supplier_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitCostMeta =
      const VerificationMeta('unitCost');
  @override
  late final GeneratedColumn<int> unitCost = GeneratedColumn<int>(
      'unit_cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalCostMeta =
      const VerificationMeta('totalCost');
  @override
  late final GeneratedColumn<int> totalCost = GeneratedColumn<int>(
      'total_cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('received'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        supplierName,
        purchaseDate,
        quantity,
        unitCost,
        totalCost,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_purchases';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryPurchase> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('supplier_name')) {
      context.handle(
          _supplierNameMeta,
          supplierName.isAcceptableOrUnknown(
              data['supplier_name']!, _supplierNameMeta));
    } else if (isInserting) {
      context.missing(_supplierNameMeta);
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(_unitCostMeta,
          unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta));
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    if (data.containsKey('total_cost')) {
      context.handle(_totalCostMeta,
          totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta));
    } else if (isInserting) {
      context.missing(_totalCostMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryPurchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryPurchase(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      supplierName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_name'])!,
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_cost'])!,
      totalCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_cost'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $InventoryPurchasesTable createAlias(String alias) {
    return $InventoryPurchasesTable(attachedDatabase, alias);
  }
}

class InventoryPurchase extends DataClass
    implements Insertable<InventoryPurchase> {
  final String id;
  final String itemId;
  final String supplierName;
  final DateTime purchaseDate;
  final int quantity;
  final int unitCost;
  final int totalCost;
  final String status;
  const InventoryPurchase(
      {required this.id,
      required this.itemId,
      required this.supplierName,
      required this.purchaseDate,
      required this.quantity,
      required this.unitCost,
      required this.totalCost,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['supplier_name'] = Variable<String>(supplierName);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    map['quantity'] = Variable<int>(quantity);
    map['unit_cost'] = Variable<int>(unitCost);
    map['total_cost'] = Variable<int>(totalCost);
    map['status'] = Variable<String>(status);
    return map;
  }

  InventoryPurchasesCompanion toCompanion(bool nullToAbsent) {
    return InventoryPurchasesCompanion(
      id: Value(id),
      itemId: Value(itemId),
      supplierName: Value(supplierName),
      purchaseDate: Value(purchaseDate),
      quantity: Value(quantity),
      unitCost: Value(unitCost),
      totalCost: Value(totalCost),
      status: Value(status),
    );
  }

  factory InventoryPurchase.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryPurchase(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      supplierName: serializer.fromJson<String>(json['supplierName']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitCost: serializer.fromJson<int>(json['unitCost']),
      totalCost: serializer.fromJson<int>(json['totalCost']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'supplierName': serializer.toJson<String>(supplierName),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'quantity': serializer.toJson<int>(quantity),
      'unitCost': serializer.toJson<int>(unitCost),
      'totalCost': serializer.toJson<int>(totalCost),
      'status': serializer.toJson<String>(status),
    };
  }

  InventoryPurchase copyWith(
          {String? id,
          String? itemId,
          String? supplierName,
          DateTime? purchaseDate,
          int? quantity,
          int? unitCost,
          int? totalCost,
          String? status}) =>
      InventoryPurchase(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        supplierName: supplierName ?? this.supplierName,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        quantity: quantity ?? this.quantity,
        unitCost: unitCost ?? this.unitCost,
        totalCost: totalCost ?? this.totalCost,
        status: status ?? this.status,
      );
  InventoryPurchase copyWithCompanion(InventoryPurchasesCompanion data) {
    return InventoryPurchase(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      supplierName: data.supplierName.present
          ? data.supplierName.value
          : this.supplierName,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
      totalCost: data.totalCost.present ? data.totalCost.value : this.totalCost,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryPurchase(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('supplierName: $supplierName, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('quantity: $quantity, ')
          ..write('unitCost: $unitCost, ')
          ..write('totalCost: $totalCost, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, supplierName, purchaseDate,
      quantity, unitCost, totalCost, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryPurchase &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.supplierName == this.supplierName &&
          other.purchaseDate == this.purchaseDate &&
          other.quantity == this.quantity &&
          other.unitCost == this.unitCost &&
          other.totalCost == this.totalCost &&
          other.status == this.status);
}

class InventoryPurchasesCompanion extends UpdateCompanion<InventoryPurchase> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<String> supplierName;
  final Value<DateTime> purchaseDate;
  final Value<int> quantity;
  final Value<int> unitCost;
  final Value<int> totalCost;
  final Value<String> status;
  final Value<int> rowid;
  const InventoryPurchasesCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.supplierName = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryPurchasesCompanion.insert({
    required String id,
    required String itemId,
    required String supplierName,
    required DateTime purchaseDate,
    required int quantity,
    required int unitCost,
    required int totalCost,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        supplierName = Value(supplierName),
        purchaseDate = Value(purchaseDate),
        quantity = Value(quantity),
        unitCost = Value(unitCost),
        totalCost = Value(totalCost);
  static Insertable<InventoryPurchase> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<String>? supplierName,
    Expression<DateTime>? purchaseDate,
    Expression<int>? quantity,
    Expression<int>? unitCost,
    Expression<int>? totalCost,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (supplierName != null) 'supplier_name': supplierName,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (quantity != null) 'quantity': quantity,
      if (unitCost != null) 'unit_cost': unitCost,
      if (totalCost != null) 'total_cost': totalCost,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryPurchasesCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<String>? supplierName,
      Value<DateTime>? purchaseDate,
      Value<int>? quantity,
      Value<int>? unitCost,
      Value<int>? totalCost,
      Value<String>? status,
      Value<int>? rowid}) {
    return InventoryPurchasesCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      supplierName: supplierName ?? this.supplierName,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      quantity: quantity ?? this.quantity,
      unitCost: unitCost ?? this.unitCost,
      totalCost: totalCost ?? this.totalCost,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (supplierName.present) {
      map['supplier_name'] = Variable<String>(supplierName.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<int>(unitCost.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<int>(totalCost.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryPurchasesCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('supplierName: $supplierName, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('quantity: $quantity, ')
          ..write('unitCost: $unitCost, ')
          ..write('totalCost: $totalCost, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryAdjustmentsTable extends InventoryAdjustments
    with TableInfo<$InventoryAdjustmentsTable, InventoryAdjustment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _adjustmentDateMeta =
      const VerificationMeta('adjustmentDate');
  @override
  late final GeneratedColumn<DateTime> adjustmentDate =
      GeneratedColumn<DateTime>('adjustment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _adjustmentTypeMeta =
      const VerificationMeta('adjustmentType');
  @override
  late final GeneratedColumn<String> adjustmentType = GeneratedColumn<String>(
      'adjustment_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityDeltaMeta =
      const VerificationMeta('quantityDelta');
  @override
  late final GeneratedColumn<int> quantityDelta = GeneratedColumn<int>(
      'quantity_delta', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        adjustmentDate,
        adjustmentType,
        quantityDelta,
        reason,
        userId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_adjustments';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryAdjustment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('adjustment_date')) {
      context.handle(
          _adjustmentDateMeta,
          adjustmentDate.isAcceptableOrUnknown(
              data['adjustment_date']!, _adjustmentDateMeta));
    } else if (isInserting) {
      context.missing(_adjustmentDateMeta);
    }
    if (data.containsKey('adjustment_type')) {
      context.handle(
          _adjustmentTypeMeta,
          adjustmentType.isAcceptableOrUnknown(
              data['adjustment_type']!, _adjustmentTypeMeta));
    } else if (isInserting) {
      context.missing(_adjustmentTypeMeta);
    }
    if (data.containsKey('quantity_delta')) {
      context.handle(
          _quantityDeltaMeta,
          quantityDelta.isAcceptableOrUnknown(
              data['quantity_delta']!, _quantityDeltaMeta));
    } else if (isInserting) {
      context.missing(_quantityDeltaMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryAdjustment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryAdjustment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      adjustmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}adjustment_date'])!,
      adjustmentType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}adjustment_type'])!,
      quantityDelta: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity_delta'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $InventoryAdjustmentsTable createAlias(String alias) {
    return $InventoryAdjustmentsTable(attachedDatabase, alias);
  }
}

class InventoryAdjustment extends DataClass
    implements Insertable<InventoryAdjustment> {
  final String id;
  final String itemId;
  final DateTime adjustmentDate;
  final String adjustmentType;
  final int quantityDelta;
  final String reason;
  final String userId;
  const InventoryAdjustment(
      {required this.id,
      required this.itemId,
      required this.adjustmentDate,
      required this.adjustmentType,
      required this.quantityDelta,
      required this.reason,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['adjustment_date'] = Variable<DateTime>(adjustmentDate);
    map['adjustment_type'] = Variable<String>(adjustmentType);
    map['quantity_delta'] = Variable<int>(quantityDelta);
    map['reason'] = Variable<String>(reason);
    map['user_id'] = Variable<String>(userId);
    return map;
  }

  InventoryAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return InventoryAdjustmentsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      adjustmentDate: Value(adjustmentDate),
      adjustmentType: Value(adjustmentType),
      quantityDelta: Value(quantityDelta),
      reason: Value(reason),
      userId: Value(userId),
    );
  }

  factory InventoryAdjustment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryAdjustment(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      adjustmentDate: serializer.fromJson<DateTime>(json['adjustmentDate']),
      adjustmentType: serializer.fromJson<String>(json['adjustmentType']),
      quantityDelta: serializer.fromJson<int>(json['quantityDelta']),
      reason: serializer.fromJson<String>(json['reason']),
      userId: serializer.fromJson<String>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'adjustmentDate': serializer.toJson<DateTime>(adjustmentDate),
      'adjustmentType': serializer.toJson<String>(adjustmentType),
      'quantityDelta': serializer.toJson<int>(quantityDelta),
      'reason': serializer.toJson<String>(reason),
      'userId': serializer.toJson<String>(userId),
    };
  }

  InventoryAdjustment copyWith(
          {String? id,
          String? itemId,
          DateTime? adjustmentDate,
          String? adjustmentType,
          int? quantityDelta,
          String? reason,
          String? userId}) =>
      InventoryAdjustment(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        adjustmentDate: adjustmentDate ?? this.adjustmentDate,
        adjustmentType: adjustmentType ?? this.adjustmentType,
        quantityDelta: quantityDelta ?? this.quantityDelta,
        reason: reason ?? this.reason,
        userId: userId ?? this.userId,
      );
  InventoryAdjustment copyWithCompanion(InventoryAdjustmentsCompanion data) {
    return InventoryAdjustment(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      adjustmentDate: data.adjustmentDate.present
          ? data.adjustmentDate.value
          : this.adjustmentDate,
      adjustmentType: data.adjustmentType.present
          ? data.adjustmentType.value
          : this.adjustmentType,
      quantityDelta: data.quantityDelta.present
          ? data.quantityDelta.value
          : this.quantityDelta,
      reason: data.reason.present ? data.reason.value : this.reason,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryAdjustment(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('adjustmentDate: $adjustmentDate, ')
          ..write('adjustmentType: $adjustmentType, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('reason: $reason, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, adjustmentDate, adjustmentType,
      quantityDelta, reason, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryAdjustment &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.adjustmentDate == this.adjustmentDate &&
          other.adjustmentType == this.adjustmentType &&
          other.quantityDelta == this.quantityDelta &&
          other.reason == this.reason &&
          other.userId == this.userId);
}

class InventoryAdjustmentsCompanion
    extends UpdateCompanion<InventoryAdjustment> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<DateTime> adjustmentDate;
  final Value<String> adjustmentType;
  final Value<int> quantityDelta;
  final Value<String> reason;
  final Value<String> userId;
  final Value<int> rowid;
  const InventoryAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.adjustmentDate = const Value.absent(),
    this.adjustmentType = const Value.absent(),
    this.quantityDelta = const Value.absent(),
    this.reason = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryAdjustmentsCompanion.insert({
    required String id,
    required String itemId,
    required DateTime adjustmentDate,
    required String adjustmentType,
    required int quantityDelta,
    required String reason,
    required String userId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        adjustmentDate = Value(adjustmentDate),
        adjustmentType = Value(adjustmentType),
        quantityDelta = Value(quantityDelta),
        reason = Value(reason),
        userId = Value(userId);
  static Insertable<InventoryAdjustment> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<DateTime>? adjustmentDate,
    Expression<String>? adjustmentType,
    Expression<int>? quantityDelta,
    Expression<String>? reason,
    Expression<String>? userId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (adjustmentDate != null) 'adjustment_date': adjustmentDate,
      if (adjustmentType != null) 'adjustment_type': adjustmentType,
      if (quantityDelta != null) 'quantity_delta': quantityDelta,
      if (reason != null) 'reason': reason,
      if (userId != null) 'user_id': userId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryAdjustmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<DateTime>? adjustmentDate,
      Value<String>? adjustmentType,
      Value<int>? quantityDelta,
      Value<String>? reason,
      Value<String>? userId,
      Value<int>? rowid}) {
    return InventoryAdjustmentsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      adjustmentDate: adjustmentDate ?? this.adjustmentDate,
      adjustmentType: adjustmentType ?? this.adjustmentType,
      quantityDelta: quantityDelta ?? this.quantityDelta,
      reason: reason ?? this.reason,
      userId: userId ?? this.userId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (adjustmentDate.present) {
      map['adjustment_date'] = Variable<DateTime>(adjustmentDate.value);
    }
    if (adjustmentType.present) {
      map['adjustment_type'] = Variable<String>(adjustmentType.value);
    }
    if (quantityDelta.present) {
      map['quantity_delta'] = Variable<int>(quantityDelta.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('adjustmentDate: $adjustmentDate, ')
          ..write('adjustmentType: $adjustmentType, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('reason: $reason, ')
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MeetingRoomsTable extends MeetingRooms
    with TableInfo<$MeetingRoomsTable, MeetingRoom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeetingRoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomNameMeta =
      const VerificationMeta('roomName');
  @override
  late final GeneratedColumn<String> roomName = GeneratedColumn<String>(
      'room_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _capacityMeta =
      const VerificationMeta('capacity');
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
      'capacity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('available'));
  @override
  List<GeneratedColumn> get $columns => [id, roomName, capacity, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meeting_rooms';
  @override
  VerificationContext validateIntegrity(Insertable<MeetingRoom> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_name')) {
      context.handle(_roomNameMeta,
          roomName.isAcceptableOrUnknown(data['room_name']!, _roomNameMeta));
    } else if (isInserting) {
      context.missing(_roomNameMeta);
    }
    if (data.containsKey('capacity')) {
      context.handle(_capacityMeta,
          capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta));
    } else if (isInserting) {
      context.missing(_capacityMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MeetingRoom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeetingRoom(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roomName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_name'])!,
      capacity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}capacity'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $MeetingRoomsTable createAlias(String alias) {
    return $MeetingRoomsTable(attachedDatabase, alias);
  }
}

class MeetingRoom extends DataClass implements Insertable<MeetingRoom> {
  final String id;
  final String roomName;
  final int capacity;
  final String status;
  const MeetingRoom(
      {required this.id,
      required this.roomName,
      required this.capacity,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_name'] = Variable<String>(roomName);
    map['capacity'] = Variable<int>(capacity);
    map['status'] = Variable<String>(status);
    return map;
  }

  MeetingRoomsCompanion toCompanion(bool nullToAbsent) {
    return MeetingRoomsCompanion(
      id: Value(id),
      roomName: Value(roomName),
      capacity: Value(capacity),
      status: Value(status),
    );
  }

  factory MeetingRoom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeetingRoom(
      id: serializer.fromJson<String>(json['id']),
      roomName: serializer.fromJson<String>(json['roomName']),
      capacity: serializer.fromJson<int>(json['capacity']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomName': serializer.toJson<String>(roomName),
      'capacity': serializer.toJson<int>(capacity),
      'status': serializer.toJson<String>(status),
    };
  }

  MeetingRoom copyWith(
          {String? id, String? roomName, int? capacity, String? status}) =>
      MeetingRoom(
        id: id ?? this.id,
        roomName: roomName ?? this.roomName,
        capacity: capacity ?? this.capacity,
        status: status ?? this.status,
      );
  MeetingRoom copyWithCompanion(MeetingRoomsCompanion data) {
    return MeetingRoom(
      id: data.id.present ? data.id.value : this.id,
      roomName: data.roomName.present ? data.roomName.value : this.roomName,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeetingRoom(')
          ..write('id: $id, ')
          ..write('roomName: $roomName, ')
          ..write('capacity: $capacity, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomName, capacity, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeetingRoom &&
          other.id == this.id &&
          other.roomName == this.roomName &&
          other.capacity == this.capacity &&
          other.status == this.status);
}

class MeetingRoomsCompanion extends UpdateCompanion<MeetingRoom> {
  final Value<String> id;
  final Value<String> roomName;
  final Value<int> capacity;
  final Value<String> status;
  final Value<int> rowid;
  const MeetingRoomsCompanion({
    this.id = const Value.absent(),
    this.roomName = const Value.absent(),
    this.capacity = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeetingRoomsCompanion.insert({
    required String id,
    required String roomName,
    required int capacity,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roomName = Value(roomName),
        capacity = Value(capacity);
  static Insertable<MeetingRoom> custom({
    Expression<String>? id,
    Expression<String>? roomName,
    Expression<int>? capacity,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomName != null) 'room_name': roomName,
      if (capacity != null) 'capacity': capacity,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeetingRoomsCompanion copyWith(
      {Value<String>? id,
      Value<String>? roomName,
      Value<int>? capacity,
      Value<String>? status,
      Value<int>? rowid}) {
    return MeetingRoomsCompanion(
      id: id ?? this.id,
      roomName: roomName ?? this.roomName,
      capacity: capacity ?? this.capacity,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomName.present) {
      map['room_name'] = Variable<String>(roomName.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeetingRoomsCompanion(')
          ..write('id: $id, ')
          ..write('roomName: $roomName, ')
          ..write('capacity: $capacity, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventTypeMeta =
      const VerificationMeta('eventType');
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
      'event_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventDateMeta =
      const VerificationMeta('eventDate');
  @override
  late final GeneratedColumn<DateTime> eventDate = GeneratedColumn<DateTime>(
      'event_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'end_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
      'room_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByUserIdMeta =
      const VerificationMeta('createdByUserId');
  @override
  late final GeneratedColumn<String> createdByUserId = GeneratedColumn<String>(
      'created_by_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attendeeCountMeta =
      const VerificationMeta('attendeeCount');
  @override
  late final GeneratedColumn<int> attendeeCount = GeneratedColumn<int>(
      'attendee_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        eventType,
        eventDate,
        startTime,
        endTime,
        roomId,
        description,
        createdByUserId,
        attendeeCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(_eventTypeMeta,
          eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta));
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('event_date')) {
      context.handle(_eventDateMeta,
          eventDate.isAcceptableOrUnknown(data['event_date']!, _eventDateMeta));
    } else if (isInserting) {
      context.missing(_eventDateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_by_user_id')) {
      context.handle(
          _createdByUserIdMeta,
          createdByUserId.isAcceptableOrUnknown(
              data['created_by_user_id']!, _createdByUserIdMeta));
    } else if (isInserting) {
      context.missing(_createdByUserIdMeta);
    }
    if (data.containsKey('attendee_count')) {
      context.handle(
          _attendeeCountMeta,
          attendeeCount.isAcceptableOrUnknown(
              data['attendee_count']!, _attendeeCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      eventType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_type'])!,
      eventDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}event_date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_time'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_id']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdByUserId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_user_id'])!,
      attendeeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attendee_count'])!,
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEvent extends DataClass implements Insertable<CalendarEvent> {
  final String id;
  final String title;
  final String eventType;
  final DateTime eventDate;
  final String startTime;
  final String endTime;
  final String? roomId;
  final String? description;
  final String createdByUserId;
  final int attendeeCount;
  const CalendarEvent(
      {required this.id,
      required this.title,
      required this.eventType,
      required this.eventDate,
      required this.startTime,
      required this.endTime,
      this.roomId,
      this.description,
      required this.createdByUserId,
      required this.attendeeCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['event_type'] = Variable<String>(eventType);
    map['event_date'] = Variable<DateTime>(eventDate);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    if (!nullToAbsent || roomId != null) {
      map['room_id'] = Variable<String>(roomId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_by_user_id'] = Variable<String>(createdByUserId);
    map['attendee_count'] = Variable<int>(attendeeCount);
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      title: Value(title),
      eventType: Value(eventType),
      eventDate: Value(eventDate),
      startTime: Value(startTime),
      endTime: Value(endTime),
      roomId:
          roomId == null && nullToAbsent ? const Value.absent() : Value(roomId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdByUserId: Value(createdByUserId),
      attendeeCount: Value(attendeeCount),
    );
  }

  factory CalendarEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEvent(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      eventType: serializer.fromJson<String>(json['eventType']),
      eventDate: serializer.fromJson<DateTime>(json['eventDate']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      roomId: serializer.fromJson<String?>(json['roomId']),
      description: serializer.fromJson<String?>(json['description']),
      createdByUserId: serializer.fromJson<String>(json['createdByUserId']),
      attendeeCount: serializer.fromJson<int>(json['attendeeCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'eventType': serializer.toJson<String>(eventType),
      'eventDate': serializer.toJson<DateTime>(eventDate),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'roomId': serializer.toJson<String?>(roomId),
      'description': serializer.toJson<String?>(description),
      'createdByUserId': serializer.toJson<String>(createdByUserId),
      'attendeeCount': serializer.toJson<int>(attendeeCount),
    };
  }

  CalendarEvent copyWith(
          {String? id,
          String? title,
          String? eventType,
          DateTime? eventDate,
          String? startTime,
          String? endTime,
          Value<String?> roomId = const Value.absent(),
          Value<String?> description = const Value.absent(),
          String? createdByUserId,
          int? attendeeCount}) =>
      CalendarEvent(
        id: id ?? this.id,
        title: title ?? this.title,
        eventType: eventType ?? this.eventType,
        eventDate: eventDate ?? this.eventDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        roomId: roomId.present ? roomId.value : this.roomId,
        description: description.present ? description.value : this.description,
        createdByUserId: createdByUserId ?? this.createdByUserId,
        attendeeCount: attendeeCount ?? this.attendeeCount,
      );
  CalendarEvent copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEvent(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      eventDate: data.eventDate.present ? data.eventDate.value : this.eventDate,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      description:
          data.description.present ? data.description.value : this.description,
      createdByUserId: data.createdByUserId.present
          ? data.createdByUserId.value
          : this.createdByUserId,
      attendeeCount: data.attendeeCount.present
          ? data.attendeeCount.value
          : this.attendeeCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('eventType: $eventType, ')
          ..write('eventDate: $eventDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('roomId: $roomId, ')
          ..write('description: $description, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('attendeeCount: $attendeeCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, eventType, eventDate, startTime,
      endTime, roomId, description, createdByUserId, attendeeCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.eventType == this.eventType &&
          other.eventDate == this.eventDate &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.roomId == this.roomId &&
          other.description == this.description &&
          other.createdByUserId == this.createdByUserId &&
          other.attendeeCount == this.attendeeCount);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEvent> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> eventType;
  final Value<DateTime> eventDate;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<String?> roomId;
  final Value<String?> description;
  final Value<String> createdByUserId;
  final Value<int> attendeeCount;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.eventType = const Value.absent(),
    this.eventDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.roomId = const Value.absent(),
    this.description = const Value.absent(),
    this.createdByUserId = const Value.absent(),
    this.attendeeCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    required String id,
    required String title,
    required String eventType,
    required DateTime eventDate,
    required String startTime,
    required String endTime,
    this.roomId = const Value.absent(),
    this.description = const Value.absent(),
    required String createdByUserId,
    this.attendeeCount = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        eventType = Value(eventType),
        eventDate = Value(eventDate),
        startTime = Value(startTime),
        endTime = Value(endTime),
        createdByUserId = Value(createdByUserId);
  static Insertable<CalendarEvent> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? eventType,
    Expression<DateTime>? eventDate,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? roomId,
    Expression<String>? description,
    Expression<String>? createdByUserId,
    Expression<int>? attendeeCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (eventType != null) 'event_type': eventType,
      if (eventDate != null) 'event_date': eventDate,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (roomId != null) 'room_id': roomId,
      if (description != null) 'description': description,
      if (createdByUserId != null) 'created_by_user_id': createdByUserId,
      if (attendeeCount != null) 'attendee_count': attendeeCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? eventType,
      Value<DateTime>? eventDate,
      Value<String>? startTime,
      Value<String>? endTime,
      Value<String?>? roomId,
      Value<String?>? description,
      Value<String>? createdByUserId,
      Value<int>? attendeeCount,
      Value<int>? rowid}) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      eventType: eventType ?? this.eventType,
      eventDate: eventDate ?? this.eventDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      roomId: roomId ?? this.roomId,
      description: description ?? this.description,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      attendeeCount: attendeeCount ?? this.attendeeCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (eventDate.present) {
      map['event_date'] = Variable<DateTime>(eventDate.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdByUserId.present) {
      map['created_by_user_id'] = Variable<String>(createdByUserId.value);
    }
    if (attendeeCount.present) {
      map['attendee_count'] = Variable<int>(attendeeCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('eventType: $eventType, ')
          ..write('eventDate: $eventDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('roomId: $roomId, ')
          ..write('description: $description, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('attendeeCount: $attendeeCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomBookingsTable extends RoomBookings
    with TableInfo<$RoomBookingsTable, RoomBooking> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomBookingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
      'room_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventIdMeta =
      const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
      'event_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bookedFromMeta =
      const VerificationMeta('bookedFrom');
  @override
  late final GeneratedColumn<DateTime> bookedFrom = GeneratedColumn<DateTime>(
      'booked_from', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _bookedToMeta =
      const VerificationMeta('bookedTo');
  @override
  late final GeneratedColumn<DateTime> bookedTo = GeneratedColumn<DateTime>(
      'booked_to', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomId, eventId, bookedFrom, bookedTo, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_bookings';
  @override
  VerificationContext validateIntegrity(Insertable<RoomBooking> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('booked_from')) {
      context.handle(
          _bookedFromMeta,
          bookedFrom.isAcceptableOrUnknown(
              data['booked_from']!, _bookedFromMeta));
    } else if (isInserting) {
      context.missing(_bookedFromMeta);
    }
    if (data.containsKey('booked_to')) {
      context.handle(_bookedToMeta,
          bookedTo.isAcceptableOrUnknown(data['booked_to']!, _bookedToMeta));
    } else if (isInserting) {
      context.missing(_bookedToMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomBooking map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomBooking(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_id'])!,
      eventId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_id']),
      bookedFrom: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}booked_from'])!,
      bookedTo: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}booked_to'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $RoomBookingsTable createAlias(String alias) {
    return $RoomBookingsTable(attachedDatabase, alias);
  }
}

class RoomBooking extends DataClass implements Insertable<RoomBooking> {
  final String id;
  final String roomId;
  final String? eventId;
  final DateTime bookedFrom;
  final DateTime bookedTo;
  final String status;
  const RoomBooking(
      {required this.id,
      required this.roomId,
      this.eventId,
      required this.bookedFrom,
      required this.bookedTo,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_id'] = Variable<String>(roomId);
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<String>(eventId);
    }
    map['booked_from'] = Variable<DateTime>(bookedFrom);
    map['booked_to'] = Variable<DateTime>(bookedTo);
    map['status'] = Variable<String>(status);
    return map;
  }

  RoomBookingsCompanion toCompanion(bool nullToAbsent) {
    return RoomBookingsCompanion(
      id: Value(id),
      roomId: Value(roomId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      bookedFrom: Value(bookedFrom),
      bookedTo: Value(bookedTo),
      status: Value(status),
    );
  }

  factory RoomBooking.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomBooking(
      id: serializer.fromJson<String>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      eventId: serializer.fromJson<String?>(json['eventId']),
      bookedFrom: serializer.fromJson<DateTime>(json['bookedFrom']),
      bookedTo: serializer.fromJson<DateTime>(json['bookedTo']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomId': serializer.toJson<String>(roomId),
      'eventId': serializer.toJson<String?>(eventId),
      'bookedFrom': serializer.toJson<DateTime>(bookedFrom),
      'bookedTo': serializer.toJson<DateTime>(bookedTo),
      'status': serializer.toJson<String>(status),
    };
  }

  RoomBooking copyWith(
          {String? id,
          String? roomId,
          Value<String?> eventId = const Value.absent(),
          DateTime? bookedFrom,
          DateTime? bookedTo,
          String? status}) =>
      RoomBooking(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        eventId: eventId.present ? eventId.value : this.eventId,
        bookedFrom: bookedFrom ?? this.bookedFrom,
        bookedTo: bookedTo ?? this.bookedTo,
        status: status ?? this.status,
      );
  RoomBooking copyWithCompanion(RoomBookingsCompanion data) {
    return RoomBooking(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      bookedFrom:
          data.bookedFrom.present ? data.bookedFrom.value : this.bookedFrom,
      bookedTo: data.bookedTo.present ? data.bookedTo.value : this.bookedTo,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomBooking(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('eventId: $eventId, ')
          ..write('bookedFrom: $bookedFrom, ')
          ..write('bookedTo: $bookedTo, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roomId, eventId, bookedFrom, bookedTo, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomBooking &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.eventId == this.eventId &&
          other.bookedFrom == this.bookedFrom &&
          other.bookedTo == this.bookedTo &&
          other.status == this.status);
}

class RoomBookingsCompanion extends UpdateCompanion<RoomBooking> {
  final Value<String> id;
  final Value<String> roomId;
  final Value<String?> eventId;
  final Value<DateTime> bookedFrom;
  final Value<DateTime> bookedTo;
  final Value<String> status;
  final Value<int> rowid;
  const RoomBookingsCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.bookedFrom = const Value.absent(),
    this.bookedTo = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomBookingsCompanion.insert({
    required String id,
    required String roomId,
    this.eventId = const Value.absent(),
    required DateTime bookedFrom,
    required DateTime bookedTo,
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roomId = Value(roomId),
        bookedFrom = Value(bookedFrom),
        bookedTo = Value(bookedTo),
        status = Value(status);
  static Insertable<RoomBooking> custom({
    Expression<String>? id,
    Expression<String>? roomId,
    Expression<String>? eventId,
    Expression<DateTime>? bookedFrom,
    Expression<DateTime>? bookedTo,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (eventId != null) 'event_id': eventId,
      if (bookedFrom != null) 'booked_from': bookedFrom,
      if (bookedTo != null) 'booked_to': bookedTo,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomBookingsCompanion copyWith(
      {Value<String>? id,
      Value<String>? roomId,
      Value<String?>? eventId,
      Value<DateTime>? bookedFrom,
      Value<DateTime>? bookedTo,
      Value<String>? status,
      Value<int>? rowid}) {
    return RoomBookingsCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      eventId: eventId ?? this.eventId,
      bookedFrom: bookedFrom ?? this.bookedFrom,
      bookedTo: bookedTo ?? this.bookedTo,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (bookedFrom.present) {
      map['booked_from'] = Variable<DateTime>(bookedFrom.value);
    }
    if (bookedTo.present) {
      map['booked_to'] = Variable<DateTime>(bookedTo.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomBookingsCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('eventId: $eventId, ')
          ..write('bookedFrom: $bookedFrom, ')
          ..write('bookedTo: $bookedTo, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReportTemplatesTable extends ReportTemplates
    with TableInfo<$ReportTemplatesTable, ReportTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reportTypeMeta =
      const VerificationMeta('reportType');
  @override
  late final GeneratedColumn<String> reportType = GeneratedColumn<String>(
      'report_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filtersJsonMeta =
      const VerificationMeta('filtersJson');
  @override
  late final GeneratedColumn<String> filtersJson = GeneratedColumn<String>(
      'filters_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdByUserIdMeta =
      const VerificationMeta('createdByUserId');
  @override
  late final GeneratedColumn<String> createdByUserId = GeneratedColumn<String>(
      'created_by_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isScheduledMeta =
      const VerificationMeta('isScheduled');
  @override
  late final GeneratedColumn<bool> isScheduled = GeneratedColumn<bool>(
      'is_scheduled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_scheduled" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, reportType, filtersJson, createdByUserId, isScheduled];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'report_templates';
  @override
  VerificationContext validateIntegrity(Insertable<ReportTemplate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('report_type')) {
      context.handle(
          _reportTypeMeta,
          reportType.isAcceptableOrUnknown(
              data['report_type']!, _reportTypeMeta));
    } else if (isInserting) {
      context.missing(_reportTypeMeta);
    }
    if (data.containsKey('filters_json')) {
      context.handle(
          _filtersJsonMeta,
          filtersJson.isAcceptableOrUnknown(
              data['filters_json']!, _filtersJsonMeta));
    } else if (isInserting) {
      context.missing(_filtersJsonMeta);
    }
    if (data.containsKey('created_by_user_id')) {
      context.handle(
          _createdByUserIdMeta,
          createdByUserId.isAcceptableOrUnknown(
              data['created_by_user_id']!, _createdByUserIdMeta));
    } else if (isInserting) {
      context.missing(_createdByUserIdMeta);
    }
    if (data.containsKey('is_scheduled')) {
      context.handle(
          _isScheduledMeta,
          isScheduled.isAcceptableOrUnknown(
              data['is_scheduled']!, _isScheduledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportTemplate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      reportType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_type'])!,
      filtersJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filters_json'])!,
      createdByUserId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_user_id'])!,
      isScheduled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_scheduled'])!,
    );
  }

  @override
  $ReportTemplatesTable createAlias(String alias) {
    return $ReportTemplatesTable(attachedDatabase, alias);
  }
}

class ReportTemplate extends DataClass implements Insertable<ReportTemplate> {
  final String id;
  final String name;
  final String reportType;
  final String filtersJson;
  final String createdByUserId;
  final bool isScheduled;
  const ReportTemplate(
      {required this.id,
      required this.name,
      required this.reportType,
      required this.filtersJson,
      required this.createdByUserId,
      required this.isScheduled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['report_type'] = Variable<String>(reportType);
    map['filters_json'] = Variable<String>(filtersJson);
    map['created_by_user_id'] = Variable<String>(createdByUserId);
    map['is_scheduled'] = Variable<bool>(isScheduled);
    return map;
  }

  ReportTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ReportTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      reportType: Value(reportType),
      filtersJson: Value(filtersJson),
      createdByUserId: Value(createdByUserId),
      isScheduled: Value(isScheduled),
    );
  }

  factory ReportTemplate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      reportType: serializer.fromJson<String>(json['reportType']),
      filtersJson: serializer.fromJson<String>(json['filtersJson']),
      createdByUserId: serializer.fromJson<String>(json['createdByUserId']),
      isScheduled: serializer.fromJson<bool>(json['isScheduled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'reportType': serializer.toJson<String>(reportType),
      'filtersJson': serializer.toJson<String>(filtersJson),
      'createdByUserId': serializer.toJson<String>(createdByUserId),
      'isScheduled': serializer.toJson<bool>(isScheduled),
    };
  }

  ReportTemplate copyWith(
          {String? id,
          String? name,
          String? reportType,
          String? filtersJson,
          String? createdByUserId,
          bool? isScheduled}) =>
      ReportTemplate(
        id: id ?? this.id,
        name: name ?? this.name,
        reportType: reportType ?? this.reportType,
        filtersJson: filtersJson ?? this.filtersJson,
        createdByUserId: createdByUserId ?? this.createdByUserId,
        isScheduled: isScheduled ?? this.isScheduled,
      );
  ReportTemplate copyWithCompanion(ReportTemplatesCompanion data) {
    return ReportTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      reportType:
          data.reportType.present ? data.reportType.value : this.reportType,
      filtersJson:
          data.filtersJson.present ? data.filtersJson.value : this.filtersJson,
      createdByUserId: data.createdByUserId.present
          ? data.createdByUserId.value
          : this.createdByUserId,
      isScheduled:
          data.isScheduled.present ? data.isScheduled.value : this.isScheduled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('reportType: $reportType, ')
          ..write('filtersJson: $filtersJson, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('isScheduled: $isScheduled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, reportType, filtersJson, createdByUserId, isScheduled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.reportType == this.reportType &&
          other.filtersJson == this.filtersJson &&
          other.createdByUserId == this.createdByUserId &&
          other.isScheduled == this.isScheduled);
}

class ReportTemplatesCompanion extends UpdateCompanion<ReportTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> reportType;
  final Value<String> filtersJson;
  final Value<String> createdByUserId;
  final Value<bool> isScheduled;
  final Value<int> rowid;
  const ReportTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.reportType = const Value.absent(),
    this.filtersJson = const Value.absent(),
    this.createdByUserId = const Value.absent(),
    this.isScheduled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReportTemplatesCompanion.insert({
    required String id,
    required String name,
    required String reportType,
    required String filtersJson,
    required String createdByUserId,
    this.isScheduled = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        reportType = Value(reportType),
        filtersJson = Value(filtersJson),
        createdByUserId = Value(createdByUserId);
  static Insertable<ReportTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? reportType,
    Expression<String>? filtersJson,
    Expression<String>? createdByUserId,
    Expression<bool>? isScheduled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (reportType != null) 'report_type': reportType,
      if (filtersJson != null) 'filters_json': filtersJson,
      if (createdByUserId != null) 'created_by_user_id': createdByUserId,
      if (isScheduled != null) 'is_scheduled': isScheduled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReportTemplatesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? reportType,
      Value<String>? filtersJson,
      Value<String>? createdByUserId,
      Value<bool>? isScheduled,
      Value<int>? rowid}) {
    return ReportTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      reportType: reportType ?? this.reportType,
      filtersJson: filtersJson ?? this.filtersJson,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      isScheduled: isScheduled ?? this.isScheduled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (reportType.present) {
      map['report_type'] = Variable<String>(reportType.value);
    }
    if (filtersJson.present) {
      map['filters_json'] = Variable<String>(filtersJson.value);
    }
    if (createdByUserId.present) {
      map['created_by_user_id'] = Variable<String>(createdByUserId.value);
    }
    if (isScheduled.present) {
      map['is_scheduled'] = Variable<bool>(isScheduled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('reportType: $reportType, ')
          ..write('filtersJson: $filtersJson, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('isScheduled: $isScheduled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GeneratedReportsTable extends GeneratedReports
    with TableInfo<$GeneratedReportsTable, GeneratedReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeneratedReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _templateIdMeta =
      const VerificationMeta('templateId');
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
      'template_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reportNameMeta =
      const VerificationMeta('reportName');
  @override
  late final GeneratedColumn<String> reportName = GeneratedColumn<String>(
      'report_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reportTypeMeta =
      const VerificationMeta('reportType');
  @override
  late final GeneratedColumn<String> reportType = GeneratedColumn<String>(
      'report_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateFromMeta =
      const VerificationMeta('dateFrom');
  @override
  late final GeneratedColumn<DateTime> dateFrom = GeneratedColumn<DateTime>(
      'date_from', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateToMeta = const VerificationMeta('dateTo');
  @override
  late final GeneratedColumn<DateTime> dateTo = GeneratedColumn<DateTime>(
      'date_to', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
      'generated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('completed'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        templateId,
        reportName,
        reportType,
        dateFrom,
        dateTo,
        format,
        generatedAt,
        filePath,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'generated_reports';
  @override
  VerificationContext validateIntegrity(Insertable<GeneratedReport> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
          _templateIdMeta,
          templateId.isAcceptableOrUnknown(
              data['template_id']!, _templateIdMeta));
    }
    if (data.containsKey('report_name')) {
      context.handle(
          _reportNameMeta,
          reportName.isAcceptableOrUnknown(
              data['report_name']!, _reportNameMeta));
    } else if (isInserting) {
      context.missing(_reportNameMeta);
    }
    if (data.containsKey('report_type')) {
      context.handle(
          _reportTypeMeta,
          reportType.isAcceptableOrUnknown(
              data['report_type']!, _reportTypeMeta));
    } else if (isInserting) {
      context.missing(_reportTypeMeta);
    }
    if (data.containsKey('date_from')) {
      context.handle(_dateFromMeta,
          dateFrom.isAcceptableOrUnknown(data['date_from']!, _dateFromMeta));
    } else if (isInserting) {
      context.missing(_dateFromMeta);
    }
    if (data.containsKey('date_to')) {
      context.handle(_dateToMeta,
          dateTo.isAcceptableOrUnknown(data['date_to']!, _dateToMeta));
    } else if (isInserting) {
      context.missing(_dateToMeta);
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    } else if (isInserting) {
      context.missing(_formatMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeneratedReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeneratedReport(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}template_id']),
      reportName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_name'])!,
      reportType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_type'])!,
      dateFrom: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_from'])!,
      dateTo: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_to'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}generated_at'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $GeneratedReportsTable createAlias(String alias) {
    return $GeneratedReportsTable(attachedDatabase, alias);
  }
}

class GeneratedReport extends DataClass implements Insertable<GeneratedReport> {
  final String id;
  final String? templateId;
  final String reportName;
  final String reportType;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String format;
  final DateTime generatedAt;
  final String filePath;
  final String status;
  const GeneratedReport(
      {required this.id,
      this.templateId,
      required this.reportName,
      required this.reportType,
      required this.dateFrom,
      required this.dateTo,
      required this.format,
      required this.generatedAt,
      required this.filePath,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    map['report_name'] = Variable<String>(reportName);
    map['report_type'] = Variable<String>(reportType);
    map['date_from'] = Variable<DateTime>(dateFrom);
    map['date_to'] = Variable<DateTime>(dateTo);
    map['format'] = Variable<String>(format);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['file_path'] = Variable<String>(filePath);
    map['status'] = Variable<String>(status);
    return map;
  }

  GeneratedReportsCompanion toCompanion(bool nullToAbsent) {
    return GeneratedReportsCompanion(
      id: Value(id),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      reportName: Value(reportName),
      reportType: Value(reportType),
      dateFrom: Value(dateFrom),
      dateTo: Value(dateTo),
      format: Value(format),
      generatedAt: Value(generatedAt),
      filePath: Value(filePath),
      status: Value(status),
    );
  }

  factory GeneratedReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeneratedReport(
      id: serializer.fromJson<String>(json['id']),
      templateId: serializer.fromJson<String?>(json['templateId']),
      reportName: serializer.fromJson<String>(json['reportName']),
      reportType: serializer.fromJson<String>(json['reportType']),
      dateFrom: serializer.fromJson<DateTime>(json['dateFrom']),
      dateTo: serializer.fromJson<DateTime>(json['dateTo']),
      format: serializer.fromJson<String>(json['format']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      filePath: serializer.fromJson<String>(json['filePath']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'templateId': serializer.toJson<String?>(templateId),
      'reportName': serializer.toJson<String>(reportName),
      'reportType': serializer.toJson<String>(reportType),
      'dateFrom': serializer.toJson<DateTime>(dateFrom),
      'dateTo': serializer.toJson<DateTime>(dateTo),
      'format': serializer.toJson<String>(format),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'filePath': serializer.toJson<String>(filePath),
      'status': serializer.toJson<String>(status),
    };
  }

  GeneratedReport copyWith(
          {String? id,
          Value<String?> templateId = const Value.absent(),
          String? reportName,
          String? reportType,
          DateTime? dateFrom,
          DateTime? dateTo,
          String? format,
          DateTime? generatedAt,
          String? filePath,
          String? status}) =>
      GeneratedReport(
        id: id ?? this.id,
        templateId: templateId.present ? templateId.value : this.templateId,
        reportName: reportName ?? this.reportName,
        reportType: reportType ?? this.reportType,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        format: format ?? this.format,
        generatedAt: generatedAt ?? this.generatedAt,
        filePath: filePath ?? this.filePath,
        status: status ?? this.status,
      );
  GeneratedReport copyWithCompanion(GeneratedReportsCompanion data) {
    return GeneratedReport(
      id: data.id.present ? data.id.value : this.id,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      reportName:
          data.reportName.present ? data.reportName.value : this.reportName,
      reportType:
          data.reportType.present ? data.reportType.value : this.reportType,
      dateFrom: data.dateFrom.present ? data.dateFrom.value : this.dateFrom,
      dateTo: data.dateTo.present ? data.dateTo.value : this.dateTo,
      format: data.format.present ? data.format.value : this.format,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedReport(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('reportName: $reportName, ')
          ..write('reportType: $reportType, ')
          ..write('dateFrom: $dateFrom, ')
          ..write('dateTo: $dateTo, ')
          ..write('format: $format, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('filePath: $filePath, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, reportName, reportType,
      dateFrom, dateTo, format, generatedAt, filePath, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeneratedReport &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.reportName == this.reportName &&
          other.reportType == this.reportType &&
          other.dateFrom == this.dateFrom &&
          other.dateTo == this.dateTo &&
          other.format == this.format &&
          other.generatedAt == this.generatedAt &&
          other.filePath == this.filePath &&
          other.status == this.status);
}

class GeneratedReportsCompanion extends UpdateCompanion<GeneratedReport> {
  final Value<String> id;
  final Value<String?> templateId;
  final Value<String> reportName;
  final Value<String> reportType;
  final Value<DateTime> dateFrom;
  final Value<DateTime> dateTo;
  final Value<String> format;
  final Value<DateTime> generatedAt;
  final Value<String> filePath;
  final Value<String> status;
  final Value<int> rowid;
  const GeneratedReportsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.reportName = const Value.absent(),
    this.reportType = const Value.absent(),
    this.dateFrom = const Value.absent(),
    this.dateTo = const Value.absent(),
    this.format = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.filePath = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeneratedReportsCompanion.insert({
    required String id,
    this.templateId = const Value.absent(),
    required String reportName,
    required String reportType,
    required DateTime dateFrom,
    required DateTime dateTo,
    required String format,
    required DateTime generatedAt,
    required String filePath,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        reportName = Value(reportName),
        reportType = Value(reportType),
        dateFrom = Value(dateFrom),
        dateTo = Value(dateTo),
        format = Value(format),
        generatedAt = Value(generatedAt),
        filePath = Value(filePath);
  static Insertable<GeneratedReport> custom({
    Expression<String>? id,
    Expression<String>? templateId,
    Expression<String>? reportName,
    Expression<String>? reportType,
    Expression<DateTime>? dateFrom,
    Expression<DateTime>? dateTo,
    Expression<String>? format,
    Expression<DateTime>? generatedAt,
    Expression<String>? filePath,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (reportName != null) 'report_name': reportName,
      if (reportType != null) 'report_type': reportType,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
      if (format != null) 'format': format,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (filePath != null) 'file_path': filePath,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeneratedReportsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? templateId,
      Value<String>? reportName,
      Value<String>? reportType,
      Value<DateTime>? dateFrom,
      Value<DateTime>? dateTo,
      Value<String>? format,
      Value<DateTime>? generatedAt,
      Value<String>? filePath,
      Value<String>? status,
      Value<int>? rowid}) {
    return GeneratedReportsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      reportName: reportName ?? this.reportName,
      reportType: reportType ?? this.reportType,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
      format: format ?? this.format,
      generatedAt: generatedAt ?? this.generatedAt,
      filePath: filePath ?? this.filePath,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (reportName.present) {
      map['report_name'] = Variable<String>(reportName.value);
    }
    if (reportType.present) {
      map['report_type'] = Variable<String>(reportType.value);
    }
    if (dateFrom.present) {
      map['date_from'] = Variable<DateTime>(dateFrom.value);
    }
    if (dateTo.present) {
      map['date_to'] = Variable<DateTime>(dateTo.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedReportsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('reportName: $reportName, ')
          ..write('reportType: $reportType, ')
          ..write('dateFrom: $dateFrom, ')
          ..write('dateTo: $dateTo, ')
          ..write('format: $format, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('filePath: $filePath, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogTable extends AuditLog
    with TableInfo<$AuditLogTable, AuditLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _occurredAtMeta =
      const VerificationMeta('occurredAt');
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
      'occurred_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moduleMeta = const VerificationMeta('module');
  @override
  late final GeneratedColumn<String> module = GeneratedColumn<String>(
      'module', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailsJsonMeta =
      const VerificationMeta('detailsJson');
  @override
  late final GeneratedColumn<String> detailsJson = GeneratedColumn<String>(
      'details_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, occurredAt, userId, userName, action, module, status, detailsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_log';
  @override
  VerificationContext validateIntegrity(Insertable<AuditLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta,
          occurredAt.isAcceptableOrUnknown(
              data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('module')) {
      context.handle(_moduleMeta,
          module.isAcceptableOrUnknown(data['module']!, _moduleMeta));
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('details_json')) {
      context.handle(
          _detailsJsonMeta,
          detailsJson.isAcceptableOrUnknown(
              data['details_json']!, _detailsJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      occurredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occurred_at'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      module: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}module'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      detailsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details_json']),
    );
  }

  @override
  $AuditLogTable createAlias(String alias) {
    return $AuditLogTable(attachedDatabase, alias);
  }
}

class AuditLogData extends DataClass implements Insertable<AuditLogData> {
  final String id;
  final DateTime occurredAt;
  final String userId;
  final String userName;
  final String action;
  final String module;
  final String status;
  final String? detailsJson;
  const AuditLogData(
      {required this.id,
      required this.occurredAt,
      required this.userId,
      required this.userName,
      required this.action,
      required this.module,
      required this.status,
      this.detailsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['user_id'] = Variable<String>(userId);
    map['user_name'] = Variable<String>(userName);
    map['action'] = Variable<String>(action);
    map['module'] = Variable<String>(module);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || detailsJson != null) {
      map['details_json'] = Variable<String>(detailsJson);
    }
    return map;
  }

  AuditLogCompanion toCompanion(bool nullToAbsent) {
    return AuditLogCompanion(
      id: Value(id),
      occurredAt: Value(occurredAt),
      userId: Value(userId),
      userName: Value(userName),
      action: Value(action),
      module: Value(module),
      status: Value(status),
      detailsJson: detailsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(detailsJson),
    );
  }

  factory AuditLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogData(
      id: serializer.fromJson<String>(json['id']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      userId: serializer.fromJson<String>(json['userId']),
      userName: serializer.fromJson<String>(json['userName']),
      action: serializer.fromJson<String>(json['action']),
      module: serializer.fromJson<String>(json['module']),
      status: serializer.fromJson<String>(json['status']),
      detailsJson: serializer.fromJson<String?>(json['detailsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'userId': serializer.toJson<String>(userId),
      'userName': serializer.toJson<String>(userName),
      'action': serializer.toJson<String>(action),
      'module': serializer.toJson<String>(module),
      'status': serializer.toJson<String>(status),
      'detailsJson': serializer.toJson<String?>(detailsJson),
    };
  }

  AuditLogData copyWith(
          {String? id,
          DateTime? occurredAt,
          String? userId,
          String? userName,
          String? action,
          String? module,
          String? status,
          Value<String?> detailsJson = const Value.absent()}) =>
      AuditLogData(
        id: id ?? this.id,
        occurredAt: occurredAt ?? this.occurredAt,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        action: action ?? this.action,
        module: module ?? this.module,
        status: status ?? this.status,
        detailsJson: detailsJson.present ? detailsJson.value : this.detailsJson,
      );
  AuditLogData copyWithCompanion(AuditLogCompanion data) {
    return AuditLogData(
      id: data.id.present ? data.id.value : this.id,
      occurredAt:
          data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      userId: data.userId.present ? data.userId.value : this.userId,
      userName: data.userName.present ? data.userName.value : this.userName,
      action: data.action.present ? data.action.value : this.action,
      module: data.module.present ? data.module.value : this.module,
      status: data.status.present ? data.status.value : this.status,
      detailsJson:
          data.detailsJson.present ? data.detailsJson.value : this.detailsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogData(')
          ..write('id: $id, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('action: $action, ')
          ..write('module: $module, ')
          ..write('status: $status, ')
          ..write('detailsJson: $detailsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, occurredAt, userId, userName, action, module, status, detailsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogData &&
          other.id == this.id &&
          other.occurredAt == this.occurredAt &&
          other.userId == this.userId &&
          other.userName == this.userName &&
          other.action == this.action &&
          other.module == this.module &&
          other.status == this.status &&
          other.detailsJson == this.detailsJson);
}

class AuditLogCompanion extends UpdateCompanion<AuditLogData> {
  final Value<String> id;
  final Value<DateTime> occurredAt;
  final Value<String> userId;
  final Value<String> userName;
  final Value<String> action;
  final Value<String> module;
  final Value<String> status;
  final Value<String?> detailsJson;
  final Value<int> rowid;
  const AuditLogCompanion({
    this.id = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.userName = const Value.absent(),
    this.action = const Value.absent(),
    this.module = const Value.absent(),
    this.status = const Value.absent(),
    this.detailsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditLogCompanion.insert({
    required String id,
    required DateTime occurredAt,
    required String userId,
    required String userName,
    required String action,
    required String module,
    required String status,
    this.detailsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        occurredAt = Value(occurredAt),
        userId = Value(userId),
        userName = Value(userName),
        action = Value(action),
        module = Value(module),
        status = Value(status);
  static Insertable<AuditLogData> custom({
    Expression<String>? id,
    Expression<DateTime>? occurredAt,
    Expression<String>? userId,
    Expression<String>? userName,
    Expression<String>? action,
    Expression<String>? module,
    Expression<String>? status,
    Expression<String>? detailsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (userId != null) 'user_id': userId,
      if (userName != null) 'user_name': userName,
      if (action != null) 'action': action,
      if (module != null) 'module': module,
      if (status != null) 'status': status,
      if (detailsJson != null) 'details_json': detailsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditLogCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? occurredAt,
      Value<String>? userId,
      Value<String>? userName,
      Value<String>? action,
      Value<String>? module,
      Value<String>? status,
      Value<String?>? detailsJson,
      Value<int>? rowid}) {
    return AuditLogCompanion(
      id: id ?? this.id,
      occurredAt: occurredAt ?? this.occurredAt,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      action: action ?? this.action,
      module: module ?? this.module,
      status: status ?? this.status,
      detailsJson: detailsJson ?? this.detailsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (detailsJson.present) {
      map['details_json'] = Variable<String>(detailsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogCompanion(')
          ..write('id: $id, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('action: $action, ')
          ..write('module: $module, ')
          ..write('status: $status, ')
          ..write('detailsJson: $detailsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$BusinessDatabase extends GeneratedDatabase {
  _$BusinessDatabase(QueryExecutor e) : super(e);
  $BusinessDatabaseManager get managers => $BusinessDatabaseManager(this);
  late final $ChartOfAccountsTable chartOfAccounts =
      $ChartOfAccountsTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $JournalLinesTable journalLines = $JournalLinesTable(this);
  late final $BankAccountsTable bankAccounts = $BankAccountsTable(this);
  late final $BankReconciliationsTable bankReconciliations =
      $BankReconciliationsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceLineItemsTable invoiceLineItems =
      $InvoiceLineItemsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final $EmployeesTable employees = $EmployeesTable(this);
  late final $AttendanceTable attendance = $AttendanceTable(this);
  late final $LeaveRequestsTable leaveRequests = $LeaveRequestsTable(this);
  late final $LeaveBalancesTable leaveBalances = $LeaveBalancesTable(this);
  late final $PayrollRunsTable payrollRuns = $PayrollRunsTable(this);
  late final $PayrollItemsTable payrollItems = $PayrollItemsTable(this);
  late final $EmploymentContractsTable employmentContracts =
      $EmploymentContractsTable(this);
  late final $AssetsTable assets = $AssetsTable(this);
  late final $AssetDepreciationScheduleTable assetDepreciationSchedule =
      $AssetDepreciationScheduleTable(this);
  late final $AssetValuationsTable assetValuations =
      $AssetValuationsTable(this);
  late final $InventoryItemsTable inventoryItems = $InventoryItemsTable(this);
  late final $InventoryPurchasesTable inventoryPurchases =
      $InventoryPurchasesTable(this);
  late final $InventoryAdjustmentsTable inventoryAdjustments =
      $InventoryAdjustmentsTable(this);
  late final $MeetingRoomsTable meetingRooms = $MeetingRoomsTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $RoomBookingsTable roomBookings = $RoomBookingsTable(this);
  late final $ReportTemplatesTable reportTemplates =
      $ReportTemplatesTable(this);
  late final $GeneratedReportsTable generatedReports =
      $GeneratedReportsTable(this);
  late final $AuditLogTable auditLog = $AuditLogTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        chartOfAccounts,
        journalEntries,
        journalLines,
        bankAccounts,
        bankReconciliations,
        invoices,
        invoiceLineItems,
        transactions,
        budgets,
        employees,
        attendance,
        leaveRequests,
        leaveBalances,
        payrollRuns,
        payrollItems,
        employmentContracts,
        assets,
        assetDepreciationSchedule,
        assetValuations,
        inventoryItems,
        inventoryPurchases,
        inventoryAdjustments,
        meetingRooms,
        calendarEvents,
        roomBookings,
        reportTemplates,
        generatedReports,
        auditLog
      ];
}

typedef $$ChartOfAccountsTableCreateCompanionBuilder = ChartOfAccountsCompanion
    Function({
  required String id,
  required String code,
  required String name,
  required String accountType,
  Value<String?> parentAccountId,
  Value<bool> isActive,
  Value<int> rowid,
});
typedef $$ChartOfAccountsTableUpdateCompanionBuilder = ChartOfAccountsCompanion
    Function({
  Value<String> id,
  Value<String> code,
  Value<String> name,
  Value<String> accountType,
  Value<String?> parentAccountId,
  Value<bool> isActive,
  Value<int> rowid,
});

class $$ChartOfAccountsTableFilterComposer
    extends Composer<_$BusinessDatabase, $ChartOfAccountsTable> {
  $$ChartOfAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentAccountId => $composableBuilder(
      column: $table.parentAccountId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));
}

class $$ChartOfAccountsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $ChartOfAccountsTable> {
  $$ChartOfAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentAccountId => $composableBuilder(
      column: $table.parentAccountId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$ChartOfAccountsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $ChartOfAccountsTable> {
  $$ChartOfAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => column);

  GeneratedColumn<String> get parentAccountId => $composableBuilder(
      column: $table.parentAccountId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$ChartOfAccountsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $ChartOfAccountsTable,
    ChartOfAccount,
    $$ChartOfAccountsTableFilterComposer,
    $$ChartOfAccountsTableOrderingComposer,
    $$ChartOfAccountsTableAnnotationComposer,
    $$ChartOfAccountsTableCreateCompanionBuilder,
    $$ChartOfAccountsTableUpdateCompanionBuilder,
    (
      ChartOfAccount,
      BaseReferences<_$BusinessDatabase, $ChartOfAccountsTable, ChartOfAccount>
    ),
    ChartOfAccount,
    PrefetchHooks Function()> {
  $$ChartOfAccountsTableTableManager(
      _$BusinessDatabase db, $ChartOfAccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChartOfAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChartOfAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChartOfAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> accountType = const Value.absent(),
            Value<String?> parentAccountId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChartOfAccountsCompanion(
            id: id,
            code: code,
            name: name,
            accountType: accountType,
            parentAccountId: parentAccountId,
            isActive: isActive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String code,
            required String name,
            required String accountType,
            Value<String?> parentAccountId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChartOfAccountsCompanion.insert(
            id: id,
            code: code,
            name: name,
            accountType: accountType,
            parentAccountId: parentAccountId,
            isActive: isActive,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChartOfAccountsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $ChartOfAccountsTable,
    ChartOfAccount,
    $$ChartOfAccountsTableFilterComposer,
    $$ChartOfAccountsTableOrderingComposer,
    $$ChartOfAccountsTableAnnotationComposer,
    $$ChartOfAccountsTableCreateCompanionBuilder,
    $$ChartOfAccountsTableUpdateCompanionBuilder,
    (
      ChartOfAccount,
      BaseReferences<_$BusinessDatabase, $ChartOfAccountsTable, ChartOfAccount>
    ),
    ChartOfAccount,
    PrefetchHooks Function()>;
typedef $$JournalEntriesTableCreateCompanionBuilder = JournalEntriesCompanion
    Function({
  required String id,
  required DateTime entryDate,
  required String referenceNo,
  required String description,
  Value<String> status,
  required String createdByUserId,
  required int totalDebit,
  required int totalCredit,
  Value<int> rowid,
});
typedef $$JournalEntriesTableUpdateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<String> id,
  Value<DateTime> entryDate,
  Value<String> referenceNo,
  Value<String> description,
  Value<String> status,
  Value<String> createdByUserId,
  Value<int> totalDebit,
  Value<int> totalCredit,
  Value<int> rowid,
});

class $$JournalEntriesTableFilterComposer
    extends Composer<_$BusinessDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get entryDate => $composableBuilder(
      column: $table.entryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNo => $composableBuilder(
      column: $table.referenceNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalDebit => $composableBuilder(
      column: $table.totalDebit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCredit => $composableBuilder(
      column: $table.totalCredit, builder: (column) => ColumnFilters(column));
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get entryDate => $composableBuilder(
      column: $table.entryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNo => $composableBuilder(
      column: $table.referenceNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalDebit => $composableBuilder(
      column: $table.totalDebit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCredit => $composableBuilder(
      column: $table.totalCredit, builder: (column) => ColumnOrderings(column));
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get entryDate =>
      $composableBuilder(column: $table.entryDate, builder: (column) => column);

  GeneratedColumn<String> get referenceNo => $composableBuilder(
      column: $table.referenceNo, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId, builder: (column) => column);

  GeneratedColumn<int> get totalDebit => $composableBuilder(
      column: $table.totalDebit, builder: (column) => column);

  GeneratedColumn<int> get totalCredit => $composableBuilder(
      column: $table.totalCredit, builder: (column) => column);
}

class $$JournalEntriesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $JournalEntriesTable,
    JournalEntry,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (
      JournalEntry,
      BaseReferences<_$BusinessDatabase, $JournalEntriesTable, JournalEntry>
    ),
    JournalEntry,
    PrefetchHooks Function()> {
  $$JournalEntriesTableTableManager(
      _$BusinessDatabase db, $JournalEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> entryDate = const Value.absent(),
            Value<String> referenceNo = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> createdByUserId = const Value.absent(),
            Value<int> totalDebit = const Value.absent(),
            Value<int> totalCredit = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion(
            id: id,
            entryDate: entryDate,
            referenceNo: referenceNo,
            description: description,
            status: status,
            createdByUserId: createdByUserId,
            totalDebit: totalDebit,
            totalCredit: totalCredit,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime entryDate,
            required String referenceNo,
            required String description,
            Value<String> status = const Value.absent(),
            required String createdByUserId,
            required int totalDebit,
            required int totalCredit,
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion.insert(
            id: id,
            entryDate: entryDate,
            referenceNo: referenceNo,
            description: description,
            status: status,
            createdByUserId: createdByUserId,
            totalDebit: totalDebit,
            totalCredit: totalCredit,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JournalEntriesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $JournalEntriesTable,
    JournalEntry,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (
      JournalEntry,
      BaseReferences<_$BusinessDatabase, $JournalEntriesTable, JournalEntry>
    ),
    JournalEntry,
    PrefetchHooks Function()>;
typedef $$JournalLinesTableCreateCompanionBuilder = JournalLinesCompanion
    Function({
  required String id,
  required String journalEntryId,
  required String accountId,
  Value<int> debit,
  Value<int> credit,
  Value<String?> memo,
  Value<int> rowid,
});
typedef $$JournalLinesTableUpdateCompanionBuilder = JournalLinesCompanion
    Function({
  Value<String> id,
  Value<String> journalEntryId,
  Value<String> accountId,
  Value<int> debit,
  Value<int> credit,
  Value<String?> memo,
  Value<int> rowid,
});

class $$JournalLinesTableFilterComposer
    extends Composer<_$BusinessDatabase, $JournalLinesTable> {
  $$JournalLinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get debit => $composableBuilder(
      column: $table.debit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get credit => $composableBuilder(
      column: $table.credit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memo => $composableBuilder(
      column: $table.memo, builder: (column) => ColumnFilters(column));
}

class $$JournalLinesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $JournalLinesTable> {
  $$JournalLinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get debit => $composableBuilder(
      column: $table.debit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get credit => $composableBuilder(
      column: $table.credit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memo => $composableBuilder(
      column: $table.memo, builder: (column) => ColumnOrderings(column));
}

class $$JournalLinesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $JournalLinesTable> {
  $$JournalLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get debit =>
      $composableBuilder(column: $table.debit, builder: (column) => column);

  GeneratedColumn<int> get credit =>
      $composableBuilder(column: $table.credit, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);
}

class $$JournalLinesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $JournalLinesTable,
    JournalLine,
    $$JournalLinesTableFilterComposer,
    $$JournalLinesTableOrderingComposer,
    $$JournalLinesTableAnnotationComposer,
    $$JournalLinesTableCreateCompanionBuilder,
    $$JournalLinesTableUpdateCompanionBuilder,
    (
      JournalLine,
      BaseReferences<_$BusinessDatabase, $JournalLinesTable, JournalLine>
    ),
    JournalLine,
    PrefetchHooks Function()> {
  $$JournalLinesTableTableManager(
      _$BusinessDatabase db, $JournalLinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> journalEntryId = const Value.absent(),
            Value<String> accountId = const Value.absent(),
            Value<int> debit = const Value.absent(),
            Value<int> credit = const Value.absent(),
            Value<String?> memo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalLinesCompanion(
            id: id,
            journalEntryId: journalEntryId,
            accountId: accountId,
            debit: debit,
            credit: credit,
            memo: memo,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String journalEntryId,
            required String accountId,
            Value<int> debit = const Value.absent(),
            Value<int> credit = const Value.absent(),
            Value<String?> memo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalLinesCompanion.insert(
            id: id,
            journalEntryId: journalEntryId,
            accountId: accountId,
            debit: debit,
            credit: credit,
            memo: memo,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JournalLinesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $JournalLinesTable,
    JournalLine,
    $$JournalLinesTableFilterComposer,
    $$JournalLinesTableOrderingComposer,
    $$JournalLinesTableAnnotationComposer,
    $$JournalLinesTableCreateCompanionBuilder,
    $$JournalLinesTableUpdateCompanionBuilder,
    (
      JournalLine,
      BaseReferences<_$BusinessDatabase, $JournalLinesTable, JournalLine>
    ),
    JournalLine,
    PrefetchHooks Function()>;
typedef $$BankAccountsTableCreateCompanionBuilder = BankAccountsCompanion
    Function({
  required String id,
  required String accountName,
  required String accountNumber,
  required String bankName,
  required int openingBalance,
  required int currentBalance,
  Value<int> rowid,
});
typedef $$BankAccountsTableUpdateCompanionBuilder = BankAccountsCompanion
    Function({
  Value<String> id,
  Value<String> accountName,
  Value<String> accountNumber,
  Value<String> bankName,
  Value<int> openingBalance,
  Value<int> currentBalance,
  Value<int> rowid,
});

class $$BankAccountsTableFilterComposer
    extends Composer<_$BusinessDatabase, $BankAccountsTable> {
  $$BankAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnFilters(column));
}

class $$BankAccountsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $BankAccountsTable> {
  $$BankAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnOrderings(column));
}

class $$BankAccountsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $BankAccountsTable> {
  $$BankAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => column);

  GeneratedColumn<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<int> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<int> get currentBalance => $composableBuilder(
      column: $table.currentBalance, builder: (column) => column);
}

class $$BankAccountsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $BankAccountsTable,
    BankAccount,
    $$BankAccountsTableFilterComposer,
    $$BankAccountsTableOrderingComposer,
    $$BankAccountsTableAnnotationComposer,
    $$BankAccountsTableCreateCompanionBuilder,
    $$BankAccountsTableUpdateCompanionBuilder,
    (
      BankAccount,
      BaseReferences<_$BusinessDatabase, $BankAccountsTable, BankAccount>
    ),
    BankAccount,
    PrefetchHooks Function()> {
  $$BankAccountsTableTableManager(
      _$BusinessDatabase db, $BankAccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> accountName = const Value.absent(),
            Value<String> accountNumber = const Value.absent(),
            Value<String> bankName = const Value.absent(),
            Value<int> openingBalance = const Value.absent(),
            Value<int> currentBalance = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BankAccountsCompanion(
            id: id,
            accountName: accountName,
            accountNumber: accountNumber,
            bankName: bankName,
            openingBalance: openingBalance,
            currentBalance: currentBalance,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String accountName,
            required String accountNumber,
            required String bankName,
            required int openingBalance,
            required int currentBalance,
            Value<int> rowid = const Value.absent(),
          }) =>
              BankAccountsCompanion.insert(
            id: id,
            accountName: accountName,
            accountNumber: accountNumber,
            bankName: bankName,
            openingBalance: openingBalance,
            currentBalance: currentBalance,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BankAccountsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $BankAccountsTable,
    BankAccount,
    $$BankAccountsTableFilterComposer,
    $$BankAccountsTableOrderingComposer,
    $$BankAccountsTableAnnotationComposer,
    $$BankAccountsTableCreateCompanionBuilder,
    $$BankAccountsTableUpdateCompanionBuilder,
    (
      BankAccount,
      BaseReferences<_$BusinessDatabase, $BankAccountsTable, BankAccount>
    ),
    BankAccount,
    PrefetchHooks Function()>;
typedef $$BankReconciliationsTableCreateCompanionBuilder
    = BankReconciliationsCompanion Function({
  required String id,
  required String bankAccountId,
  required DateTime statementDate,
  required int statementBalance,
  required int reconciledBalance,
  Value<String> status,
  Value<int> rowid,
});
typedef $$BankReconciliationsTableUpdateCompanionBuilder
    = BankReconciliationsCompanion Function({
  Value<String> id,
  Value<String> bankAccountId,
  Value<DateTime> statementDate,
  Value<int> statementBalance,
  Value<int> reconciledBalance,
  Value<String> status,
  Value<int> rowid,
});

class $$BankReconciliationsTableFilterComposer
    extends Composer<_$BusinessDatabase, $BankReconciliationsTable> {
  $$BankReconciliationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankAccountId => $composableBuilder(
      column: $table.bankAccountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get statementDate => $composableBuilder(
      column: $table.statementDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get statementBalance => $composableBuilder(
      column: $table.statementBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reconciledBalance => $composableBuilder(
      column: $table.reconciledBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$BankReconciliationsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $BankReconciliationsTable> {
  $$BankReconciliationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankAccountId => $composableBuilder(
      column: $table.bankAccountId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get statementDate => $composableBuilder(
      column: $table.statementDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get statementBalance => $composableBuilder(
      column: $table.statementBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reconciledBalance => $composableBuilder(
      column: $table.reconciledBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$BankReconciliationsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $BankReconciliationsTable> {
  $$BankReconciliationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankAccountId => $composableBuilder(
      column: $table.bankAccountId, builder: (column) => column);

  GeneratedColumn<DateTime> get statementDate => $composableBuilder(
      column: $table.statementDate, builder: (column) => column);

  GeneratedColumn<int> get statementBalance => $composableBuilder(
      column: $table.statementBalance, builder: (column) => column);

  GeneratedColumn<int> get reconciledBalance => $composableBuilder(
      column: $table.reconciledBalance, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$BankReconciliationsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $BankReconciliationsTable,
    BankReconciliation,
    $$BankReconciliationsTableFilterComposer,
    $$BankReconciliationsTableOrderingComposer,
    $$BankReconciliationsTableAnnotationComposer,
    $$BankReconciliationsTableCreateCompanionBuilder,
    $$BankReconciliationsTableUpdateCompanionBuilder,
    (
      BankReconciliation,
      BaseReferences<_$BusinessDatabase, $BankReconciliationsTable,
          BankReconciliation>
    ),
    BankReconciliation,
    PrefetchHooks Function()> {
  $$BankReconciliationsTableTableManager(
      _$BusinessDatabase db, $BankReconciliationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankReconciliationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankReconciliationsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankReconciliationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> bankAccountId = const Value.absent(),
            Value<DateTime> statementDate = const Value.absent(),
            Value<int> statementBalance = const Value.absent(),
            Value<int> reconciledBalance = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BankReconciliationsCompanion(
            id: id,
            bankAccountId: bankAccountId,
            statementDate: statementDate,
            statementBalance: statementBalance,
            reconciledBalance: reconciledBalance,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String bankAccountId,
            required DateTime statementDate,
            required int statementBalance,
            required int reconciledBalance,
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BankReconciliationsCompanion.insert(
            id: id,
            bankAccountId: bankAccountId,
            statementDate: statementDate,
            statementBalance: statementBalance,
            reconciledBalance: reconciledBalance,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BankReconciliationsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $BankReconciliationsTable,
    BankReconciliation,
    $$BankReconciliationsTableFilterComposer,
    $$BankReconciliationsTableOrderingComposer,
    $$BankReconciliationsTableAnnotationComposer,
    $$BankReconciliationsTableCreateCompanionBuilder,
    $$BankReconciliationsTableUpdateCompanionBuilder,
    (
      BankReconciliation,
      BaseReferences<_$BusinessDatabase, $BankReconciliationsTable,
          BankReconciliation>
    ),
    BankReconciliation,
    PrefetchHooks Function()>;
typedef $$InvoicesTableCreateCompanionBuilder = InvoicesCompanion Function({
  required String id,
  required String invoiceNo,
  required String customerName,
  required DateTime invoiceDate,
  required DateTime dueDate,
  required int subtotal,
  required int taxAmount,
  required int total,
  Value<String> status,
  Value<int> rowid,
});
typedef $$InvoicesTableUpdateCompanionBuilder = InvoicesCompanion Function({
  Value<String> id,
  Value<String> invoiceNo,
  Value<String> customerName,
  Value<DateTime> invoiceDate,
  Value<DateTime> dueDate,
  Value<int> subtotal,
  Value<int> taxAmount,
  Value<int> total,
  Value<String> status,
  Value<int> rowid,
});

class $$InvoicesTableFilterComposer
    extends Composer<_$BusinessDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceNo => $composableBuilder(
      column: $table.invoiceNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get invoiceDate => $composableBuilder(
      column: $table.invoiceDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taxAmount => $composableBuilder(
      column: $table.taxAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceNo => $composableBuilder(
      column: $table.invoiceNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get invoiceDate => $composableBuilder(
      column: $table.invoiceDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taxAmount => $composableBuilder(
      column: $table.taxAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNo =>
      $composableBuilder(column: $table.invoiceNo, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<DateTime> get invoiceDate => $composableBuilder(
      column: $table.invoiceDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get taxAmount =>
      $composableBuilder(column: $table.taxAmount, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$InvoicesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $InvoicesTable,
    Invoice,
    $$InvoicesTableFilterComposer,
    $$InvoicesTableOrderingComposer,
    $$InvoicesTableAnnotationComposer,
    $$InvoicesTableCreateCompanionBuilder,
    $$InvoicesTableUpdateCompanionBuilder,
    (Invoice, BaseReferences<_$BusinessDatabase, $InvoicesTable, Invoice>),
    Invoice,
    PrefetchHooks Function()> {
  $$InvoicesTableTableManager(_$BusinessDatabase db, $InvoicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> invoiceNo = const Value.absent(),
            Value<String> customerName = const Value.absent(),
            Value<DateTime> invoiceDate = const Value.absent(),
            Value<DateTime> dueDate = const Value.absent(),
            Value<int> subtotal = const Value.absent(),
            Value<int> taxAmount = const Value.absent(),
            Value<int> total = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InvoicesCompanion(
            id: id,
            invoiceNo: invoiceNo,
            customerName: customerName,
            invoiceDate: invoiceDate,
            dueDate: dueDate,
            subtotal: subtotal,
            taxAmount: taxAmount,
            total: total,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String invoiceNo,
            required String customerName,
            required DateTime invoiceDate,
            required DateTime dueDate,
            required int subtotal,
            required int taxAmount,
            required int total,
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InvoicesCompanion.insert(
            id: id,
            invoiceNo: invoiceNo,
            customerName: customerName,
            invoiceDate: invoiceDate,
            dueDate: dueDate,
            subtotal: subtotal,
            taxAmount: taxAmount,
            total: total,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InvoicesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $InvoicesTable,
    Invoice,
    $$InvoicesTableFilterComposer,
    $$InvoicesTableOrderingComposer,
    $$InvoicesTableAnnotationComposer,
    $$InvoicesTableCreateCompanionBuilder,
    $$InvoicesTableUpdateCompanionBuilder,
    (Invoice, BaseReferences<_$BusinessDatabase, $InvoicesTable, Invoice>),
    Invoice,
    PrefetchHooks Function()>;
typedef $$InvoiceLineItemsTableCreateCompanionBuilder
    = InvoiceLineItemsCompanion Function({
  required String id,
  required String invoiceId,
  required String description,
  required int quantity,
  required int unitPrice,
  Value<double> taxRate,
  required int lineTotal,
  Value<int> rowid,
});
typedef $$InvoiceLineItemsTableUpdateCompanionBuilder
    = InvoiceLineItemsCompanion Function({
  Value<String> id,
  Value<String> invoiceId,
  Value<String> description,
  Value<int> quantity,
  Value<int> unitPrice,
  Value<double> taxRate,
  Value<int> lineTotal,
  Value<int> rowid,
});

class $$InvoiceLineItemsTableFilterComposer
    extends Composer<_$BusinessDatabase, $InvoiceLineItemsTable> {
  $$InvoiceLineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceId => $composableBuilder(
      column: $table.invoiceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lineTotal => $composableBuilder(
      column: $table.lineTotal, builder: (column) => ColumnFilters(column));
}

class $$InvoiceLineItemsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $InvoiceLineItemsTable> {
  $$InvoiceLineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceId => $composableBuilder(
      column: $table.invoiceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lineTotal => $composableBuilder(
      column: $table.lineTotal, builder: (column) => ColumnOrderings(column));
}

class $$InvoiceLineItemsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $InvoiceLineItemsTable> {
  $$InvoiceLineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get taxRate =>
      $composableBuilder(column: $table.taxRate, builder: (column) => column);

  GeneratedColumn<int> get lineTotal =>
      $composableBuilder(column: $table.lineTotal, builder: (column) => column);
}

class $$InvoiceLineItemsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $InvoiceLineItemsTable,
    InvoiceLineItem,
    $$InvoiceLineItemsTableFilterComposer,
    $$InvoiceLineItemsTableOrderingComposer,
    $$InvoiceLineItemsTableAnnotationComposer,
    $$InvoiceLineItemsTableCreateCompanionBuilder,
    $$InvoiceLineItemsTableUpdateCompanionBuilder,
    (
      InvoiceLineItem,
      BaseReferences<_$BusinessDatabase, $InvoiceLineItemsTable,
          InvoiceLineItem>
    ),
    InvoiceLineItem,
    PrefetchHooks Function()> {
  $$InvoiceLineItemsTableTableManager(
      _$BusinessDatabase db, $InvoiceLineItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceLineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceLineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceLineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> invoiceId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> unitPrice = const Value.absent(),
            Value<double> taxRate = const Value.absent(),
            Value<int> lineTotal = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InvoiceLineItemsCompanion(
            id: id,
            invoiceId: invoiceId,
            description: description,
            quantity: quantity,
            unitPrice: unitPrice,
            taxRate: taxRate,
            lineTotal: lineTotal,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String invoiceId,
            required String description,
            required int quantity,
            required int unitPrice,
            Value<double> taxRate = const Value.absent(),
            required int lineTotal,
            Value<int> rowid = const Value.absent(),
          }) =>
              InvoiceLineItemsCompanion.insert(
            id: id,
            invoiceId: invoiceId,
            description: description,
            quantity: quantity,
            unitPrice: unitPrice,
            taxRate: taxRate,
            lineTotal: lineTotal,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InvoiceLineItemsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $InvoiceLineItemsTable,
    InvoiceLineItem,
    $$InvoiceLineItemsTableFilterComposer,
    $$InvoiceLineItemsTableOrderingComposer,
    $$InvoiceLineItemsTableAnnotationComposer,
    $$InvoiceLineItemsTableCreateCompanionBuilder,
    $$InvoiceLineItemsTableUpdateCompanionBuilder,
    (
      InvoiceLineItem,
      BaseReferences<_$BusinessDatabase, $InvoiceLineItemsTable,
          InvoiceLineItem>
    ),
    InvoiceLineItem,
    PrefetchHooks Function()>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  required String id,
  required DateTime txnDate,
  required String description,
  required String category,
  Value<String?> accountId,
  required int amount,
  required String direction,
  Value<String> status,
  required String sourceModule,
  Value<String?> sourceId,
  Value<int> rowid,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> id,
  Value<DateTime> txnDate,
  Value<String> description,
  Value<String> category,
  Value<String?> accountId,
  Value<int> amount,
  Value<String> direction,
  Value<String> status,
  Value<String> sourceModule,
  Value<String?> sourceId,
  Value<int> rowid,
});

class $$TransactionsTableFilterComposer
    extends Composer<_$BusinessDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get txnDate => $composableBuilder(
      column: $table.txnDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceModule => $composableBuilder(
      column: $table.sourceModule, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get txnDate => $composableBuilder(
      column: $table.txnDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceModule => $composableBuilder(
      column: $table.sourceModule,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get txnDate =>
      $composableBuilder(column: $table.txnDate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get sourceModule => $composableBuilder(
      column: $table.sourceModule, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      Transaction,
      BaseReferences<_$BusinessDatabase, $TransactionsTable, Transaction>
    ),
    Transaction,
    PrefetchHooks Function()> {
  $$TransactionsTableTableManager(
      _$BusinessDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> txnDate = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String?> accountId = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> sourceModule = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            txnDate: txnDate,
            description: description,
            category: category,
            accountId: accountId,
            amount: amount,
            direction: direction,
            status: status,
            sourceModule: sourceModule,
            sourceId: sourceId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime txnDate,
            required String description,
            required String category,
            Value<String?> accountId = const Value.absent(),
            required int amount,
            required String direction,
            Value<String> status = const Value.absent(),
            required String sourceModule,
            Value<String?> sourceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            txnDate: txnDate,
            description: description,
            category: category,
            accountId: accountId,
            amount: amount,
            direction: direction,
            status: status,
            sourceModule: sourceModule,
            sourceId: sourceId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      Transaction,
      BaseReferences<_$BusinessDatabase, $TransactionsTable, Transaction>
    ),
    Transaction,
    PrefetchHooks Function()>;
typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({
  required String id,
  required String category,
  required String fiscalYear,
  required int periodMonth,
  required int budgetedAmount,
  Value<int> actualAmount,
  Value<int> rowid,
});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<String> id,
  Value<String> category,
  Value<String> fiscalYear,
  Value<int> periodMonth,
  Value<int> budgetedAmount,
  Value<int> actualAmount,
  Value<int> rowid,
});

class $$BudgetsTableFilterComposer
    extends Composer<_$BusinessDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get budgetedAmount => $composableBuilder(
      column: $table.budgetedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get actualAmount => $composableBuilder(
      column: $table.actualAmount, builder: (column) => ColumnFilters(column));
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get budgetedAmount => $composableBuilder(
      column: $table.budgetedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get actualAmount => $composableBuilder(
      column: $table.actualAmount,
      builder: (column) => ColumnOrderings(column));
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => column);

  GeneratedColumn<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => column);

  GeneratedColumn<int> get budgetedAmount => $composableBuilder(
      column: $table.budgetedAmount, builder: (column) => column);

  GeneratedColumn<int> get actualAmount => $composableBuilder(
      column: $table.actualAmount, builder: (column) => column);
}

class $$BudgetsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, BaseReferences<_$BusinessDatabase, $BudgetsTable, Budget>),
    Budget,
    PrefetchHooks Function()> {
  $$BudgetsTableTableManager(_$BusinessDatabase db, $BudgetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> fiscalYear = const Value.absent(),
            Value<int> periodMonth = const Value.absent(),
            Value<int> budgetedAmount = const Value.absent(),
            Value<int> actualAmount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsCompanion(
            id: id,
            category: category,
            fiscalYear: fiscalYear,
            periodMonth: periodMonth,
            budgetedAmount: budgetedAmount,
            actualAmount: actualAmount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String category,
            required String fiscalYear,
            required int periodMonth,
            required int budgetedAmount,
            Value<int> actualAmount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsCompanion.insert(
            id: id,
            category: category,
            fiscalYear: fiscalYear,
            periodMonth: periodMonth,
            budgetedAmount: budgetedAmount,
            actualAmount: actualAmount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BudgetsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, BaseReferences<_$BusinessDatabase, $BudgetsTable, Budget>),
    Budget,
    PrefetchHooks Function()>;
typedef $$EmployeesTableCreateCompanionBuilder = EmployeesCompanion Function({
  required String id,
  required String employeeCode,
  required String fullName,
  required String department,
  required String roleTitle,
  required int basicSalary,
  required String employmentStatus,
  required DateTime joinedDate,
  Value<String?> contactPhone,
  Value<String?> contactEmail,
  Value<int> rowid,
});
typedef $$EmployeesTableUpdateCompanionBuilder = EmployeesCompanion Function({
  Value<String> id,
  Value<String> employeeCode,
  Value<String> fullName,
  Value<String> department,
  Value<String> roleTitle,
  Value<int> basicSalary,
  Value<String> employmentStatus,
  Value<DateTime> joinedDate,
  Value<String?> contactPhone,
  Value<String?> contactEmail,
  Value<int> rowid,
});

class $$EmployeesTableFilterComposer
    extends Composer<_$BusinessDatabase, $EmployeesTable> {
  $$EmployeesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeCode => $composableBuilder(
      column: $table.employeeCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roleTitle => $composableBuilder(
      column: $table.roleTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get basicSalary => $composableBuilder(
      column: $table.basicSalary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employmentStatus => $composableBuilder(
      column: $table.employmentStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get joinedDate => $composableBuilder(
      column: $table.joinedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactPhone => $composableBuilder(
      column: $table.contactPhone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactEmail => $composableBuilder(
      column: $table.contactEmail, builder: (column) => ColumnFilters(column));
}

class $$EmployeesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $EmployeesTable> {
  $$EmployeesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeCode => $composableBuilder(
      column: $table.employeeCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roleTitle => $composableBuilder(
      column: $table.roleTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get basicSalary => $composableBuilder(
      column: $table.basicSalary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employmentStatus => $composableBuilder(
      column: $table.employmentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get joinedDate => $composableBuilder(
      column: $table.joinedDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactPhone => $composableBuilder(
      column: $table.contactPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactEmail => $composableBuilder(
      column: $table.contactEmail,
      builder: (column) => ColumnOrderings(column));
}

class $$EmployeesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $EmployeesTable> {
  $$EmployeesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get employeeCode => $composableBuilder(
      column: $table.employeeCode, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => column);

  GeneratedColumn<String> get roleTitle =>
      $composableBuilder(column: $table.roleTitle, builder: (column) => column);

  GeneratedColumn<int> get basicSalary => $composableBuilder(
      column: $table.basicSalary, builder: (column) => column);

  GeneratedColumn<String> get employmentStatus => $composableBuilder(
      column: $table.employmentStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get joinedDate => $composableBuilder(
      column: $table.joinedDate, builder: (column) => column);

  GeneratedColumn<String> get contactPhone => $composableBuilder(
      column: $table.contactPhone, builder: (column) => column);

  GeneratedColumn<String> get contactEmail => $composableBuilder(
      column: $table.contactEmail, builder: (column) => column);
}

class $$EmployeesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $EmployeesTable,
    Employee,
    $$EmployeesTableFilterComposer,
    $$EmployeesTableOrderingComposer,
    $$EmployeesTableAnnotationComposer,
    $$EmployeesTableCreateCompanionBuilder,
    $$EmployeesTableUpdateCompanionBuilder,
    (Employee, BaseReferences<_$BusinessDatabase, $EmployeesTable, Employee>),
    Employee,
    PrefetchHooks Function()> {
  $$EmployeesTableTableManager(_$BusinessDatabase db, $EmployeesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> employeeCode = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> department = const Value.absent(),
            Value<String> roleTitle = const Value.absent(),
            Value<int> basicSalary = const Value.absent(),
            Value<String> employmentStatus = const Value.absent(),
            Value<DateTime> joinedDate = const Value.absent(),
            Value<String?> contactPhone = const Value.absent(),
            Value<String?> contactEmail = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EmployeesCompanion(
            id: id,
            employeeCode: employeeCode,
            fullName: fullName,
            department: department,
            roleTitle: roleTitle,
            basicSalary: basicSalary,
            employmentStatus: employmentStatus,
            joinedDate: joinedDate,
            contactPhone: contactPhone,
            contactEmail: contactEmail,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String employeeCode,
            required String fullName,
            required String department,
            required String roleTitle,
            required int basicSalary,
            required String employmentStatus,
            required DateTime joinedDate,
            Value<String?> contactPhone = const Value.absent(),
            Value<String?> contactEmail = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EmployeesCompanion.insert(
            id: id,
            employeeCode: employeeCode,
            fullName: fullName,
            department: department,
            roleTitle: roleTitle,
            basicSalary: basicSalary,
            employmentStatus: employmentStatus,
            joinedDate: joinedDate,
            contactPhone: contactPhone,
            contactEmail: contactEmail,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EmployeesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $EmployeesTable,
    Employee,
    $$EmployeesTableFilterComposer,
    $$EmployeesTableOrderingComposer,
    $$EmployeesTableAnnotationComposer,
    $$EmployeesTableCreateCompanionBuilder,
    $$EmployeesTableUpdateCompanionBuilder,
    (Employee, BaseReferences<_$BusinessDatabase, $EmployeesTable, Employee>),
    Employee,
    PrefetchHooks Function()>;
typedef $$AttendanceTableCreateCompanionBuilder = AttendanceCompanion Function({
  required String id,
  required String employeeId,
  required DateTime date,
  required String status,
  Value<DateTime?> checkInTime,
  Value<DateTime?> checkOutTime,
  Value<int> lateMinutes,
  Value<int> rowid,
});
typedef $$AttendanceTableUpdateCompanionBuilder = AttendanceCompanion Function({
  Value<String> id,
  Value<String> employeeId,
  Value<DateTime> date,
  Value<String> status,
  Value<DateTime?> checkInTime,
  Value<DateTime?> checkOutTime,
  Value<int> lateMinutes,
  Value<int> rowid,
});

class $$AttendanceTableFilterComposer
    extends Composer<_$BusinessDatabase, $AttendanceTable> {
  $$AttendanceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get checkInTime => $composableBuilder(
      column: $table.checkInTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get checkOutTime => $composableBuilder(
      column: $table.checkOutTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lateMinutes => $composableBuilder(
      column: $table.lateMinutes, builder: (column) => ColumnFilters(column));
}

class $$AttendanceTableOrderingComposer
    extends Composer<_$BusinessDatabase, $AttendanceTable> {
  $$AttendanceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get checkInTime => $composableBuilder(
      column: $table.checkInTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get checkOutTime => $composableBuilder(
      column: $table.checkOutTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lateMinutes => $composableBuilder(
      column: $table.lateMinutes, builder: (column) => ColumnOrderings(column));
}

class $$AttendanceTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $AttendanceTable> {
  $$AttendanceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get checkInTime => $composableBuilder(
      column: $table.checkInTime, builder: (column) => column);

  GeneratedColumn<DateTime> get checkOutTime => $composableBuilder(
      column: $table.checkOutTime, builder: (column) => column);

  GeneratedColumn<int> get lateMinutes => $composableBuilder(
      column: $table.lateMinutes, builder: (column) => column);
}

class $$AttendanceTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $AttendanceTable,
    AttendanceData,
    $$AttendanceTableFilterComposer,
    $$AttendanceTableOrderingComposer,
    $$AttendanceTableAnnotationComposer,
    $$AttendanceTableCreateCompanionBuilder,
    $$AttendanceTableUpdateCompanionBuilder,
    (
      AttendanceData,
      BaseReferences<_$BusinessDatabase, $AttendanceTable, AttendanceData>
    ),
    AttendanceData,
    PrefetchHooks Function()> {
  $$AttendanceTableTableManager(_$BusinessDatabase db, $AttendanceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> employeeId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> checkInTime = const Value.absent(),
            Value<DateTime?> checkOutTime = const Value.absent(),
            Value<int> lateMinutes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttendanceCompanion(
            id: id,
            employeeId: employeeId,
            date: date,
            status: status,
            checkInTime: checkInTime,
            checkOutTime: checkOutTime,
            lateMinutes: lateMinutes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String employeeId,
            required DateTime date,
            required String status,
            Value<DateTime?> checkInTime = const Value.absent(),
            Value<DateTime?> checkOutTime = const Value.absent(),
            Value<int> lateMinutes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttendanceCompanion.insert(
            id: id,
            employeeId: employeeId,
            date: date,
            status: status,
            checkInTime: checkInTime,
            checkOutTime: checkOutTime,
            lateMinutes: lateMinutes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AttendanceTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $AttendanceTable,
    AttendanceData,
    $$AttendanceTableFilterComposer,
    $$AttendanceTableOrderingComposer,
    $$AttendanceTableAnnotationComposer,
    $$AttendanceTableCreateCompanionBuilder,
    $$AttendanceTableUpdateCompanionBuilder,
    (
      AttendanceData,
      BaseReferences<_$BusinessDatabase, $AttendanceTable, AttendanceData>
    ),
    AttendanceData,
    PrefetchHooks Function()>;
typedef $$LeaveRequestsTableCreateCompanionBuilder = LeaveRequestsCompanion
    Function({
  required String id,
  required String employeeId,
  required String leaveType,
  required DateTime fromDate,
  required DateTime toDate,
  required int days,
  Value<String> status,
  Value<String?> reason,
  Value<int> rowid,
});
typedef $$LeaveRequestsTableUpdateCompanionBuilder = LeaveRequestsCompanion
    Function({
  Value<String> id,
  Value<String> employeeId,
  Value<String> leaveType,
  Value<DateTime> fromDate,
  Value<DateTime> toDate,
  Value<int> days,
  Value<String> status,
  Value<String?> reason,
  Value<int> rowid,
});

class $$LeaveRequestsTableFilterComposer
    extends Composer<_$BusinessDatabase, $LeaveRequestsTable> {
  $$LeaveRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leaveType => $composableBuilder(
      column: $table.leaveType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fromDate => $composableBuilder(
      column: $table.fromDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get toDate => $composableBuilder(
      column: $table.toDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get days => $composableBuilder(
      column: $table.days, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));
}

class $$LeaveRequestsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $LeaveRequestsTable> {
  $$LeaveRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leaveType => $composableBuilder(
      column: $table.leaveType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fromDate => $composableBuilder(
      column: $table.fromDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get toDate => $composableBuilder(
      column: $table.toDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get days => $composableBuilder(
      column: $table.days, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));
}

class $$LeaveRequestsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $LeaveRequestsTable> {
  $$LeaveRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => column);

  GeneratedColumn<String> get leaveType =>
      $composableBuilder(column: $table.leaveType, builder: (column) => column);

  GeneratedColumn<DateTime> get fromDate =>
      $composableBuilder(column: $table.fromDate, builder: (column) => column);

  GeneratedColumn<DateTime> get toDate =>
      $composableBuilder(column: $table.toDate, builder: (column) => column);

  GeneratedColumn<int> get days =>
      $composableBuilder(column: $table.days, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);
}

class $$LeaveRequestsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $LeaveRequestsTable,
    LeaveRequest,
    $$LeaveRequestsTableFilterComposer,
    $$LeaveRequestsTableOrderingComposer,
    $$LeaveRequestsTableAnnotationComposer,
    $$LeaveRequestsTableCreateCompanionBuilder,
    $$LeaveRequestsTableUpdateCompanionBuilder,
    (
      LeaveRequest,
      BaseReferences<_$BusinessDatabase, $LeaveRequestsTable, LeaveRequest>
    ),
    LeaveRequest,
    PrefetchHooks Function()> {
  $$LeaveRequestsTableTableManager(
      _$BusinessDatabase db, $LeaveRequestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LeaveRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LeaveRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LeaveRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> employeeId = const Value.absent(),
            Value<String> leaveType = const Value.absent(),
            Value<DateTime> fromDate = const Value.absent(),
            Value<DateTime> toDate = const Value.absent(),
            Value<int> days = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LeaveRequestsCompanion(
            id: id,
            employeeId: employeeId,
            leaveType: leaveType,
            fromDate: fromDate,
            toDate: toDate,
            days: days,
            status: status,
            reason: reason,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String employeeId,
            required String leaveType,
            required DateTime fromDate,
            required DateTime toDate,
            required int days,
            Value<String> status = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LeaveRequestsCompanion.insert(
            id: id,
            employeeId: employeeId,
            leaveType: leaveType,
            fromDate: fromDate,
            toDate: toDate,
            days: days,
            status: status,
            reason: reason,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LeaveRequestsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $LeaveRequestsTable,
    LeaveRequest,
    $$LeaveRequestsTableFilterComposer,
    $$LeaveRequestsTableOrderingComposer,
    $$LeaveRequestsTableAnnotationComposer,
    $$LeaveRequestsTableCreateCompanionBuilder,
    $$LeaveRequestsTableUpdateCompanionBuilder,
    (
      LeaveRequest,
      BaseReferences<_$BusinessDatabase, $LeaveRequestsTable, LeaveRequest>
    ),
    LeaveRequest,
    PrefetchHooks Function()>;
typedef $$LeaveBalancesTableCreateCompanionBuilder = LeaveBalancesCompanion
    Function({
  required String id,
  required String employeeId,
  required String leaveType,
  required String fiscalYear,
  required int balanceDays,
  Value<int> rowid,
});
typedef $$LeaveBalancesTableUpdateCompanionBuilder = LeaveBalancesCompanion
    Function({
  Value<String> id,
  Value<String> employeeId,
  Value<String> leaveType,
  Value<String> fiscalYear,
  Value<int> balanceDays,
  Value<int> rowid,
});

class $$LeaveBalancesTableFilterComposer
    extends Composer<_$BusinessDatabase, $LeaveBalancesTable> {
  $$LeaveBalancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leaveType => $composableBuilder(
      column: $table.leaveType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get balanceDays => $composableBuilder(
      column: $table.balanceDays, builder: (column) => ColumnFilters(column));
}

class $$LeaveBalancesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $LeaveBalancesTable> {
  $$LeaveBalancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leaveType => $composableBuilder(
      column: $table.leaveType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get balanceDays => $composableBuilder(
      column: $table.balanceDays, builder: (column) => ColumnOrderings(column));
}

class $$LeaveBalancesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $LeaveBalancesTable> {
  $$LeaveBalancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => column);

  GeneratedColumn<String> get leaveType =>
      $composableBuilder(column: $table.leaveType, builder: (column) => column);

  GeneratedColumn<String> get fiscalYear => $composableBuilder(
      column: $table.fiscalYear, builder: (column) => column);

  GeneratedColumn<int> get balanceDays => $composableBuilder(
      column: $table.balanceDays, builder: (column) => column);
}

class $$LeaveBalancesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $LeaveBalancesTable,
    LeaveBalance,
    $$LeaveBalancesTableFilterComposer,
    $$LeaveBalancesTableOrderingComposer,
    $$LeaveBalancesTableAnnotationComposer,
    $$LeaveBalancesTableCreateCompanionBuilder,
    $$LeaveBalancesTableUpdateCompanionBuilder,
    (
      LeaveBalance,
      BaseReferences<_$BusinessDatabase, $LeaveBalancesTable, LeaveBalance>
    ),
    LeaveBalance,
    PrefetchHooks Function()> {
  $$LeaveBalancesTableTableManager(
      _$BusinessDatabase db, $LeaveBalancesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LeaveBalancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LeaveBalancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LeaveBalancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> employeeId = const Value.absent(),
            Value<String> leaveType = const Value.absent(),
            Value<String> fiscalYear = const Value.absent(),
            Value<int> balanceDays = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LeaveBalancesCompanion(
            id: id,
            employeeId: employeeId,
            leaveType: leaveType,
            fiscalYear: fiscalYear,
            balanceDays: balanceDays,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String employeeId,
            required String leaveType,
            required String fiscalYear,
            required int balanceDays,
            Value<int> rowid = const Value.absent(),
          }) =>
              LeaveBalancesCompanion.insert(
            id: id,
            employeeId: employeeId,
            leaveType: leaveType,
            fiscalYear: fiscalYear,
            balanceDays: balanceDays,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LeaveBalancesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $LeaveBalancesTable,
    LeaveBalance,
    $$LeaveBalancesTableFilterComposer,
    $$LeaveBalancesTableOrderingComposer,
    $$LeaveBalancesTableAnnotationComposer,
    $$LeaveBalancesTableCreateCompanionBuilder,
    $$LeaveBalancesTableUpdateCompanionBuilder,
    (
      LeaveBalance,
      BaseReferences<_$BusinessDatabase, $LeaveBalancesTable, LeaveBalance>
    ),
    LeaveBalance,
    PrefetchHooks Function()>;
typedef $$PayrollRunsTableCreateCompanionBuilder = PayrollRunsCompanion
    Function({
  required String id,
  required int periodMonth,
  required int periodYear,
  Value<String> status,
  required int grossPayroll,
  required int allowances,
  required int overtime,
  required int deductions,
  required int netPay,
  required DateTime generatedAt,
  Value<int> rowid,
});
typedef $$PayrollRunsTableUpdateCompanionBuilder = PayrollRunsCompanion
    Function({
  Value<String> id,
  Value<int> periodMonth,
  Value<int> periodYear,
  Value<String> status,
  Value<int> grossPayroll,
  Value<int> allowances,
  Value<int> overtime,
  Value<int> deductions,
  Value<int> netPay,
  Value<DateTime> generatedAt,
  Value<int> rowid,
});

class $$PayrollRunsTableFilterComposer
    extends Composer<_$BusinessDatabase, $PayrollRunsTable> {
  $$PayrollRunsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodYear => $composableBuilder(
      column: $table.periodYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get grossPayroll => $composableBuilder(
      column: $table.grossPayroll, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get allowances => $composableBuilder(
      column: $table.allowances, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get overtime => $composableBuilder(
      column: $table.overtime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get netPay => $composableBuilder(
      column: $table.netPay, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));
}

class $$PayrollRunsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $PayrollRunsTable> {
  $$PayrollRunsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodYear => $composableBuilder(
      column: $table.periodYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get grossPayroll => $composableBuilder(
      column: $table.grossPayroll,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get allowances => $composableBuilder(
      column: $table.allowances, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get overtime => $composableBuilder(
      column: $table.overtime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get netPay => $composableBuilder(
      column: $table.netPay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PayrollRunsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $PayrollRunsTable> {
  $$PayrollRunsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => column);

  GeneratedColumn<int> get periodYear => $composableBuilder(
      column: $table.periodYear, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get grossPayroll => $composableBuilder(
      column: $table.grossPayroll, builder: (column) => column);

  GeneratedColumn<int> get allowances => $composableBuilder(
      column: $table.allowances, builder: (column) => column);

  GeneratedColumn<int> get overtime =>
      $composableBuilder(column: $table.overtime, builder: (column) => column);

  GeneratedColumn<int> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => column);

  GeneratedColumn<int> get netPay =>
      $composableBuilder(column: $table.netPay, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);
}

class $$PayrollRunsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $PayrollRunsTable,
    PayrollRun,
    $$PayrollRunsTableFilterComposer,
    $$PayrollRunsTableOrderingComposer,
    $$PayrollRunsTableAnnotationComposer,
    $$PayrollRunsTableCreateCompanionBuilder,
    $$PayrollRunsTableUpdateCompanionBuilder,
    (
      PayrollRun,
      BaseReferences<_$BusinessDatabase, $PayrollRunsTable, PayrollRun>
    ),
    PayrollRun,
    PrefetchHooks Function()> {
  $$PayrollRunsTableTableManager(_$BusinessDatabase db, $PayrollRunsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PayrollRunsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PayrollRunsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PayrollRunsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> periodMonth = const Value.absent(),
            Value<int> periodYear = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> grossPayroll = const Value.absent(),
            Value<int> allowances = const Value.absent(),
            Value<int> overtime = const Value.absent(),
            Value<int> deductions = const Value.absent(),
            Value<int> netPay = const Value.absent(),
            Value<DateTime> generatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PayrollRunsCompanion(
            id: id,
            periodMonth: periodMonth,
            periodYear: periodYear,
            status: status,
            grossPayroll: grossPayroll,
            allowances: allowances,
            overtime: overtime,
            deductions: deductions,
            netPay: netPay,
            generatedAt: generatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int periodMonth,
            required int periodYear,
            Value<String> status = const Value.absent(),
            required int grossPayroll,
            required int allowances,
            required int overtime,
            required int deductions,
            required int netPay,
            required DateTime generatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PayrollRunsCompanion.insert(
            id: id,
            periodMonth: periodMonth,
            periodYear: periodYear,
            status: status,
            grossPayroll: grossPayroll,
            allowances: allowances,
            overtime: overtime,
            deductions: deductions,
            netPay: netPay,
            generatedAt: generatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PayrollRunsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $PayrollRunsTable,
    PayrollRun,
    $$PayrollRunsTableFilterComposer,
    $$PayrollRunsTableOrderingComposer,
    $$PayrollRunsTableAnnotationComposer,
    $$PayrollRunsTableCreateCompanionBuilder,
    $$PayrollRunsTableUpdateCompanionBuilder,
    (
      PayrollRun,
      BaseReferences<_$BusinessDatabase, $PayrollRunsTable, PayrollRun>
    ),
    PayrollRun,
    PrefetchHooks Function()>;
typedef $$PayrollItemsTableCreateCompanionBuilder = PayrollItemsCompanion
    Function({
  required String id,
  required String payrollRunId,
  required String employeeId,
  required int basicSalary,
  required int allowances,
  required int overtime,
  required int deductions,
  required int netPay,
  Value<int> rowid,
});
typedef $$PayrollItemsTableUpdateCompanionBuilder = PayrollItemsCompanion
    Function({
  Value<String> id,
  Value<String> payrollRunId,
  Value<String> employeeId,
  Value<int> basicSalary,
  Value<int> allowances,
  Value<int> overtime,
  Value<int> deductions,
  Value<int> netPay,
  Value<int> rowid,
});

class $$PayrollItemsTableFilterComposer
    extends Composer<_$BusinessDatabase, $PayrollItemsTable> {
  $$PayrollItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payrollRunId => $composableBuilder(
      column: $table.payrollRunId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get basicSalary => $composableBuilder(
      column: $table.basicSalary, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get allowances => $composableBuilder(
      column: $table.allowances, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get overtime => $composableBuilder(
      column: $table.overtime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get netPay => $composableBuilder(
      column: $table.netPay, builder: (column) => ColumnFilters(column));
}

class $$PayrollItemsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $PayrollItemsTable> {
  $$PayrollItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payrollRunId => $composableBuilder(
      column: $table.payrollRunId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get basicSalary => $composableBuilder(
      column: $table.basicSalary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get allowances => $composableBuilder(
      column: $table.allowances, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get overtime => $composableBuilder(
      column: $table.overtime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get netPay => $composableBuilder(
      column: $table.netPay, builder: (column) => ColumnOrderings(column));
}

class $$PayrollItemsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $PayrollItemsTable> {
  $$PayrollItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get payrollRunId => $composableBuilder(
      column: $table.payrollRunId, builder: (column) => column);

  GeneratedColumn<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => column);

  GeneratedColumn<int> get basicSalary => $composableBuilder(
      column: $table.basicSalary, builder: (column) => column);

  GeneratedColumn<int> get allowances => $composableBuilder(
      column: $table.allowances, builder: (column) => column);

  GeneratedColumn<int> get overtime =>
      $composableBuilder(column: $table.overtime, builder: (column) => column);

  GeneratedColumn<int> get deductions => $composableBuilder(
      column: $table.deductions, builder: (column) => column);

  GeneratedColumn<int> get netPay =>
      $composableBuilder(column: $table.netPay, builder: (column) => column);
}

class $$PayrollItemsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $PayrollItemsTable,
    PayrollItem,
    $$PayrollItemsTableFilterComposer,
    $$PayrollItemsTableOrderingComposer,
    $$PayrollItemsTableAnnotationComposer,
    $$PayrollItemsTableCreateCompanionBuilder,
    $$PayrollItemsTableUpdateCompanionBuilder,
    (
      PayrollItem,
      BaseReferences<_$BusinessDatabase, $PayrollItemsTable, PayrollItem>
    ),
    PayrollItem,
    PrefetchHooks Function()> {
  $$PayrollItemsTableTableManager(
      _$BusinessDatabase db, $PayrollItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PayrollItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PayrollItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PayrollItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> payrollRunId = const Value.absent(),
            Value<String> employeeId = const Value.absent(),
            Value<int> basicSalary = const Value.absent(),
            Value<int> allowances = const Value.absent(),
            Value<int> overtime = const Value.absent(),
            Value<int> deductions = const Value.absent(),
            Value<int> netPay = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PayrollItemsCompanion(
            id: id,
            payrollRunId: payrollRunId,
            employeeId: employeeId,
            basicSalary: basicSalary,
            allowances: allowances,
            overtime: overtime,
            deductions: deductions,
            netPay: netPay,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String payrollRunId,
            required String employeeId,
            required int basicSalary,
            required int allowances,
            required int overtime,
            required int deductions,
            required int netPay,
            Value<int> rowid = const Value.absent(),
          }) =>
              PayrollItemsCompanion.insert(
            id: id,
            payrollRunId: payrollRunId,
            employeeId: employeeId,
            basicSalary: basicSalary,
            allowances: allowances,
            overtime: overtime,
            deductions: deductions,
            netPay: netPay,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PayrollItemsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $PayrollItemsTable,
    PayrollItem,
    $$PayrollItemsTableFilterComposer,
    $$PayrollItemsTableOrderingComposer,
    $$PayrollItemsTableAnnotationComposer,
    $$PayrollItemsTableCreateCompanionBuilder,
    $$PayrollItemsTableUpdateCompanionBuilder,
    (
      PayrollItem,
      BaseReferences<_$BusinessDatabase, $PayrollItemsTable, PayrollItem>
    ),
    PayrollItem,
    PrefetchHooks Function()>;
typedef $$EmploymentContractsTableCreateCompanionBuilder
    = EmploymentContractsCompanion Function({
  required String id,
  required String employeeId,
  required String position,
  required String contractType,
  required DateTime startDate,
  Value<DateTime?> expiryDate,
  required String status,
  Value<int> rowid,
});
typedef $$EmploymentContractsTableUpdateCompanionBuilder
    = EmploymentContractsCompanion Function({
  Value<String> id,
  Value<String> employeeId,
  Value<String> position,
  Value<String> contractType,
  Value<DateTime> startDate,
  Value<DateTime?> expiryDate,
  Value<String> status,
  Value<int> rowid,
});

class $$EmploymentContractsTableFilterComposer
    extends Composer<_$BusinessDatabase, $EmploymentContractsTable> {
  $$EmploymentContractsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contractType => $composableBuilder(
      column: $table.contractType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$EmploymentContractsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $EmploymentContractsTable> {
  $$EmploymentContractsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contractType => $composableBuilder(
      column: $table.contractType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$EmploymentContractsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $EmploymentContractsTable> {
  $$EmploymentContractsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get contractType => $composableBuilder(
      column: $table.contractType, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$EmploymentContractsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $EmploymentContractsTable,
    EmploymentContract,
    $$EmploymentContractsTableFilterComposer,
    $$EmploymentContractsTableOrderingComposer,
    $$EmploymentContractsTableAnnotationComposer,
    $$EmploymentContractsTableCreateCompanionBuilder,
    $$EmploymentContractsTableUpdateCompanionBuilder,
    (
      EmploymentContract,
      BaseReferences<_$BusinessDatabase, $EmploymentContractsTable,
          EmploymentContract>
    ),
    EmploymentContract,
    PrefetchHooks Function()> {
  $$EmploymentContractsTableTableManager(
      _$BusinessDatabase db, $EmploymentContractsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmploymentContractsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmploymentContractsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmploymentContractsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> employeeId = const Value.absent(),
            Value<String> position = const Value.absent(),
            Value<String> contractType = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> expiryDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EmploymentContractsCompanion(
            id: id,
            employeeId: employeeId,
            position: position,
            contractType: contractType,
            startDate: startDate,
            expiryDate: expiryDate,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String employeeId,
            required String position,
            required String contractType,
            required DateTime startDate,
            Value<DateTime?> expiryDate = const Value.absent(),
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              EmploymentContractsCompanion.insert(
            id: id,
            employeeId: employeeId,
            position: position,
            contractType: contractType,
            startDate: startDate,
            expiryDate: expiryDate,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EmploymentContractsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $EmploymentContractsTable,
    EmploymentContract,
    $$EmploymentContractsTableFilterComposer,
    $$EmploymentContractsTableOrderingComposer,
    $$EmploymentContractsTableAnnotationComposer,
    $$EmploymentContractsTableCreateCompanionBuilder,
    $$EmploymentContractsTableUpdateCompanionBuilder,
    (
      EmploymentContract,
      BaseReferences<_$BusinessDatabase, $EmploymentContractsTable,
          EmploymentContract>
    ),
    EmploymentContract,
    PrefetchHooks Function()>;
typedef $$AssetsTableCreateCompanionBuilder = AssetsCompanion Function({
  required String id,
  required String assetCode,
  required String name,
  required String category,
  required DateTime purchaseDate,
  required int purchaseCost,
  required String depreciationMethod,
  required int usefulLifeYears,
  Value<int> salvageValue,
  Value<String> status,
  Value<int> rowid,
});
typedef $$AssetsTableUpdateCompanionBuilder = AssetsCompanion Function({
  Value<String> id,
  Value<String> assetCode,
  Value<String> name,
  Value<String> category,
  Value<DateTime> purchaseDate,
  Value<int> purchaseCost,
  Value<String> depreciationMethod,
  Value<int> usefulLifeYears,
  Value<int> salvageValue,
  Value<String> status,
  Value<int> rowid,
});

class $$AssetsTableFilterComposer
    extends Composer<_$BusinessDatabase, $AssetsTable> {
  $$AssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetCode => $composableBuilder(
      column: $table.assetCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get depreciationMethod => $composableBuilder(
      column: $table.depreciationMethod,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usefulLifeYears => $composableBuilder(
      column: $table.usefulLifeYears,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get salvageValue => $composableBuilder(
      column: $table.salvageValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$AssetsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $AssetsTable> {
  $$AssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetCode => $composableBuilder(
      column: $table.assetCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get depreciationMethod => $composableBuilder(
      column: $table.depreciationMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usefulLifeYears => $composableBuilder(
      column: $table.usefulLifeYears,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get salvageValue => $composableBuilder(
      column: $table.salvageValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$AssetsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $AssetsTable> {
  $$AssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assetCode =>
      $composableBuilder(column: $table.assetCode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<int> get purchaseCost => $composableBuilder(
      column: $table.purchaseCost, builder: (column) => column);

  GeneratedColumn<String> get depreciationMethod => $composableBuilder(
      column: $table.depreciationMethod, builder: (column) => column);

  GeneratedColumn<int> get usefulLifeYears => $composableBuilder(
      column: $table.usefulLifeYears, builder: (column) => column);

  GeneratedColumn<int> get salvageValue => $composableBuilder(
      column: $table.salvageValue, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$AssetsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $AssetsTable,
    Asset,
    $$AssetsTableFilterComposer,
    $$AssetsTableOrderingComposer,
    $$AssetsTableAnnotationComposer,
    $$AssetsTableCreateCompanionBuilder,
    $$AssetsTableUpdateCompanionBuilder,
    (Asset, BaseReferences<_$BusinessDatabase, $AssetsTable, Asset>),
    Asset,
    PrefetchHooks Function()> {
  $$AssetsTableTableManager(_$BusinessDatabase db, $AssetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assetCode = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<int> purchaseCost = const Value.absent(),
            Value<String> depreciationMethod = const Value.absent(),
            Value<int> usefulLifeYears = const Value.absent(),
            Value<int> salvageValue = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetsCompanion(
            id: id,
            assetCode: assetCode,
            name: name,
            category: category,
            purchaseDate: purchaseDate,
            purchaseCost: purchaseCost,
            depreciationMethod: depreciationMethod,
            usefulLifeYears: usefulLifeYears,
            salvageValue: salvageValue,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assetCode,
            required String name,
            required String category,
            required DateTime purchaseDate,
            required int purchaseCost,
            required String depreciationMethod,
            required int usefulLifeYears,
            Value<int> salvageValue = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetsCompanion.insert(
            id: id,
            assetCode: assetCode,
            name: name,
            category: category,
            purchaseDate: purchaseDate,
            purchaseCost: purchaseCost,
            depreciationMethod: depreciationMethod,
            usefulLifeYears: usefulLifeYears,
            salvageValue: salvageValue,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $AssetsTable,
    Asset,
    $$AssetsTableFilterComposer,
    $$AssetsTableOrderingComposer,
    $$AssetsTableAnnotationComposer,
    $$AssetsTableCreateCompanionBuilder,
    $$AssetsTableUpdateCompanionBuilder,
    (Asset, BaseReferences<_$BusinessDatabase, $AssetsTable, Asset>),
    Asset,
    PrefetchHooks Function()>;
typedef $$AssetDepreciationScheduleTableCreateCompanionBuilder
    = AssetDepreciationScheduleCompanion Function({
  required String id,
  required String assetId,
  required int periodMonth,
  required int periodYear,
  required int depreciationAmount,
  required int accumulatedDepreciation,
  required int bookValue,
  Value<int> rowid,
});
typedef $$AssetDepreciationScheduleTableUpdateCompanionBuilder
    = AssetDepreciationScheduleCompanion Function({
  Value<String> id,
  Value<String> assetId,
  Value<int> periodMonth,
  Value<int> periodYear,
  Value<int> depreciationAmount,
  Value<int> accumulatedDepreciation,
  Value<int> bookValue,
  Value<int> rowid,
});

class $$AssetDepreciationScheduleTableFilterComposer
    extends Composer<_$BusinessDatabase, $AssetDepreciationScheduleTable> {
  $$AssetDepreciationScheduleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetId => $composableBuilder(
      column: $table.assetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodYear => $composableBuilder(
      column: $table.periodYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get depreciationAmount => $composableBuilder(
      column: $table.depreciationAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get accumulatedDepreciation => $composableBuilder(
      column: $table.accumulatedDepreciation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bookValue => $composableBuilder(
      column: $table.bookValue, builder: (column) => ColumnFilters(column));
}

class $$AssetDepreciationScheduleTableOrderingComposer
    extends Composer<_$BusinessDatabase, $AssetDepreciationScheduleTable> {
  $$AssetDepreciationScheduleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetId => $composableBuilder(
      column: $table.assetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodYear => $composableBuilder(
      column: $table.periodYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get depreciationAmount => $composableBuilder(
      column: $table.depreciationAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get accumulatedDepreciation => $composableBuilder(
      column: $table.accumulatedDepreciation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bookValue => $composableBuilder(
      column: $table.bookValue, builder: (column) => ColumnOrderings(column));
}

class $$AssetDepreciationScheduleTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $AssetDepreciationScheduleTable> {
  $$AssetDepreciationScheduleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assetId =>
      $composableBuilder(column: $table.assetId, builder: (column) => column);

  GeneratedColumn<int> get periodMonth => $composableBuilder(
      column: $table.periodMonth, builder: (column) => column);

  GeneratedColumn<int> get periodYear => $composableBuilder(
      column: $table.periodYear, builder: (column) => column);

  GeneratedColumn<int> get depreciationAmount => $composableBuilder(
      column: $table.depreciationAmount, builder: (column) => column);

  GeneratedColumn<int> get accumulatedDepreciation => $composableBuilder(
      column: $table.accumulatedDepreciation, builder: (column) => column);

  GeneratedColumn<int> get bookValue =>
      $composableBuilder(column: $table.bookValue, builder: (column) => column);
}

class $$AssetDepreciationScheduleTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $AssetDepreciationScheduleTable,
    AssetDepreciationScheduleData,
    $$AssetDepreciationScheduleTableFilterComposer,
    $$AssetDepreciationScheduleTableOrderingComposer,
    $$AssetDepreciationScheduleTableAnnotationComposer,
    $$AssetDepreciationScheduleTableCreateCompanionBuilder,
    $$AssetDepreciationScheduleTableUpdateCompanionBuilder,
    (
      AssetDepreciationScheduleData,
      BaseReferences<_$BusinessDatabase, $AssetDepreciationScheduleTable,
          AssetDepreciationScheduleData>
    ),
    AssetDepreciationScheduleData,
    PrefetchHooks Function()> {
  $$AssetDepreciationScheduleTableTableManager(
      _$BusinessDatabase db, $AssetDepreciationScheduleTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetDepreciationScheduleTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetDepreciationScheduleTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetDepreciationScheduleTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assetId = const Value.absent(),
            Value<int> periodMonth = const Value.absent(),
            Value<int> periodYear = const Value.absent(),
            Value<int> depreciationAmount = const Value.absent(),
            Value<int> accumulatedDepreciation = const Value.absent(),
            Value<int> bookValue = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetDepreciationScheduleCompanion(
            id: id,
            assetId: assetId,
            periodMonth: periodMonth,
            periodYear: periodYear,
            depreciationAmount: depreciationAmount,
            accumulatedDepreciation: accumulatedDepreciation,
            bookValue: bookValue,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assetId,
            required int periodMonth,
            required int periodYear,
            required int depreciationAmount,
            required int accumulatedDepreciation,
            required int bookValue,
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetDepreciationScheduleCompanion.insert(
            id: id,
            assetId: assetId,
            periodMonth: periodMonth,
            periodYear: periodYear,
            depreciationAmount: depreciationAmount,
            accumulatedDepreciation: accumulatedDepreciation,
            bookValue: bookValue,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetDepreciationScheduleTableProcessedTableManager
    = ProcessedTableManager<
        _$BusinessDatabase,
        $AssetDepreciationScheduleTable,
        AssetDepreciationScheduleData,
        $$AssetDepreciationScheduleTableFilterComposer,
        $$AssetDepreciationScheduleTableOrderingComposer,
        $$AssetDepreciationScheduleTableAnnotationComposer,
        $$AssetDepreciationScheduleTableCreateCompanionBuilder,
        $$AssetDepreciationScheduleTableUpdateCompanionBuilder,
        (
          AssetDepreciationScheduleData,
          BaseReferences<_$BusinessDatabase, $AssetDepreciationScheduleTable,
              AssetDepreciationScheduleData>
        ),
        AssetDepreciationScheduleData,
        PrefetchHooks Function()>;
typedef $$AssetValuationsTableCreateCompanionBuilder = AssetValuationsCompanion
    Function({
  required String id,
  required String assetId,
  required DateTime valuationDate,
  required int valuationAmount,
  Value<String?> valuerName,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$AssetValuationsTableUpdateCompanionBuilder = AssetValuationsCompanion
    Function({
  Value<String> id,
  Value<String> assetId,
  Value<DateTime> valuationDate,
  Value<int> valuationAmount,
  Value<String?> valuerName,
  Value<String?> notes,
  Value<int> rowid,
});

class $$AssetValuationsTableFilterComposer
    extends Composer<_$BusinessDatabase, $AssetValuationsTable> {
  $$AssetValuationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetId => $composableBuilder(
      column: $table.assetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get valuationDate => $composableBuilder(
      column: $table.valuationDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get valuationAmount => $composableBuilder(
      column: $table.valuationAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get valuerName => $composableBuilder(
      column: $table.valuerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$AssetValuationsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $AssetValuationsTable> {
  $$AssetValuationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetId => $composableBuilder(
      column: $table.assetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get valuationDate => $composableBuilder(
      column: $table.valuationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get valuationAmount => $composableBuilder(
      column: $table.valuationAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get valuerName => $composableBuilder(
      column: $table.valuerName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$AssetValuationsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $AssetValuationsTable> {
  $$AssetValuationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assetId =>
      $composableBuilder(column: $table.assetId, builder: (column) => column);

  GeneratedColumn<DateTime> get valuationDate => $composableBuilder(
      column: $table.valuationDate, builder: (column) => column);

  GeneratedColumn<int> get valuationAmount => $composableBuilder(
      column: $table.valuationAmount, builder: (column) => column);

  GeneratedColumn<String> get valuerName => $composableBuilder(
      column: $table.valuerName, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$AssetValuationsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $AssetValuationsTable,
    AssetValuation,
    $$AssetValuationsTableFilterComposer,
    $$AssetValuationsTableOrderingComposer,
    $$AssetValuationsTableAnnotationComposer,
    $$AssetValuationsTableCreateCompanionBuilder,
    $$AssetValuationsTableUpdateCompanionBuilder,
    (
      AssetValuation,
      BaseReferences<_$BusinessDatabase, $AssetValuationsTable, AssetValuation>
    ),
    AssetValuation,
    PrefetchHooks Function()> {
  $$AssetValuationsTableTableManager(
      _$BusinessDatabase db, $AssetValuationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetValuationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetValuationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetValuationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assetId = const Value.absent(),
            Value<DateTime> valuationDate = const Value.absent(),
            Value<int> valuationAmount = const Value.absent(),
            Value<String?> valuerName = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetValuationsCompanion(
            id: id,
            assetId: assetId,
            valuationDate: valuationDate,
            valuationAmount: valuationAmount,
            valuerName: valuerName,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assetId,
            required DateTime valuationDate,
            required int valuationAmount,
            Value<String?> valuerName = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetValuationsCompanion.insert(
            id: id,
            assetId: assetId,
            valuationDate: valuationDate,
            valuationAmount: valuationAmount,
            valuerName: valuerName,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetValuationsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $AssetValuationsTable,
    AssetValuation,
    $$AssetValuationsTableFilterComposer,
    $$AssetValuationsTableOrderingComposer,
    $$AssetValuationsTableAnnotationComposer,
    $$AssetValuationsTableCreateCompanionBuilder,
    $$AssetValuationsTableUpdateCompanionBuilder,
    (
      AssetValuation,
      BaseReferences<_$BusinessDatabase, $AssetValuationsTable, AssetValuation>
    ),
    AssetValuation,
    PrefetchHooks Function()>;
typedef $$InventoryItemsTableCreateCompanionBuilder = InventoryItemsCompanion
    Function({
  required String id,
  required String itemCode,
  required String itemName,
  required String category,
  required String unit,
  required int unitCost,
  required int quantityOnHand,
  required int minimumLevel,
  Value<int> rowid,
});
typedef $$InventoryItemsTableUpdateCompanionBuilder = InventoryItemsCompanion
    Function({
  Value<String> id,
  Value<String> itemCode,
  Value<String> itemName,
  Value<String> category,
  Value<String> unit,
  Value<int> unitCost,
  Value<int> quantityOnHand,
  Value<int> minimumLevel,
  Value<int> rowid,
});

class $$InventoryItemsTableFilterComposer
    extends Composer<_$BusinessDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemCode => $composableBuilder(
      column: $table.itemCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemName => $composableBuilder(
      column: $table.itemName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityOnHand => $composableBuilder(
      column: $table.quantityOnHand,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumLevel => $composableBuilder(
      column: $table.minimumLevel, builder: (column) => ColumnFilters(column));
}

class $$InventoryItemsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemCode => $composableBuilder(
      column: $table.itemCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemName => $composableBuilder(
      column: $table.itemName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityOnHand => $composableBuilder(
      column: $table.quantityOnHand,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumLevel => $composableBuilder(
      column: $table.minimumLevel,
      builder: (column) => ColumnOrderings(column));
}

class $$InventoryItemsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemCode =>
      $composableBuilder(column: $table.itemCode, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  GeneratedColumn<int> get quantityOnHand => $composableBuilder(
      column: $table.quantityOnHand, builder: (column) => column);

  GeneratedColumn<int> get minimumLevel => $composableBuilder(
      column: $table.minimumLevel, builder: (column) => column);
}

class $$InventoryItemsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $InventoryItemsTable,
    InventoryItem,
    $$InventoryItemsTableFilterComposer,
    $$InventoryItemsTableOrderingComposer,
    $$InventoryItemsTableAnnotationComposer,
    $$InventoryItemsTableCreateCompanionBuilder,
    $$InventoryItemsTableUpdateCompanionBuilder,
    (
      InventoryItem,
      BaseReferences<_$BusinessDatabase, $InventoryItemsTable, InventoryItem>
    ),
    InventoryItem,
    PrefetchHooks Function()> {
  $$InventoryItemsTableTableManager(
      _$BusinessDatabase db, $InventoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemCode = const Value.absent(),
            Value<String> itemName = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<int> unitCost = const Value.absent(),
            Value<int> quantityOnHand = const Value.absent(),
            Value<int> minimumLevel = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryItemsCompanion(
            id: id,
            itemCode: itemCode,
            itemName: itemName,
            category: category,
            unit: unit,
            unitCost: unitCost,
            quantityOnHand: quantityOnHand,
            minimumLevel: minimumLevel,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemCode,
            required String itemName,
            required String category,
            required String unit,
            required int unitCost,
            required int quantityOnHand,
            required int minimumLevel,
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryItemsCompanion.insert(
            id: id,
            itemCode: itemCode,
            itemName: itemName,
            category: category,
            unit: unit,
            unitCost: unitCost,
            quantityOnHand: quantityOnHand,
            minimumLevel: minimumLevel,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InventoryItemsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $InventoryItemsTable,
    InventoryItem,
    $$InventoryItemsTableFilterComposer,
    $$InventoryItemsTableOrderingComposer,
    $$InventoryItemsTableAnnotationComposer,
    $$InventoryItemsTableCreateCompanionBuilder,
    $$InventoryItemsTableUpdateCompanionBuilder,
    (
      InventoryItem,
      BaseReferences<_$BusinessDatabase, $InventoryItemsTable, InventoryItem>
    ),
    InventoryItem,
    PrefetchHooks Function()>;
typedef $$InventoryPurchasesTableCreateCompanionBuilder
    = InventoryPurchasesCompanion Function({
  required String id,
  required String itemId,
  required String supplierName,
  required DateTime purchaseDate,
  required int quantity,
  required int unitCost,
  required int totalCost,
  Value<String> status,
  Value<int> rowid,
});
typedef $$InventoryPurchasesTableUpdateCompanionBuilder
    = InventoryPurchasesCompanion Function({
  Value<String> id,
  Value<String> itemId,
  Value<String> supplierName,
  Value<DateTime> purchaseDate,
  Value<int> quantity,
  Value<int> unitCost,
  Value<int> totalCost,
  Value<String> status,
  Value<int> rowid,
});

class $$InventoryPurchasesTableFilterComposer
    extends Composer<_$BusinessDatabase, $InventoryPurchasesTable> {
  $$InventoryPurchasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierName => $composableBuilder(
      column: $table.supplierName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$InventoryPurchasesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $InventoryPurchasesTable> {
  $$InventoryPurchasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierName => $composableBuilder(
      column: $table.supplierName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$InventoryPurchasesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $InventoryPurchasesTable> {
  $$InventoryPurchasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get supplierName => $composableBuilder(
      column: $table.supplierName, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  GeneratedColumn<int> get totalCost =>
      $composableBuilder(column: $table.totalCost, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$InventoryPurchasesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $InventoryPurchasesTable,
    InventoryPurchase,
    $$InventoryPurchasesTableFilterComposer,
    $$InventoryPurchasesTableOrderingComposer,
    $$InventoryPurchasesTableAnnotationComposer,
    $$InventoryPurchasesTableCreateCompanionBuilder,
    $$InventoryPurchasesTableUpdateCompanionBuilder,
    (
      InventoryPurchase,
      BaseReferences<_$BusinessDatabase, $InventoryPurchasesTable,
          InventoryPurchase>
    ),
    InventoryPurchase,
    PrefetchHooks Function()> {
  $$InventoryPurchasesTableTableManager(
      _$BusinessDatabase db, $InventoryPurchasesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryPurchasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryPurchasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryPurchasesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> supplierName = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> unitCost = const Value.absent(),
            Value<int> totalCost = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryPurchasesCompanion(
            id: id,
            itemId: itemId,
            supplierName: supplierName,
            purchaseDate: purchaseDate,
            quantity: quantity,
            unitCost: unitCost,
            totalCost: totalCost,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required String supplierName,
            required DateTime purchaseDate,
            required int quantity,
            required int unitCost,
            required int totalCost,
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryPurchasesCompanion.insert(
            id: id,
            itemId: itemId,
            supplierName: supplierName,
            purchaseDate: purchaseDate,
            quantity: quantity,
            unitCost: unitCost,
            totalCost: totalCost,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InventoryPurchasesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $InventoryPurchasesTable,
    InventoryPurchase,
    $$InventoryPurchasesTableFilterComposer,
    $$InventoryPurchasesTableOrderingComposer,
    $$InventoryPurchasesTableAnnotationComposer,
    $$InventoryPurchasesTableCreateCompanionBuilder,
    $$InventoryPurchasesTableUpdateCompanionBuilder,
    (
      InventoryPurchase,
      BaseReferences<_$BusinessDatabase, $InventoryPurchasesTable,
          InventoryPurchase>
    ),
    InventoryPurchase,
    PrefetchHooks Function()>;
typedef $$InventoryAdjustmentsTableCreateCompanionBuilder
    = InventoryAdjustmentsCompanion Function({
  required String id,
  required String itemId,
  required DateTime adjustmentDate,
  required String adjustmentType,
  required int quantityDelta,
  required String reason,
  required String userId,
  Value<int> rowid,
});
typedef $$InventoryAdjustmentsTableUpdateCompanionBuilder
    = InventoryAdjustmentsCompanion Function({
  Value<String> id,
  Value<String> itemId,
  Value<DateTime> adjustmentDate,
  Value<String> adjustmentType,
  Value<int> quantityDelta,
  Value<String> reason,
  Value<String> userId,
  Value<int> rowid,
});

class $$InventoryAdjustmentsTableFilterComposer
    extends Composer<_$BusinessDatabase, $InventoryAdjustmentsTable> {
  $$InventoryAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get adjustmentDate => $composableBuilder(
      column: $table.adjustmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get adjustmentType => $composableBuilder(
      column: $table.adjustmentType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityDelta => $composableBuilder(
      column: $table.quantityDelta, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));
}

class $$InventoryAdjustmentsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $InventoryAdjustmentsTable> {
  $$InventoryAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get adjustmentDate => $composableBuilder(
      column: $table.adjustmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get adjustmentType => $composableBuilder(
      column: $table.adjustmentType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityDelta => $composableBuilder(
      column: $table.quantityDelta,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));
}

class $$InventoryAdjustmentsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $InventoryAdjustmentsTable> {
  $$InventoryAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<DateTime> get adjustmentDate => $composableBuilder(
      column: $table.adjustmentDate, builder: (column) => column);

  GeneratedColumn<String> get adjustmentType => $composableBuilder(
      column: $table.adjustmentType, builder: (column) => column);

  GeneratedColumn<int> get quantityDelta => $composableBuilder(
      column: $table.quantityDelta, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);
}

class $$InventoryAdjustmentsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $InventoryAdjustmentsTable,
    InventoryAdjustment,
    $$InventoryAdjustmentsTableFilterComposer,
    $$InventoryAdjustmentsTableOrderingComposer,
    $$InventoryAdjustmentsTableAnnotationComposer,
    $$InventoryAdjustmentsTableCreateCompanionBuilder,
    $$InventoryAdjustmentsTableUpdateCompanionBuilder,
    (
      InventoryAdjustment,
      BaseReferences<_$BusinessDatabase, $InventoryAdjustmentsTable,
          InventoryAdjustment>
    ),
    InventoryAdjustment,
    PrefetchHooks Function()> {
  $$InventoryAdjustmentsTableTableManager(
      _$BusinessDatabase db, $InventoryAdjustmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryAdjustmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryAdjustmentsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryAdjustmentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<DateTime> adjustmentDate = const Value.absent(),
            Value<String> adjustmentType = const Value.absent(),
            Value<int> quantityDelta = const Value.absent(),
            Value<String> reason = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryAdjustmentsCompanion(
            id: id,
            itemId: itemId,
            adjustmentDate: adjustmentDate,
            adjustmentType: adjustmentType,
            quantityDelta: quantityDelta,
            reason: reason,
            userId: userId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required DateTime adjustmentDate,
            required String adjustmentType,
            required int quantityDelta,
            required String reason,
            required String userId,
            Value<int> rowid = const Value.absent(),
          }) =>
              InventoryAdjustmentsCompanion.insert(
            id: id,
            itemId: itemId,
            adjustmentDate: adjustmentDate,
            adjustmentType: adjustmentType,
            quantityDelta: quantityDelta,
            reason: reason,
            userId: userId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InventoryAdjustmentsTableProcessedTableManager
    = ProcessedTableManager<
        _$BusinessDatabase,
        $InventoryAdjustmentsTable,
        InventoryAdjustment,
        $$InventoryAdjustmentsTableFilterComposer,
        $$InventoryAdjustmentsTableOrderingComposer,
        $$InventoryAdjustmentsTableAnnotationComposer,
        $$InventoryAdjustmentsTableCreateCompanionBuilder,
        $$InventoryAdjustmentsTableUpdateCompanionBuilder,
        (
          InventoryAdjustment,
          BaseReferences<_$BusinessDatabase, $InventoryAdjustmentsTable,
              InventoryAdjustment>
        ),
        InventoryAdjustment,
        PrefetchHooks Function()>;
typedef $$MeetingRoomsTableCreateCompanionBuilder = MeetingRoomsCompanion
    Function({
  required String id,
  required String roomName,
  required int capacity,
  Value<String> status,
  Value<int> rowid,
});
typedef $$MeetingRoomsTableUpdateCompanionBuilder = MeetingRoomsCompanion
    Function({
  Value<String> id,
  Value<String> roomName,
  Value<int> capacity,
  Value<String> status,
  Value<int> rowid,
});

class $$MeetingRoomsTableFilterComposer
    extends Composer<_$BusinessDatabase, $MeetingRoomsTable> {
  $$MeetingRoomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roomName => $composableBuilder(
      column: $table.roomName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$MeetingRoomsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $MeetingRoomsTable> {
  $$MeetingRoomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roomName => $composableBuilder(
      column: $table.roomName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$MeetingRoomsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $MeetingRoomsTable> {
  $$MeetingRoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get roomName =>
      $composableBuilder(column: $table.roomName, builder: (column) => column);

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$MeetingRoomsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $MeetingRoomsTable,
    MeetingRoom,
    $$MeetingRoomsTableFilterComposer,
    $$MeetingRoomsTableOrderingComposer,
    $$MeetingRoomsTableAnnotationComposer,
    $$MeetingRoomsTableCreateCompanionBuilder,
    $$MeetingRoomsTableUpdateCompanionBuilder,
    (
      MeetingRoom,
      BaseReferences<_$BusinessDatabase, $MeetingRoomsTable, MeetingRoom>
    ),
    MeetingRoom,
    PrefetchHooks Function()> {
  $$MeetingRoomsTableTableManager(
      _$BusinessDatabase db, $MeetingRoomsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeetingRoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeetingRoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeetingRoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> roomName = const Value.absent(),
            Value<int> capacity = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetingRoomsCompanion(
            id: id,
            roomName: roomName,
            capacity: capacity,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String roomName,
            required int capacity,
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetingRoomsCompanion.insert(
            id: id,
            roomName: roomName,
            capacity: capacity,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MeetingRoomsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $MeetingRoomsTable,
    MeetingRoom,
    $$MeetingRoomsTableFilterComposer,
    $$MeetingRoomsTableOrderingComposer,
    $$MeetingRoomsTableAnnotationComposer,
    $$MeetingRoomsTableCreateCompanionBuilder,
    $$MeetingRoomsTableUpdateCompanionBuilder,
    (
      MeetingRoom,
      BaseReferences<_$BusinessDatabase, $MeetingRoomsTable, MeetingRoom>
    ),
    MeetingRoom,
    PrefetchHooks Function()>;
typedef $$CalendarEventsTableCreateCompanionBuilder = CalendarEventsCompanion
    Function({
  required String id,
  required String title,
  required String eventType,
  required DateTime eventDate,
  required String startTime,
  required String endTime,
  Value<String?> roomId,
  Value<String?> description,
  required String createdByUserId,
  Value<int> attendeeCount,
  Value<int> rowid,
});
typedef $$CalendarEventsTableUpdateCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String> eventType,
  Value<DateTime> eventDate,
  Value<String> startTime,
  Value<String> endTime,
  Value<String?> roomId,
  Value<String?> description,
  Value<String> createdByUserId,
  Value<int> attendeeCount,
  Value<int> rowid,
});

class $$CalendarEventsTableFilterComposer
    extends Composer<_$BusinessDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eventType => $composableBuilder(
      column: $table.eventType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get eventDate => $composableBuilder(
      column: $table.eventDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roomId => $composableBuilder(
      column: $table.roomId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attendeeCount => $composableBuilder(
      column: $table.attendeeCount, builder: (column) => ColumnFilters(column));
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eventType => $composableBuilder(
      column: $table.eventType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get eventDate => $composableBuilder(
      column: $table.eventDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roomId => $composableBuilder(
      column: $table.roomId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attendeeCount => $composableBuilder(
      column: $table.attendeeCount,
      builder: (column) => ColumnOrderings(column));
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<DateTime> get eventDate =>
      $composableBuilder(column: $table.eventDate, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId, builder: (column) => column);

  GeneratedColumn<int> get attendeeCount => $composableBuilder(
      column: $table.attendeeCount, builder: (column) => column);
}

class $$CalendarEventsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $CalendarEventsTable,
    CalendarEvent,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEvent,
      BaseReferences<_$BusinessDatabase, $CalendarEventsTable, CalendarEvent>
    ),
    CalendarEvent,
    PrefetchHooks Function()> {
  $$CalendarEventsTableTableManager(
      _$BusinessDatabase db, $CalendarEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> eventType = const Value.absent(),
            Value<DateTime> eventDate = const Value.absent(),
            Value<String> startTime = const Value.absent(),
            Value<String> endTime = const Value.absent(),
            Value<String?> roomId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> createdByUserId = const Value.absent(),
            Value<int> attendeeCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarEventsCompanion(
            id: id,
            title: title,
            eventType: eventType,
            eventDate: eventDate,
            startTime: startTime,
            endTime: endTime,
            roomId: roomId,
            description: description,
            createdByUserId: createdByUserId,
            attendeeCount: attendeeCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String eventType,
            required DateTime eventDate,
            required String startTime,
            required String endTime,
            Value<String?> roomId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            required String createdByUserId,
            Value<int> attendeeCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarEventsCompanion.insert(
            id: id,
            title: title,
            eventType: eventType,
            eventDate: eventDate,
            startTime: startTime,
            endTime: endTime,
            roomId: roomId,
            description: description,
            createdByUserId: createdByUserId,
            attendeeCount: attendeeCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CalendarEventsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $CalendarEventsTable,
    CalendarEvent,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEvent,
      BaseReferences<_$BusinessDatabase, $CalendarEventsTable, CalendarEvent>
    ),
    CalendarEvent,
    PrefetchHooks Function()>;
typedef $$RoomBookingsTableCreateCompanionBuilder = RoomBookingsCompanion
    Function({
  required String id,
  required String roomId,
  Value<String?> eventId,
  required DateTime bookedFrom,
  required DateTime bookedTo,
  required String status,
  Value<int> rowid,
});
typedef $$RoomBookingsTableUpdateCompanionBuilder = RoomBookingsCompanion
    Function({
  Value<String> id,
  Value<String> roomId,
  Value<String?> eventId,
  Value<DateTime> bookedFrom,
  Value<DateTime> bookedTo,
  Value<String> status,
  Value<int> rowid,
});

class $$RoomBookingsTableFilterComposer
    extends Composer<_$BusinessDatabase, $RoomBookingsTable> {
  $$RoomBookingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roomId => $composableBuilder(
      column: $table.roomId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eventId => $composableBuilder(
      column: $table.eventId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get bookedFrom => $composableBuilder(
      column: $table.bookedFrom, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get bookedTo => $composableBuilder(
      column: $table.bookedTo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$RoomBookingsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $RoomBookingsTable> {
  $$RoomBookingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roomId => $composableBuilder(
      column: $table.roomId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eventId => $composableBuilder(
      column: $table.eventId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get bookedFrom => $composableBuilder(
      column: $table.bookedFrom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get bookedTo => $composableBuilder(
      column: $table.bookedTo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$RoomBookingsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $RoomBookingsTable> {
  $$RoomBookingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<String> get eventId =>
      $composableBuilder(column: $table.eventId, builder: (column) => column);

  GeneratedColumn<DateTime> get bookedFrom => $composableBuilder(
      column: $table.bookedFrom, builder: (column) => column);

  GeneratedColumn<DateTime> get bookedTo =>
      $composableBuilder(column: $table.bookedTo, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$RoomBookingsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $RoomBookingsTable,
    RoomBooking,
    $$RoomBookingsTableFilterComposer,
    $$RoomBookingsTableOrderingComposer,
    $$RoomBookingsTableAnnotationComposer,
    $$RoomBookingsTableCreateCompanionBuilder,
    $$RoomBookingsTableUpdateCompanionBuilder,
    (
      RoomBooking,
      BaseReferences<_$BusinessDatabase, $RoomBookingsTable, RoomBooking>
    ),
    RoomBooking,
    PrefetchHooks Function()> {
  $$RoomBookingsTableTableManager(
      _$BusinessDatabase db, $RoomBookingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomBookingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomBookingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomBookingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> roomId = const Value.absent(),
            Value<String?> eventId = const Value.absent(),
            Value<DateTime> bookedFrom = const Value.absent(),
            Value<DateTime> bookedTo = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RoomBookingsCompanion(
            id: id,
            roomId: roomId,
            eventId: eventId,
            bookedFrom: bookedFrom,
            bookedTo: bookedTo,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String roomId,
            Value<String?> eventId = const Value.absent(),
            required DateTime bookedFrom,
            required DateTime bookedTo,
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              RoomBookingsCompanion.insert(
            id: id,
            roomId: roomId,
            eventId: eventId,
            bookedFrom: bookedFrom,
            bookedTo: bookedTo,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RoomBookingsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $RoomBookingsTable,
    RoomBooking,
    $$RoomBookingsTableFilterComposer,
    $$RoomBookingsTableOrderingComposer,
    $$RoomBookingsTableAnnotationComposer,
    $$RoomBookingsTableCreateCompanionBuilder,
    $$RoomBookingsTableUpdateCompanionBuilder,
    (
      RoomBooking,
      BaseReferences<_$BusinessDatabase, $RoomBookingsTable, RoomBooking>
    ),
    RoomBooking,
    PrefetchHooks Function()>;
typedef $$ReportTemplatesTableCreateCompanionBuilder = ReportTemplatesCompanion
    Function({
  required String id,
  required String name,
  required String reportType,
  required String filtersJson,
  required String createdByUserId,
  Value<bool> isScheduled,
  Value<int> rowid,
});
typedef $$ReportTemplatesTableUpdateCompanionBuilder = ReportTemplatesCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> reportType,
  Value<String> filtersJson,
  Value<String> createdByUserId,
  Value<bool> isScheduled,
  Value<int> rowid,
});

class $$ReportTemplatesTableFilterComposer
    extends Composer<_$BusinessDatabase, $ReportTemplatesTable> {
  $$ReportTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filtersJson => $composableBuilder(
      column: $table.filtersJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isScheduled => $composableBuilder(
      column: $table.isScheduled, builder: (column) => ColumnFilters(column));
}

class $$ReportTemplatesTableOrderingComposer
    extends Composer<_$BusinessDatabase, $ReportTemplatesTable> {
  $$ReportTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filtersJson => $composableBuilder(
      column: $table.filtersJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isScheduled => $composableBuilder(
      column: $table.isScheduled, builder: (column) => ColumnOrderings(column));
}

class $$ReportTemplatesTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $ReportTemplatesTable> {
  $$ReportTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => column);

  GeneratedColumn<String> get filtersJson => $composableBuilder(
      column: $table.filtersJson, builder: (column) => column);

  GeneratedColumn<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId, builder: (column) => column);

  GeneratedColumn<bool> get isScheduled => $composableBuilder(
      column: $table.isScheduled, builder: (column) => column);
}

class $$ReportTemplatesTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $ReportTemplatesTable,
    ReportTemplate,
    $$ReportTemplatesTableFilterComposer,
    $$ReportTemplatesTableOrderingComposer,
    $$ReportTemplatesTableAnnotationComposer,
    $$ReportTemplatesTableCreateCompanionBuilder,
    $$ReportTemplatesTableUpdateCompanionBuilder,
    (
      ReportTemplate,
      BaseReferences<_$BusinessDatabase, $ReportTemplatesTable, ReportTemplate>
    ),
    ReportTemplate,
    PrefetchHooks Function()> {
  $$ReportTemplatesTableTableManager(
      _$BusinessDatabase db, $ReportTemplatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> reportType = const Value.absent(),
            Value<String> filtersJson = const Value.absent(),
            Value<String> createdByUserId = const Value.absent(),
            Value<bool> isScheduled = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportTemplatesCompanion(
            id: id,
            name: name,
            reportType: reportType,
            filtersJson: filtersJson,
            createdByUserId: createdByUserId,
            isScheduled: isScheduled,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String reportType,
            required String filtersJson,
            required String createdByUserId,
            Value<bool> isScheduled = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportTemplatesCompanion.insert(
            id: id,
            name: name,
            reportType: reportType,
            filtersJson: filtersJson,
            createdByUserId: createdByUserId,
            isScheduled: isScheduled,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReportTemplatesTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $ReportTemplatesTable,
    ReportTemplate,
    $$ReportTemplatesTableFilterComposer,
    $$ReportTemplatesTableOrderingComposer,
    $$ReportTemplatesTableAnnotationComposer,
    $$ReportTemplatesTableCreateCompanionBuilder,
    $$ReportTemplatesTableUpdateCompanionBuilder,
    (
      ReportTemplate,
      BaseReferences<_$BusinessDatabase, $ReportTemplatesTable, ReportTemplate>
    ),
    ReportTemplate,
    PrefetchHooks Function()>;
typedef $$GeneratedReportsTableCreateCompanionBuilder
    = GeneratedReportsCompanion Function({
  required String id,
  Value<String?> templateId,
  required String reportName,
  required String reportType,
  required DateTime dateFrom,
  required DateTime dateTo,
  required String format,
  required DateTime generatedAt,
  required String filePath,
  Value<String> status,
  Value<int> rowid,
});
typedef $$GeneratedReportsTableUpdateCompanionBuilder
    = GeneratedReportsCompanion Function({
  Value<String> id,
  Value<String?> templateId,
  Value<String> reportName,
  Value<String> reportType,
  Value<DateTime> dateFrom,
  Value<DateTime> dateTo,
  Value<String> format,
  Value<DateTime> generatedAt,
  Value<String> filePath,
  Value<String> status,
  Value<int> rowid,
});

class $$GeneratedReportsTableFilterComposer
    extends Composer<_$BusinessDatabase, $GeneratedReportsTable> {
  $$GeneratedReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportName => $composableBuilder(
      column: $table.reportName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateFrom => $composableBuilder(
      column: $table.dateFrom, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTo => $composableBuilder(
      column: $table.dateTo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$GeneratedReportsTableOrderingComposer
    extends Composer<_$BusinessDatabase, $GeneratedReportsTable> {
  $$GeneratedReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportName => $composableBuilder(
      column: $table.reportName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateFrom => $composableBuilder(
      column: $table.dateFrom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTo => $composableBuilder(
      column: $table.dateTo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$GeneratedReportsTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $GeneratedReportsTable> {
  $$GeneratedReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => column);

  GeneratedColumn<String> get reportName => $composableBuilder(
      column: $table.reportName, builder: (column) => column);

  GeneratedColumn<String> get reportType => $composableBuilder(
      column: $table.reportType, builder: (column) => column);

  GeneratedColumn<DateTime> get dateFrom =>
      $composableBuilder(column: $table.dateFrom, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTo =>
      $composableBuilder(column: $table.dateTo, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$GeneratedReportsTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $GeneratedReportsTable,
    GeneratedReport,
    $$GeneratedReportsTableFilterComposer,
    $$GeneratedReportsTableOrderingComposer,
    $$GeneratedReportsTableAnnotationComposer,
    $$GeneratedReportsTableCreateCompanionBuilder,
    $$GeneratedReportsTableUpdateCompanionBuilder,
    (
      GeneratedReport,
      BaseReferences<_$BusinessDatabase, $GeneratedReportsTable,
          GeneratedReport>
    ),
    GeneratedReport,
    PrefetchHooks Function()> {
  $$GeneratedReportsTableTableManager(
      _$BusinessDatabase db, $GeneratedReportsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeneratedReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeneratedReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeneratedReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> templateId = const Value.absent(),
            Value<String> reportName = const Value.absent(),
            Value<String> reportType = const Value.absent(),
            Value<DateTime> dateFrom = const Value.absent(),
            Value<DateTime> dateTo = const Value.absent(),
            Value<String> format = const Value.absent(),
            Value<DateTime> generatedAt = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GeneratedReportsCompanion(
            id: id,
            templateId: templateId,
            reportName: reportName,
            reportType: reportType,
            dateFrom: dateFrom,
            dateTo: dateTo,
            format: format,
            generatedAt: generatedAt,
            filePath: filePath,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> templateId = const Value.absent(),
            required String reportName,
            required String reportType,
            required DateTime dateFrom,
            required DateTime dateTo,
            required String format,
            required DateTime generatedAt,
            required String filePath,
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GeneratedReportsCompanion.insert(
            id: id,
            templateId: templateId,
            reportName: reportName,
            reportType: reportType,
            dateFrom: dateFrom,
            dateTo: dateTo,
            format: format,
            generatedAt: generatedAt,
            filePath: filePath,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GeneratedReportsTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $GeneratedReportsTable,
    GeneratedReport,
    $$GeneratedReportsTableFilterComposer,
    $$GeneratedReportsTableOrderingComposer,
    $$GeneratedReportsTableAnnotationComposer,
    $$GeneratedReportsTableCreateCompanionBuilder,
    $$GeneratedReportsTableUpdateCompanionBuilder,
    (
      GeneratedReport,
      BaseReferences<_$BusinessDatabase, $GeneratedReportsTable,
          GeneratedReport>
    ),
    GeneratedReport,
    PrefetchHooks Function()>;
typedef $$AuditLogTableCreateCompanionBuilder = AuditLogCompanion Function({
  required String id,
  required DateTime occurredAt,
  required String userId,
  required String userName,
  required String action,
  required String module,
  required String status,
  Value<String?> detailsJson,
  Value<int> rowid,
});
typedef $$AuditLogTableUpdateCompanionBuilder = AuditLogCompanion Function({
  Value<String> id,
  Value<DateTime> occurredAt,
  Value<String> userId,
  Value<String> userName,
  Value<String> action,
  Value<String> module,
  Value<String> status,
  Value<String?> detailsJson,
  Value<int> rowid,
});

class $$AuditLogTableFilterComposer
    extends Composer<_$BusinessDatabase, $AuditLogTable> {
  $$AuditLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => ColumnFilters(column));
}

class $$AuditLogTableOrderingComposer
    extends Composer<_$BusinessDatabase, $AuditLogTable> {
  $$AuditLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => ColumnOrderings(column));
}

class $$AuditLogTableAnnotationComposer
    extends Composer<_$BusinessDatabase, $AuditLogTable> {
  $$AuditLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get module =>
      $composableBuilder(column: $table.module, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => column);
}

class $$AuditLogTableTableManager extends RootTableManager<
    _$BusinessDatabase,
    $AuditLogTable,
    AuditLogData,
    $$AuditLogTableFilterComposer,
    $$AuditLogTableOrderingComposer,
    $$AuditLogTableAnnotationComposer,
    $$AuditLogTableCreateCompanionBuilder,
    $$AuditLogTableUpdateCompanionBuilder,
    (
      AuditLogData,
      BaseReferences<_$BusinessDatabase, $AuditLogTable, AuditLogData>
    ),
    AuditLogData,
    PrefetchHooks Function()> {
  $$AuditLogTableTableManager(_$BusinessDatabase db, $AuditLogTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> occurredAt = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String> module = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> detailsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditLogCompanion(
            id: id,
            occurredAt: occurredAt,
            userId: userId,
            userName: userName,
            action: action,
            module: module,
            status: status,
            detailsJson: detailsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime occurredAt,
            required String userId,
            required String userName,
            required String action,
            required String module,
            required String status,
            Value<String?> detailsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditLogCompanion.insert(
            id: id,
            occurredAt: occurredAt,
            userId: userId,
            userName: userName,
            action: action,
            module: module,
            status: status,
            detailsJson: detailsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuditLogTableProcessedTableManager = ProcessedTableManager<
    _$BusinessDatabase,
    $AuditLogTable,
    AuditLogData,
    $$AuditLogTableFilterComposer,
    $$AuditLogTableOrderingComposer,
    $$AuditLogTableAnnotationComposer,
    $$AuditLogTableCreateCompanionBuilder,
    $$AuditLogTableUpdateCompanionBuilder,
    (
      AuditLogData,
      BaseReferences<_$BusinessDatabase, $AuditLogTable, AuditLogData>
    ),
    AuditLogData,
    PrefetchHooks Function()>;

class $BusinessDatabaseManager {
  final _$BusinessDatabase _db;
  $BusinessDatabaseManager(this._db);
  $$ChartOfAccountsTableTableManager get chartOfAccounts =>
      $$ChartOfAccountsTableTableManager(_db, _db.chartOfAccounts);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$JournalLinesTableTableManager get journalLines =>
      $$JournalLinesTableTableManager(_db, _db.journalLines);
  $$BankAccountsTableTableManager get bankAccounts =>
      $$BankAccountsTableTableManager(_db, _db.bankAccounts);
  $$BankReconciliationsTableTableManager get bankReconciliations =>
      $$BankReconciliationsTableTableManager(_db, _db.bankReconciliations);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceLineItemsTableTableManager get invoiceLineItems =>
      $$InvoiceLineItemsTableTableManager(_db, _db.invoiceLineItems);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
  $$EmployeesTableTableManager get employees =>
      $$EmployeesTableTableManager(_db, _db.employees);
  $$AttendanceTableTableManager get attendance =>
      $$AttendanceTableTableManager(_db, _db.attendance);
  $$LeaveRequestsTableTableManager get leaveRequests =>
      $$LeaveRequestsTableTableManager(_db, _db.leaveRequests);
  $$LeaveBalancesTableTableManager get leaveBalances =>
      $$LeaveBalancesTableTableManager(_db, _db.leaveBalances);
  $$PayrollRunsTableTableManager get payrollRuns =>
      $$PayrollRunsTableTableManager(_db, _db.payrollRuns);
  $$PayrollItemsTableTableManager get payrollItems =>
      $$PayrollItemsTableTableManager(_db, _db.payrollItems);
  $$EmploymentContractsTableTableManager get employmentContracts =>
      $$EmploymentContractsTableTableManager(_db, _db.employmentContracts);
  $$AssetsTableTableManager get assets =>
      $$AssetsTableTableManager(_db, _db.assets);
  $$AssetDepreciationScheduleTableTableManager get assetDepreciationSchedule =>
      $$AssetDepreciationScheduleTableTableManager(
          _db, _db.assetDepreciationSchedule);
  $$AssetValuationsTableTableManager get assetValuations =>
      $$AssetValuationsTableTableManager(_db, _db.assetValuations);
  $$InventoryItemsTableTableManager get inventoryItems =>
      $$InventoryItemsTableTableManager(_db, _db.inventoryItems);
  $$InventoryPurchasesTableTableManager get inventoryPurchases =>
      $$InventoryPurchasesTableTableManager(_db, _db.inventoryPurchases);
  $$InventoryAdjustmentsTableTableManager get inventoryAdjustments =>
      $$InventoryAdjustmentsTableTableManager(_db, _db.inventoryAdjustments);
  $$MeetingRoomsTableTableManager get meetingRooms =>
      $$MeetingRoomsTableTableManager(_db, _db.meetingRooms);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$RoomBookingsTableTableManager get roomBookings =>
      $$RoomBookingsTableTableManager(_db, _db.roomBookings);
  $$ReportTemplatesTableTableManager get reportTemplates =>
      $$ReportTemplatesTableTableManager(_db, _db.reportTemplates);
  $$GeneratedReportsTableTableManager get generatedReports =>
      $$GeneratedReportsTableTableManager(_db, _db.generatedReports);
  $$AuditLogTableTableManager get auditLog =>
      $$AuditLogTableTableManager(_db, _db.auditLog);
}
