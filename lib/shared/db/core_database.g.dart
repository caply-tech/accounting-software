// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_database.dart';

// ignore_for_file: type=lint
class $BusinessesTable extends Businesses
    with TableInfo<$BusinessesTable, BusinessesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _businessTypeMeta =
      const VerificationMeta('businessType');
  @override
  late final GeneratedColumn<String> businessType = GeneratedColumn<String>(
      'business_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isHeadOfficeMeta =
      const VerificationMeta('isHeadOffice');
  @override
  late final GeneratedColumn<bool> isHeadOffice = GeneratedColumn<bool>(
      'is_head_office', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_head_office" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _dbFilenameMeta =
      const VerificationMeta('dbFilename');
  @override
  late final GeneratedColumn<String> dbFilename = GeneratedColumn<String>(
      'db_filename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fiscalYearLabelMeta =
      const VerificationMeta('fiscalYearLabel');
  @override
  late final GeneratedColumn<String> fiscalYearLabel = GeneratedColumn<String>(
      'fiscal_year_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fiscalYearStartMonthMeta =
      const VerificationMeta('fiscalYearStartMonth');
  @override
  late final GeneratedColumn<int> fiscalYearStartMonth = GeneratedColumn<int>(
      'fiscal_year_start_month', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
  static const VerificationMeta _currencyCodeMeta =
      const VerificationMeta('currencyCode');
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
      'currency_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('INR'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastActivityAtMeta =
      const VerificationMeta('lastActivityAt');
  @override
  late final GeneratedColumn<DateTime> lastActivityAt =
      GeneratedColumn<DateTime>('last_activity_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        businessType,
        location,
        isHeadOffice,
        status,
        dbFilename,
        fiscalYearLabel,
        fiscalYearStartMonth,
        currencyCode,
        createdAt,
        lastActivityAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'businesses';
  @override
  VerificationContext validateIntegrity(Insertable<BusinessesData> instance,
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
    if (data.containsKey('business_type')) {
      context.handle(
          _businessTypeMeta,
          businessType.isAcceptableOrUnknown(
              data['business_type']!, _businessTypeMeta));
    } else if (isInserting) {
      context.missing(_businessTypeMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('is_head_office')) {
      context.handle(
          _isHeadOfficeMeta,
          isHeadOffice.isAcceptableOrUnknown(
              data['is_head_office']!, _isHeadOfficeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('db_filename')) {
      context.handle(
          _dbFilenameMeta,
          dbFilename.isAcceptableOrUnknown(
              data['db_filename']!, _dbFilenameMeta));
    } else if (isInserting) {
      context.missing(_dbFilenameMeta);
    }
    if (data.containsKey('fiscal_year_label')) {
      context.handle(
          _fiscalYearLabelMeta,
          fiscalYearLabel.isAcceptableOrUnknown(
              data['fiscal_year_label']!, _fiscalYearLabelMeta));
    } else if (isInserting) {
      context.missing(_fiscalYearLabelMeta);
    }
    if (data.containsKey('fiscal_year_start_month')) {
      context.handle(
          _fiscalYearStartMonthMeta,
          fiscalYearStartMonth.isAcceptableOrUnknown(
              data['fiscal_year_start_month']!, _fiscalYearStartMonthMeta));
    }
    if (data.containsKey('currency_code')) {
      context.handle(
          _currencyCodeMeta,
          currencyCode.isAcceptableOrUnknown(
              data['currency_code']!, _currencyCodeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_activity_at')) {
      context.handle(
          _lastActivityAtMeta,
          lastActivityAt.isAcceptableOrUnknown(
              data['last_activity_at']!, _lastActivityAtMeta));
    } else if (isInserting) {
      context.missing(_lastActivityAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      businessType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_type'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      isHeadOffice: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_head_office'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      dbFilename: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}db_filename'])!,
      fiscalYearLabel: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}fiscal_year_label'])!,
      fiscalYearStartMonth: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}fiscal_year_start_month'])!,
      currencyCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_code'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastActivityAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_activity_at'])!,
    );
  }

  @override
  $BusinessesTable createAlias(String alias) {
    return $BusinessesTable(attachedDatabase, alias);
  }
}

class BusinessesData extends DataClass implements Insertable<BusinessesData> {
  final String id;
  final String name;
  final String businessType;
  final String location;
  final bool isHeadOffice;
  final String status;
  final String dbFilename;
  final String fiscalYearLabel;
  final int fiscalYearStartMonth;
  final String currencyCode;
  final DateTime createdAt;
  final DateTime lastActivityAt;
  const BusinessesData(
      {required this.id,
      required this.name,
      required this.businessType,
      required this.location,
      required this.isHeadOffice,
      required this.status,
      required this.dbFilename,
      required this.fiscalYearLabel,
      required this.fiscalYearStartMonth,
      required this.currencyCode,
      required this.createdAt,
      required this.lastActivityAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['business_type'] = Variable<String>(businessType);
    map['location'] = Variable<String>(location);
    map['is_head_office'] = Variable<bool>(isHeadOffice);
    map['status'] = Variable<String>(status);
    map['db_filename'] = Variable<String>(dbFilename);
    map['fiscal_year_label'] = Variable<String>(fiscalYearLabel);
    map['fiscal_year_start_month'] = Variable<int>(fiscalYearStartMonth);
    map['currency_code'] = Variable<String>(currencyCode);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['last_activity_at'] = Variable<DateTime>(lastActivityAt);
    return map;
  }

  BusinessesCompanion toCompanion(bool nullToAbsent) {
    return BusinessesCompanion(
      id: Value(id),
      name: Value(name),
      businessType: Value(businessType),
      location: Value(location),
      isHeadOffice: Value(isHeadOffice),
      status: Value(status),
      dbFilename: Value(dbFilename),
      fiscalYearLabel: Value(fiscalYearLabel),
      fiscalYearStartMonth: Value(fiscalYearStartMonth),
      currencyCode: Value(currencyCode),
      createdAt: Value(createdAt),
      lastActivityAt: Value(lastActivityAt),
    );
  }

  factory BusinessesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessesData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      businessType: serializer.fromJson<String>(json['businessType']),
      location: serializer.fromJson<String>(json['location']),
      isHeadOffice: serializer.fromJson<bool>(json['isHeadOffice']),
      status: serializer.fromJson<String>(json['status']),
      dbFilename: serializer.fromJson<String>(json['dbFilename']),
      fiscalYearLabel: serializer.fromJson<String>(json['fiscalYearLabel']),
      fiscalYearStartMonth:
          serializer.fromJson<int>(json['fiscalYearStartMonth']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastActivityAt: serializer.fromJson<DateTime>(json['lastActivityAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'businessType': serializer.toJson<String>(businessType),
      'location': serializer.toJson<String>(location),
      'isHeadOffice': serializer.toJson<bool>(isHeadOffice),
      'status': serializer.toJson<String>(status),
      'dbFilename': serializer.toJson<String>(dbFilename),
      'fiscalYearLabel': serializer.toJson<String>(fiscalYearLabel),
      'fiscalYearStartMonth': serializer.toJson<int>(fiscalYearStartMonth),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastActivityAt': serializer.toJson<DateTime>(lastActivityAt),
    };
  }

  BusinessesData copyWith(
          {String? id,
          String? name,
          String? businessType,
          String? location,
          bool? isHeadOffice,
          String? status,
          String? dbFilename,
          String? fiscalYearLabel,
          int? fiscalYearStartMonth,
          String? currencyCode,
          DateTime? createdAt,
          DateTime? lastActivityAt}) =>
      BusinessesData(
        id: id ?? this.id,
        name: name ?? this.name,
        businessType: businessType ?? this.businessType,
        location: location ?? this.location,
        isHeadOffice: isHeadOffice ?? this.isHeadOffice,
        status: status ?? this.status,
        dbFilename: dbFilename ?? this.dbFilename,
        fiscalYearLabel: fiscalYearLabel ?? this.fiscalYearLabel,
        fiscalYearStartMonth: fiscalYearStartMonth ?? this.fiscalYearStartMonth,
        currencyCode: currencyCode ?? this.currencyCode,
        createdAt: createdAt ?? this.createdAt,
        lastActivityAt: lastActivityAt ?? this.lastActivityAt,
      );
  BusinessesData copyWithCompanion(BusinessesCompanion data) {
    return BusinessesData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      businessType: data.businessType.present
          ? data.businessType.value
          : this.businessType,
      location: data.location.present ? data.location.value : this.location,
      isHeadOffice: data.isHeadOffice.present
          ? data.isHeadOffice.value
          : this.isHeadOffice,
      status: data.status.present ? data.status.value : this.status,
      dbFilename:
          data.dbFilename.present ? data.dbFilename.value : this.dbFilename,
      fiscalYearLabel: data.fiscalYearLabel.present
          ? data.fiscalYearLabel.value
          : this.fiscalYearLabel,
      fiscalYearStartMonth: data.fiscalYearStartMonth.present
          ? data.fiscalYearStartMonth.value
          : this.fiscalYearStartMonth,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastActivityAt: data.lastActivityAt.present
          ? data.lastActivityAt.value
          : this.lastActivityAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessType: $businessType, ')
          ..write('location: $location, ')
          ..write('isHeadOffice: $isHeadOffice, ')
          ..write('status: $status, ')
          ..write('dbFilename: $dbFilename, ')
          ..write('fiscalYearLabel: $fiscalYearLabel, ')
          ..write('fiscalYearStartMonth: $fiscalYearStartMonth, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastActivityAt: $lastActivityAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      businessType,
      location,
      isHeadOffice,
      status,
      dbFilename,
      fiscalYearLabel,
      fiscalYearStartMonth,
      currencyCode,
      createdAt,
      lastActivityAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessesData &&
          other.id == this.id &&
          other.name == this.name &&
          other.businessType == this.businessType &&
          other.location == this.location &&
          other.isHeadOffice == this.isHeadOffice &&
          other.status == this.status &&
          other.dbFilename == this.dbFilename &&
          other.fiscalYearLabel == this.fiscalYearLabel &&
          other.fiscalYearStartMonth == this.fiscalYearStartMonth &&
          other.currencyCode == this.currencyCode &&
          other.createdAt == this.createdAt &&
          other.lastActivityAt == this.lastActivityAt);
}

class BusinessesCompanion extends UpdateCompanion<BusinessesData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> businessType;
  final Value<String> location;
  final Value<bool> isHeadOffice;
  final Value<String> status;
  final Value<String> dbFilename;
  final Value<String> fiscalYearLabel;
  final Value<int> fiscalYearStartMonth;
  final Value<String> currencyCode;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastActivityAt;
  final Value<int> rowid;
  const BusinessesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.businessType = const Value.absent(),
    this.location = const Value.absent(),
    this.isHeadOffice = const Value.absent(),
    this.status = const Value.absent(),
    this.dbFilename = const Value.absent(),
    this.fiscalYearLabel = const Value.absent(),
    this.fiscalYearStartMonth = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastActivityAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessesCompanion.insert({
    required String id,
    required String name,
    required String businessType,
    required String location,
    this.isHeadOffice = const Value.absent(),
    this.status = const Value.absent(),
    required String dbFilename,
    required String fiscalYearLabel,
    this.fiscalYearStartMonth = const Value.absent(),
    this.currencyCode = const Value.absent(),
    required DateTime createdAt,
    required DateTime lastActivityAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        businessType = Value(businessType),
        location = Value(location),
        dbFilename = Value(dbFilename),
        fiscalYearLabel = Value(fiscalYearLabel),
        createdAt = Value(createdAt),
        lastActivityAt = Value(lastActivityAt);
  static Insertable<BusinessesData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? businessType,
    Expression<String>? location,
    Expression<bool>? isHeadOffice,
    Expression<String>? status,
    Expression<String>? dbFilename,
    Expression<String>? fiscalYearLabel,
    Expression<int>? fiscalYearStartMonth,
    Expression<String>? currencyCode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastActivityAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (businessType != null) 'business_type': businessType,
      if (location != null) 'location': location,
      if (isHeadOffice != null) 'is_head_office': isHeadOffice,
      if (status != null) 'status': status,
      if (dbFilename != null) 'db_filename': dbFilename,
      if (fiscalYearLabel != null) 'fiscal_year_label': fiscalYearLabel,
      if (fiscalYearStartMonth != null)
        'fiscal_year_start_month': fiscalYearStartMonth,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (createdAt != null) 'created_at': createdAt,
      if (lastActivityAt != null) 'last_activity_at': lastActivityAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? businessType,
      Value<String>? location,
      Value<bool>? isHeadOffice,
      Value<String>? status,
      Value<String>? dbFilename,
      Value<String>? fiscalYearLabel,
      Value<int>? fiscalYearStartMonth,
      Value<String>? currencyCode,
      Value<DateTime>? createdAt,
      Value<DateTime>? lastActivityAt,
      Value<int>? rowid}) {
    return BusinessesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      businessType: businessType ?? this.businessType,
      location: location ?? this.location,
      isHeadOffice: isHeadOffice ?? this.isHeadOffice,
      status: status ?? this.status,
      dbFilename: dbFilename ?? this.dbFilename,
      fiscalYearLabel: fiscalYearLabel ?? this.fiscalYearLabel,
      fiscalYearStartMonth: fiscalYearStartMonth ?? this.fiscalYearStartMonth,
      currencyCode: currencyCode ?? this.currencyCode,
      createdAt: createdAt ?? this.createdAt,
      lastActivityAt: lastActivityAt ?? this.lastActivityAt,
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
    if (businessType.present) {
      map['business_type'] = Variable<String>(businessType.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isHeadOffice.present) {
      map['is_head_office'] = Variable<bool>(isHeadOffice.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dbFilename.present) {
      map['db_filename'] = Variable<String>(dbFilename.value);
    }
    if (fiscalYearLabel.present) {
      map['fiscal_year_label'] = Variable<String>(fiscalYearLabel.value);
    }
    if (fiscalYearStartMonth.present) {
      map['fiscal_year_start_month'] =
          Variable<int>(fiscalYearStartMonth.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastActivityAt.present) {
      map['last_activity_at'] = Variable<DateTime>(lastActivityAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessType: $businessType, ')
          ..write('location: $location, ')
          ..write('isHeadOffice: $isHeadOffice, ')
          ..write('status: $status, ')
          ..write('dbFilename: $dbFilename, ')
          ..write('fiscalYearLabel: $fiscalYearLabel, ')
          ..write('fiscalYearStartMonth: $fiscalYearStartMonth, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastActivityAt: $lastActivityAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSuperAdminMeta =
      const VerificationMeta('isSuperAdmin');
  @override
  late final GeneratedColumn<bool> isSuperAdmin = GeneratedColumn<bool>(
      'is_super_admin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_super_admin" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _lastLoginAtMeta =
      const VerificationMeta('lastLoginAt');
  @override
  late final GeneratedColumn<DateTime> lastLoginAt = GeneratedColumn<DateTime>(
      'last_login_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        email,
        passwordHash,
        fullName,
        isSuperAdmin,
        status,
        lastLoginAt,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('is_super_admin')) {
      context.handle(
          _isSuperAdminMeta,
          isSuperAdmin.isAcceptableOrUnknown(
              data['is_super_admin']!, _isSuperAdminMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('last_login_at')) {
      context.handle(
          _lastLoginAtMeta,
          lastLoginAt.isAcceptableOrUnknown(
              data['last_login_at']!, _lastLoginAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      isSuperAdmin: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_super_admin'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      lastLoginAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String username;
  final String? email;
  final String passwordHash;
  final String fullName;
  final bool isSuperAdmin;
  final String status;
  final DateTime? lastLoginAt;
  final DateTime createdAt;
  const User(
      {required this.id,
      required this.username,
      this.email,
      required this.passwordHash,
      required this.fullName,
      required this.isSuperAdmin,
      required this.status,
      this.lastLoginAt,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['password_hash'] = Variable<String>(passwordHash);
    map['full_name'] = Variable<String>(fullName);
    map['is_super_admin'] = Variable<bool>(isSuperAdmin);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || lastLoginAt != null) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      passwordHash: Value(passwordHash),
      fullName: Value(fullName),
      isSuperAdmin: Value(isSuperAdmin),
      status: Value(status),
      lastLoginAt: lastLoginAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLoginAt),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String?>(json['email']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      fullName: serializer.fromJson<String>(json['fullName']),
      isSuperAdmin: serializer.fromJson<bool>(json['isSuperAdmin']),
      status: serializer.fromJson<String>(json['status']),
      lastLoginAt: serializer.fromJson<DateTime?>(json['lastLoginAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String?>(email),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'fullName': serializer.toJson<String>(fullName),
      'isSuperAdmin': serializer.toJson<bool>(isSuperAdmin),
      'status': serializer.toJson<String>(status),
      'lastLoginAt': serializer.toJson<DateTime?>(lastLoginAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith(
          {String? id,
          String? username,
          Value<String?> email = const Value.absent(),
          String? passwordHash,
          String? fullName,
          bool? isSuperAdmin,
          String? status,
          Value<DateTime?> lastLoginAt = const Value.absent(),
          DateTime? createdAt}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email.present ? email.value : this.email,
        passwordHash: passwordHash ?? this.passwordHash,
        fullName: fullName ?? this.fullName,
        isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
        status: status ?? this.status,
        lastLoginAt: lastLoginAt.present ? lastLoginAt.value : this.lastLoginAt,
        createdAt: createdAt ?? this.createdAt,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      isSuperAdmin: data.isSuperAdmin.present
          ? data.isSuperAdmin.value
          : this.isSuperAdmin,
      status: data.status.present ? data.status.value : this.status,
      lastLoginAt:
          data.lastLoginAt.present ? data.lastLoginAt.value : this.lastLoginAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('fullName: $fullName, ')
          ..write('isSuperAdmin: $isSuperAdmin, ')
          ..write('status: $status, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, email, passwordHash, fullName,
      isSuperAdmin, status, lastLoginAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.passwordHash == this.passwordHash &&
          other.fullName == this.fullName &&
          other.isSuperAdmin == this.isSuperAdmin &&
          other.status == this.status &&
          other.lastLoginAt == this.lastLoginAt &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> username;
  final Value<String?> email;
  final Value<String> passwordHash;
  final Value<String> fullName;
  final Value<bool> isSuperAdmin;
  final Value<String> status;
  final Value<DateTime?> lastLoginAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.fullName = const Value.absent(),
    this.isSuperAdmin = const Value.absent(),
    this.status = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String username,
    this.email = const Value.absent(),
    required String passwordHash,
    required String fullName,
    this.isSuperAdmin = const Value.absent(),
    this.status = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        username = Value(username),
        passwordHash = Value(passwordHash),
        fullName = Value(fullName),
        createdAt = Value(createdAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? passwordHash,
    Expression<String>? fullName,
    Expression<bool>? isSuperAdmin,
    Expression<String>? status,
    Expression<DateTime>? lastLoginAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (fullName != null) 'full_name': fullName,
      if (isSuperAdmin != null) 'is_super_admin': isSuperAdmin,
      if (status != null) 'status': status,
      if (lastLoginAt != null) 'last_login_at': lastLoginAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? username,
      Value<String?>? email,
      Value<String>? passwordHash,
      Value<String>? fullName,
      Value<bool>? isSuperAdmin,
      Value<String>? status,
      Value<DateTime?>? lastLoginAt,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      fullName: fullName ?? this.fullName,
      isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      status: status ?? this.status,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (isSuperAdmin.present) {
      map['is_super_admin'] = Variable<bool>(isSuperAdmin.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (lastLoginAt.present) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('fullName: $fullName, ')
          ..write('isSuperAdmin: $isSuperAdmin, ')
          ..write('status: $status, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RolesTable extends Roles with TableInfo<$RolesTable, Role> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<Role> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Role(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $RolesTable createAlias(String alias) {
    return $RolesTable(attachedDatabase, alias);
  }
}

class Role extends DataClass implements Insertable<Role> {
  final String id;
  final String name;
  const Role({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Role.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Role(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Role copyWith({String? id, String? name}) => Role(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Role copyWithCompanion(RolesCompanion data) {
    return Role(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Role(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Role && other.id == this.id && other.name == this.name);
}

class RolesCompanion extends UpdateCompanion<Role> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const RolesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RolesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Role> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RolesCompanion copyWith(
      {Value<String>? id, Value<String>? name, Value<int>? rowid}) {
    return RolesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserBusinessRolesTable extends UserBusinessRoles
    with TableInfo<$UserBusinessRolesTable, UserBusinessRole> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserBusinessRolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _businessIdMeta =
      const VerificationMeta('businessId');
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
      'business_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<String> roleId = GeneratedColumn<String>(
      'role_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessLevelMeta =
      const VerificationMeta('accessLevel');
  @override
  late final GeneratedColumn<String> accessLevel = GeneratedColumn<String>(
      'access_level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, businessId, roleId, accessLevel, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_business_roles';
  @override
  VerificationContext validateIntegrity(Insertable<UserBusinessRole> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
          _businessIdMeta,
          businessId.isAcceptableOrUnknown(
              data['business_id']!, _businessIdMeta));
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('access_level')) {
      context.handle(
          _accessLevelMeta,
          accessLevel.isAcceptableOrUnknown(
              data['access_level']!, _accessLevelMeta));
    } else if (isInserting) {
      context.missing(_accessLevelMeta);
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
  UserBusinessRole map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserBusinessRole(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      businessId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_id'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_id'])!,
      accessLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access_level'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $UserBusinessRolesTable createAlias(String alias) {
    return $UserBusinessRolesTable(attachedDatabase, alias);
  }
}

class UserBusinessRole extends DataClass
    implements Insertable<UserBusinessRole> {
  final String id;
  final String userId;
  final String businessId;
  final String roleId;
  final String accessLevel;
  final String status;
  const UserBusinessRole(
      {required this.id,
      required this.userId,
      required this.businessId,
      required this.roleId,
      required this.accessLevel,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['business_id'] = Variable<String>(businessId);
    map['role_id'] = Variable<String>(roleId);
    map['access_level'] = Variable<String>(accessLevel);
    map['status'] = Variable<String>(status);
    return map;
  }

  UserBusinessRolesCompanion toCompanion(bool nullToAbsent) {
    return UserBusinessRolesCompanion(
      id: Value(id),
      userId: Value(userId),
      businessId: Value(businessId),
      roleId: Value(roleId),
      accessLevel: Value(accessLevel),
      status: Value(status),
    );
  }

  factory UserBusinessRole.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserBusinessRole(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      businessId: serializer.fromJson<String>(json['businessId']),
      roleId: serializer.fromJson<String>(json['roleId']),
      accessLevel: serializer.fromJson<String>(json['accessLevel']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'businessId': serializer.toJson<String>(businessId),
      'roleId': serializer.toJson<String>(roleId),
      'accessLevel': serializer.toJson<String>(accessLevel),
      'status': serializer.toJson<String>(status),
    };
  }

  UserBusinessRole copyWith(
          {String? id,
          String? userId,
          String? businessId,
          String? roleId,
          String? accessLevel,
          String? status}) =>
      UserBusinessRole(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        businessId: businessId ?? this.businessId,
        roleId: roleId ?? this.roleId,
        accessLevel: accessLevel ?? this.accessLevel,
        status: status ?? this.status,
      );
  UserBusinessRole copyWithCompanion(UserBusinessRolesCompanion data) {
    return UserBusinessRole(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      businessId:
          data.businessId.present ? data.businessId.value : this.businessId,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      accessLevel:
          data.accessLevel.present ? data.accessLevel.value : this.accessLevel,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserBusinessRole(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('businessId: $businessId, ')
          ..write('roleId: $roleId, ')
          ..write('accessLevel: $accessLevel, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, businessId, roleId, accessLevel, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserBusinessRole &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.businessId == this.businessId &&
          other.roleId == this.roleId &&
          other.accessLevel == this.accessLevel &&
          other.status == this.status);
}

class UserBusinessRolesCompanion extends UpdateCompanion<UserBusinessRole> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> businessId;
  final Value<String> roleId;
  final Value<String> accessLevel;
  final Value<String> status;
  final Value<int> rowid;
  const UserBusinessRolesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.businessId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.accessLevel = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserBusinessRolesCompanion.insert({
    required String id,
    required String userId,
    required String businessId,
    required String roleId,
    required String accessLevel,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        businessId = Value(businessId),
        roleId = Value(roleId),
        accessLevel = Value(accessLevel);
  static Insertable<UserBusinessRole> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? businessId,
    Expression<String>? roleId,
    Expression<String>? accessLevel,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (businessId != null) 'business_id': businessId,
      if (roleId != null) 'role_id': roleId,
      if (accessLevel != null) 'access_level': accessLevel,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserBusinessRolesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? businessId,
      Value<String>? roleId,
      Value<String>? accessLevel,
      Value<String>? status,
      Value<int>? rowid}) {
    return UserBusinessRolesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      businessId: businessId ?? this.businessId,
      roleId: roleId ?? this.roleId,
      accessLevel: accessLevel ?? this.accessLevel,
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
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<String>(roleId.value);
    }
    if (accessLevel.present) {
      map['access_level'] = Variable<String>(accessLevel.value);
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
    return (StringBuffer('UserBusinessRolesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('businessId: $businessId, ')
          ..write('roleId: $roleId, ')
          ..write('accessLevel: $accessLevel, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PermissionsMatrixTable extends PermissionsMatrix
    with TableInfo<$PermissionsMatrixTable, PermissionsMatrixData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PermissionsMatrixTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<String> roleId = GeneratedColumn<String>(
      'role_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moduleMeta = const VerificationMeta('module');
  @override
  late final GeneratedColumn<String> module = GeneratedColumn<String>(
      'module', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessMeta = const VerificationMeta('access');
  @override
  late final GeneratedColumn<String> access = GeneratedColumn<String>(
      'access', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, roleId, module, access];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'permissions_matrix';
  @override
  VerificationContext validateIntegrity(
      Insertable<PermissionsMatrixData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('module')) {
      context.handle(_moduleMeta,
          module.isAcceptableOrUnknown(data['module']!, _moduleMeta));
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('access')) {
      context.handle(_accessMeta,
          access.isAcceptableOrUnknown(data['access']!, _accessMeta));
    } else if (isInserting) {
      context.missing(_accessMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PermissionsMatrixData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PermissionsMatrixData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_id'])!,
      module: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}module'])!,
      access: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access'])!,
    );
  }

  @override
  $PermissionsMatrixTable createAlias(String alias) {
    return $PermissionsMatrixTable(attachedDatabase, alias);
  }
}

class PermissionsMatrixData extends DataClass
    implements Insertable<PermissionsMatrixData> {
  final String id;
  final String roleId;
  final String module;
  final String access;
  const PermissionsMatrixData(
      {required this.id,
      required this.roleId,
      required this.module,
      required this.access});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['role_id'] = Variable<String>(roleId);
    map['module'] = Variable<String>(module);
    map['access'] = Variable<String>(access);
    return map;
  }

  PermissionsMatrixCompanion toCompanion(bool nullToAbsent) {
    return PermissionsMatrixCompanion(
      id: Value(id),
      roleId: Value(roleId),
      module: Value(module),
      access: Value(access),
    );
  }

  factory PermissionsMatrixData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PermissionsMatrixData(
      id: serializer.fromJson<String>(json['id']),
      roleId: serializer.fromJson<String>(json['roleId']),
      module: serializer.fromJson<String>(json['module']),
      access: serializer.fromJson<String>(json['access']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roleId': serializer.toJson<String>(roleId),
      'module': serializer.toJson<String>(module),
      'access': serializer.toJson<String>(access),
    };
  }

  PermissionsMatrixData copyWith(
          {String? id, String? roleId, String? module, String? access}) =>
      PermissionsMatrixData(
        id: id ?? this.id,
        roleId: roleId ?? this.roleId,
        module: module ?? this.module,
        access: access ?? this.access,
      );
  PermissionsMatrixData copyWithCompanion(PermissionsMatrixCompanion data) {
    return PermissionsMatrixData(
      id: data.id.present ? data.id.value : this.id,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      module: data.module.present ? data.module.value : this.module,
      access: data.access.present ? data.access.value : this.access,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsMatrixData(')
          ..write('id: $id, ')
          ..write('roleId: $roleId, ')
          ..write('module: $module, ')
          ..write('access: $access')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roleId, module, access);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PermissionsMatrixData &&
          other.id == this.id &&
          other.roleId == this.roleId &&
          other.module == this.module &&
          other.access == this.access);
}

class PermissionsMatrixCompanion
    extends UpdateCompanion<PermissionsMatrixData> {
  final Value<String> id;
  final Value<String> roleId;
  final Value<String> module;
  final Value<String> access;
  final Value<int> rowid;
  const PermissionsMatrixCompanion({
    this.id = const Value.absent(),
    this.roleId = const Value.absent(),
    this.module = const Value.absent(),
    this.access = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PermissionsMatrixCompanion.insert({
    required String id,
    required String roleId,
    required String module,
    required String access,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        roleId = Value(roleId),
        module = Value(module),
        access = Value(access);
  static Insertable<PermissionsMatrixData> custom({
    Expression<String>? id,
    Expression<String>? roleId,
    Expression<String>? module,
    Expression<String>? access,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roleId != null) 'role_id': roleId,
      if (module != null) 'module': module,
      if (access != null) 'access': access,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PermissionsMatrixCompanion copyWith(
      {Value<String>? id,
      Value<String>? roleId,
      Value<String>? module,
      Value<String>? access,
      Value<int>? rowid}) {
    return PermissionsMatrixCompanion(
      id: id ?? this.id,
      roleId: roleId ?? this.roleId,
      module: module ?? this.module,
      access: access ?? this.access,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<String>(roleId.value);
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (access.present) {
      map['access'] = Variable<String>(access.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsMatrixCompanion(')
          ..write('id: $id, ')
          ..write('roleId: $roleId, ')
          ..write('module: $module, ')
          ..write('access: $access, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccessRequestsTable extends AccessRequests
    with TableInfo<$AccessRequestsTable, AccessRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccessRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requestedByUserIdMeta =
      const VerificationMeta('requestedByUserId');
  @override
  late final GeneratedColumn<String> requestedByUserId =
      GeneratedColumn<String>('requested_by_user_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _businessIdMeta =
      const VerificationMeta('businessId');
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
      'business_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessChangeDescriptionMeta =
      const VerificationMeta('accessChangeDescription');
  @override
  late final GeneratedColumn<String> accessChangeDescription =
      GeneratedColumn<String>('access_change_description', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _requestedAtMeta =
      const VerificationMeta('requestedAt');
  @override
  late final GeneratedColumn<DateTime> requestedAt = GeneratedColumn<DateTime>(
      'requested_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _resolvedAtMeta =
      const VerificationMeta('resolvedAt');
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
      'resolved_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        requestedByUserId,
        businessId,
        accessChangeDescription,
        status,
        requestedAt,
        resolvedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'access_requests';
  @override
  VerificationContext validateIntegrity(Insertable<AccessRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('requested_by_user_id')) {
      context.handle(
          _requestedByUserIdMeta,
          requestedByUserId.isAcceptableOrUnknown(
              data['requested_by_user_id']!, _requestedByUserIdMeta));
    } else if (isInserting) {
      context.missing(_requestedByUserIdMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
          _businessIdMeta,
          businessId.isAcceptableOrUnknown(
              data['business_id']!, _businessIdMeta));
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('access_change_description')) {
      context.handle(
          _accessChangeDescriptionMeta,
          accessChangeDescription.isAcceptableOrUnknown(
              data['access_change_description']!,
              _accessChangeDescriptionMeta));
    } else if (isInserting) {
      context.missing(_accessChangeDescriptionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('requested_at')) {
      context.handle(
          _requestedAtMeta,
          requestedAt.isAcceptableOrUnknown(
              data['requested_at']!, _requestedAtMeta));
    } else if (isInserting) {
      context.missing(_requestedAtMeta);
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
          _resolvedAtMeta,
          resolvedAt.isAcceptableOrUnknown(
              data['resolved_at']!, _resolvedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccessRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccessRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      requestedByUserId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}requested_by_user_id'])!,
      businessId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_id'])!,
      accessChangeDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}access_change_description'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      requestedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}requested_at'])!,
      resolvedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}resolved_at']),
    );
  }

  @override
  $AccessRequestsTable createAlias(String alias) {
    return $AccessRequestsTable(attachedDatabase, alias);
  }
}

class AccessRequest extends DataClass implements Insertable<AccessRequest> {
  final String id;
  final String userId;
  final String requestedByUserId;
  final String businessId;
  final String accessChangeDescription;
  final String status;
  final DateTime requestedAt;
  final DateTime? resolvedAt;
  const AccessRequest(
      {required this.id,
      required this.userId,
      required this.requestedByUserId,
      required this.businessId,
      required this.accessChangeDescription,
      required this.status,
      required this.requestedAt,
      this.resolvedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['requested_by_user_id'] = Variable<String>(requestedByUserId);
    map['business_id'] = Variable<String>(businessId);
    map['access_change_description'] =
        Variable<String>(accessChangeDescription);
    map['status'] = Variable<String>(status);
    map['requested_at'] = Variable<DateTime>(requestedAt);
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    return map;
  }

  AccessRequestsCompanion toCompanion(bool nullToAbsent) {
    return AccessRequestsCompanion(
      id: Value(id),
      userId: Value(userId),
      requestedByUserId: Value(requestedByUserId),
      businessId: Value(businessId),
      accessChangeDescription: Value(accessChangeDescription),
      status: Value(status),
      requestedAt: Value(requestedAt),
      resolvedAt: resolvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedAt),
    );
  }

  factory AccessRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccessRequest(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      requestedByUserId: serializer.fromJson<String>(json['requestedByUserId']),
      businessId: serializer.fromJson<String>(json['businessId']),
      accessChangeDescription:
          serializer.fromJson<String>(json['accessChangeDescription']),
      status: serializer.fromJson<String>(json['status']),
      requestedAt: serializer.fromJson<DateTime>(json['requestedAt']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolvedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'requestedByUserId': serializer.toJson<String>(requestedByUserId),
      'businessId': serializer.toJson<String>(businessId),
      'accessChangeDescription':
          serializer.toJson<String>(accessChangeDescription),
      'status': serializer.toJson<String>(status),
      'requestedAt': serializer.toJson<DateTime>(requestedAt),
      'resolvedAt': serializer.toJson<DateTime?>(resolvedAt),
    };
  }

  AccessRequest copyWith(
          {String? id,
          String? userId,
          String? requestedByUserId,
          String? businessId,
          String? accessChangeDescription,
          String? status,
          DateTime? requestedAt,
          Value<DateTime?> resolvedAt = const Value.absent()}) =>
      AccessRequest(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        requestedByUserId: requestedByUserId ?? this.requestedByUserId,
        businessId: businessId ?? this.businessId,
        accessChangeDescription:
            accessChangeDescription ?? this.accessChangeDescription,
        status: status ?? this.status,
        requestedAt: requestedAt ?? this.requestedAt,
        resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
      );
  AccessRequest copyWithCompanion(AccessRequestsCompanion data) {
    return AccessRequest(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      requestedByUserId: data.requestedByUserId.present
          ? data.requestedByUserId.value
          : this.requestedByUserId,
      businessId:
          data.businessId.present ? data.businessId.value : this.businessId,
      accessChangeDescription: data.accessChangeDescription.present
          ? data.accessChangeDescription.value
          : this.accessChangeDescription,
      status: data.status.present ? data.status.value : this.status,
      requestedAt:
          data.requestedAt.present ? data.requestedAt.value : this.requestedAt,
      resolvedAt:
          data.resolvedAt.present ? data.resolvedAt.value : this.resolvedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccessRequest(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('requestedByUserId: $requestedByUserId, ')
          ..write('businessId: $businessId, ')
          ..write('accessChangeDescription: $accessChangeDescription, ')
          ..write('status: $status, ')
          ..write('requestedAt: $requestedAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, requestedByUserId, businessId,
      accessChangeDescription, status, requestedAt, resolvedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccessRequest &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.requestedByUserId == this.requestedByUserId &&
          other.businessId == this.businessId &&
          other.accessChangeDescription == this.accessChangeDescription &&
          other.status == this.status &&
          other.requestedAt == this.requestedAt &&
          other.resolvedAt == this.resolvedAt);
}

class AccessRequestsCompanion extends UpdateCompanion<AccessRequest> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> requestedByUserId;
  final Value<String> businessId;
  final Value<String> accessChangeDescription;
  final Value<String> status;
  final Value<DateTime> requestedAt;
  final Value<DateTime?> resolvedAt;
  final Value<int> rowid;
  const AccessRequestsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.requestedByUserId = const Value.absent(),
    this.businessId = const Value.absent(),
    this.accessChangeDescription = const Value.absent(),
    this.status = const Value.absent(),
    this.requestedAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccessRequestsCompanion.insert({
    required String id,
    required String userId,
    required String requestedByUserId,
    required String businessId,
    required String accessChangeDescription,
    this.status = const Value.absent(),
    required DateTime requestedAt,
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        requestedByUserId = Value(requestedByUserId),
        businessId = Value(businessId),
        accessChangeDescription = Value(accessChangeDescription),
        requestedAt = Value(requestedAt);
  static Insertable<AccessRequest> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? requestedByUserId,
    Expression<String>? businessId,
    Expression<String>? accessChangeDescription,
    Expression<String>? status,
    Expression<DateTime>? requestedAt,
    Expression<DateTime>? resolvedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (requestedByUserId != null) 'requested_by_user_id': requestedByUserId,
      if (businessId != null) 'business_id': businessId,
      if (accessChangeDescription != null)
        'access_change_description': accessChangeDescription,
      if (status != null) 'status': status,
      if (requestedAt != null) 'requested_at': requestedAt,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccessRequestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? requestedByUserId,
      Value<String>? businessId,
      Value<String>? accessChangeDescription,
      Value<String>? status,
      Value<DateTime>? requestedAt,
      Value<DateTime?>? resolvedAt,
      Value<int>? rowid}) {
    return AccessRequestsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      requestedByUserId: requestedByUserId ?? this.requestedByUserId,
      businessId: businessId ?? this.businessId,
      accessChangeDescription:
          accessChangeDescription ?? this.accessChangeDescription,
      status: status ?? this.status,
      requestedAt: requestedAt ?? this.requestedAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (requestedByUserId.present) {
      map['requested_by_user_id'] = Variable<String>(requestedByUserId.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (accessChangeDescription.present) {
      map['access_change_description'] =
          Variable<String>(accessChangeDescription.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (requestedAt.present) {
      map['requested_at'] = Variable<DateTime>(requestedAt.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccessRequestsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('requestedByUserId: $requestedByUserId, ')
          ..write('businessId: $businessId, ')
          ..write('accessChangeDescription: $accessChangeDescription, ')
          ..write('status: $status, ')
          ..write('requestedAt: $requestedAt, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  const AppSetting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({String? key, String? value}) => AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupLogTable extends BackupLog
    with TableInfo<$BackupLogTable, BackupLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _businessIdMeta =
      const VerificationMeta('businessId');
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
      'business_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationPathMeta =
      const VerificationMeta('locationPath');
  @override
  late final GeneratedColumn<String> locationPath = GeneratedColumn<String>(
      'location_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _backupTypeMeta =
      const VerificationMeta('backupType');
  @override
  late final GeneratedColumn<String> backupType = GeneratedColumn<String>(
      'backup_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, businessId, startedAt, status, locationPath, sizeBytes, backupType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_log';
  @override
  VerificationContext validateIntegrity(Insertable<BackupLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
          _businessIdMeta,
          businessId.isAcceptableOrUnknown(
              data['business_id']!, _businessIdMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('location_path')) {
      context.handle(
          _locationPathMeta,
          locationPath.isAcceptableOrUnknown(
              data['location_path']!, _locationPathMeta));
    } else if (isInserting) {
      context.missing(_locationPathMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    }
    if (data.containsKey('backup_type')) {
      context.handle(
          _backupTypeMeta,
          backupType.isAcceptableOrUnknown(
              data['backup_type']!, _backupTypeMeta));
    } else if (isInserting) {
      context.missing(_backupTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      businessId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_id']),
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      locationPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_path'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      backupType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backup_type'])!,
    );
  }

  @override
  $BackupLogTable createAlias(String alias) {
    return $BackupLogTable(attachedDatabase, alias);
  }
}

class BackupLogData extends DataClass implements Insertable<BackupLogData> {
  final String id;
  final String? businessId;
  final DateTime startedAt;
  final String status;
  final String locationPath;
  final int sizeBytes;
  final String backupType;
  const BackupLogData(
      {required this.id,
      this.businessId,
      required this.startedAt,
      required this.status,
      required this.locationPath,
      required this.sizeBytes,
      required this.backupType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || businessId != null) {
      map['business_id'] = Variable<String>(businessId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    map['status'] = Variable<String>(status);
    map['location_path'] = Variable<String>(locationPath);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['backup_type'] = Variable<String>(backupType);
    return map;
  }

  BackupLogCompanion toCompanion(bool nullToAbsent) {
    return BackupLogCompanion(
      id: Value(id),
      businessId: businessId == null && nullToAbsent
          ? const Value.absent()
          : Value(businessId),
      startedAt: Value(startedAt),
      status: Value(status),
      locationPath: Value(locationPath),
      sizeBytes: Value(sizeBytes),
      backupType: Value(backupType),
    );
  }

  factory BackupLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupLogData(
      id: serializer.fromJson<String>(json['id']),
      businessId: serializer.fromJson<String?>(json['businessId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      status: serializer.fromJson<String>(json['status']),
      locationPath: serializer.fromJson<String>(json['locationPath']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      backupType: serializer.fromJson<String>(json['backupType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'businessId': serializer.toJson<String?>(businessId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'status': serializer.toJson<String>(status),
      'locationPath': serializer.toJson<String>(locationPath),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'backupType': serializer.toJson<String>(backupType),
    };
  }

  BackupLogData copyWith(
          {String? id,
          Value<String?> businessId = const Value.absent(),
          DateTime? startedAt,
          String? status,
          String? locationPath,
          int? sizeBytes,
          String? backupType}) =>
      BackupLogData(
        id: id ?? this.id,
        businessId: businessId.present ? businessId.value : this.businessId,
        startedAt: startedAt ?? this.startedAt,
        status: status ?? this.status,
        locationPath: locationPath ?? this.locationPath,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        backupType: backupType ?? this.backupType,
      );
  BackupLogData copyWithCompanion(BackupLogCompanion data) {
    return BackupLogData(
      id: data.id.present ? data.id.value : this.id,
      businessId:
          data.businessId.present ? data.businessId.value : this.businessId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      status: data.status.present ? data.status.value : this.status,
      locationPath: data.locationPath.present
          ? data.locationPath.value
          : this.locationPath,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      backupType:
          data.backupType.present ? data.backupType.value : this.backupType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupLogData(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('startedAt: $startedAt, ')
          ..write('status: $status, ')
          ..write('locationPath: $locationPath, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('backupType: $backupType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, businessId, startedAt, status, locationPath, sizeBytes, backupType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupLogData &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.startedAt == this.startedAt &&
          other.status == this.status &&
          other.locationPath == this.locationPath &&
          other.sizeBytes == this.sizeBytes &&
          other.backupType == this.backupType);
}

class BackupLogCompanion extends UpdateCompanion<BackupLogData> {
  final Value<String> id;
  final Value<String?> businessId;
  final Value<DateTime> startedAt;
  final Value<String> status;
  final Value<String> locationPath;
  final Value<int> sizeBytes;
  final Value<String> backupType;
  final Value<int> rowid;
  const BackupLogCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.locationPath = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.backupType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackupLogCompanion.insert({
    required String id,
    this.businessId = const Value.absent(),
    required DateTime startedAt,
    required String status,
    required String locationPath,
    this.sizeBytes = const Value.absent(),
    required String backupType,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        startedAt = Value(startedAt),
        status = Value(status),
        locationPath = Value(locationPath),
        backupType = Value(backupType);
  static Insertable<BackupLogData> custom({
    Expression<String>? id,
    Expression<String>? businessId,
    Expression<DateTime>? startedAt,
    Expression<String>? status,
    Expression<String>? locationPath,
    Expression<int>? sizeBytes,
    Expression<String>? backupType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (startedAt != null) 'started_at': startedAt,
      if (status != null) 'status': status,
      if (locationPath != null) 'location_path': locationPath,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (backupType != null) 'backup_type': backupType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackupLogCompanion copyWith(
      {Value<String>? id,
      Value<String?>? businessId,
      Value<DateTime>? startedAt,
      Value<String>? status,
      Value<String>? locationPath,
      Value<int>? sizeBytes,
      Value<String>? backupType,
      Value<int>? rowid}) {
    return BackupLogCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      startedAt: startedAt ?? this.startedAt,
      status: status ?? this.status,
      locationPath: locationPath ?? this.locationPath,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      backupType: backupType ?? this.backupType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (locationPath.present) {
      map['location_path'] = Variable<String>(locationPath.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (backupType.present) {
      map['backup_type'] = Variable<String>(backupType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupLogCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('startedAt: $startedAt, ')
          ..write('status: $status, ')
          ..write('locationPath: $locationPath, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('backupType: $backupType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppNotificationsTable extends AppNotifications
    with TableInfo<$AppNotificationsTable, AppNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _businessIdMeta =
      const VerificationMeta('businessId');
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
      'business_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
      'severity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moduleMeta = const VerificationMeta('module');
  @override
  late final GeneratedColumn<String> module = GeneratedColumn<String>(
      'module', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  @override
  late final GeneratedColumn<DateTime> readAt = GeneratedColumn<DateTime>(
      'read_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, businessId, severity, message, module, createdAt, readAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<AppNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
          _businessIdMeta,
          businessId.isAcceptableOrUnknown(
              data['business_id']!, _businessIdMeta));
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('module')) {
      context.handle(_moduleMeta,
          module.isAcceptableOrUnknown(data['module']!, _moduleMeta));
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('read_at')) {
      context.handle(_readAtMeta,
          readAt.isAcceptableOrUnknown(data['read_at']!, _readAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppNotification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      businessId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}business_id'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}severity'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      module: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}module'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      readAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}read_at']),
    );
  }

  @override
  $AppNotificationsTable createAlias(String alias) {
    return $AppNotificationsTable(attachedDatabase, alias);
  }
}

class AppNotification extends DataClass implements Insertable<AppNotification> {
  final String id;
  final String businessId;
  final String severity;
  final String message;
  final String module;
  final DateTime createdAt;
  final DateTime? readAt;
  const AppNotification(
      {required this.id,
      required this.businessId,
      required this.severity,
      required this.message,
      required this.module,
      required this.createdAt,
      this.readAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['business_id'] = Variable<String>(businessId);
    map['severity'] = Variable<String>(severity);
    map['message'] = Variable<String>(message);
    map['module'] = Variable<String>(module);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || readAt != null) {
      map['read_at'] = Variable<DateTime>(readAt);
    }
    return map;
  }

  AppNotificationsCompanion toCompanion(bool nullToAbsent) {
    return AppNotificationsCompanion(
      id: Value(id),
      businessId: Value(businessId),
      severity: Value(severity),
      message: Value(message),
      module: Value(module),
      createdAt: Value(createdAt),
      readAt:
          readAt == null && nullToAbsent ? const Value.absent() : Value(readAt),
    );
  }

  factory AppNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppNotification(
      id: serializer.fromJson<String>(json['id']),
      businessId: serializer.fromJson<String>(json['businessId']),
      severity: serializer.fromJson<String>(json['severity']),
      message: serializer.fromJson<String>(json['message']),
      module: serializer.fromJson<String>(json['module']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      readAt: serializer.fromJson<DateTime?>(json['readAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'businessId': serializer.toJson<String>(businessId),
      'severity': serializer.toJson<String>(severity),
      'message': serializer.toJson<String>(message),
      'module': serializer.toJson<String>(module),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'readAt': serializer.toJson<DateTime?>(readAt),
    };
  }

  AppNotification copyWith(
          {String? id,
          String? businessId,
          String? severity,
          String? message,
          String? module,
          DateTime? createdAt,
          Value<DateTime?> readAt = const Value.absent()}) =>
      AppNotification(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        severity: severity ?? this.severity,
        message: message ?? this.message,
        module: module ?? this.module,
        createdAt: createdAt ?? this.createdAt,
        readAt: readAt.present ? readAt.value : this.readAt,
      );
  AppNotification copyWithCompanion(AppNotificationsCompanion data) {
    return AppNotification(
      id: data.id.present ? data.id.value : this.id,
      businessId:
          data.businessId.present ? data.businessId.value : this.businessId,
      severity: data.severity.present ? data.severity.value : this.severity,
      message: data.message.present ? data.message.value : this.message,
      module: data.module.present ? data.module.value : this.module,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      readAt: data.readAt.present ? data.readAt.value : this.readAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppNotification(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('severity: $severity, ')
          ..write('message: $message, ')
          ..write('module: $module, ')
          ..write('createdAt: $createdAt, ')
          ..write('readAt: $readAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, businessId, severity, message, module, createdAt, readAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppNotification &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.severity == this.severity &&
          other.message == this.message &&
          other.module == this.module &&
          other.createdAt == this.createdAt &&
          other.readAt == this.readAt);
}

class AppNotificationsCompanion extends UpdateCompanion<AppNotification> {
  final Value<String> id;
  final Value<String> businessId;
  final Value<String> severity;
  final Value<String> message;
  final Value<String> module;
  final Value<DateTime> createdAt;
  final Value<DateTime?> readAt;
  final Value<int> rowid;
  const AppNotificationsCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.severity = const Value.absent(),
    this.message = const Value.absent(),
    this.module = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.readAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppNotificationsCompanion.insert({
    required String id,
    required String businessId,
    required String severity,
    required String message,
    required String module,
    required DateTime createdAt,
    this.readAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        businessId = Value(businessId),
        severity = Value(severity),
        message = Value(message),
        module = Value(module),
        createdAt = Value(createdAt);
  static Insertable<AppNotification> custom({
    Expression<String>? id,
    Expression<String>? businessId,
    Expression<String>? severity,
    Expression<String>? message,
    Expression<String>? module,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? readAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (severity != null) 'severity': severity,
      if (message != null) 'message': message,
      if (module != null) 'module': module,
      if (createdAt != null) 'created_at': createdAt,
      if (readAt != null) 'read_at': readAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppNotificationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? businessId,
      Value<String>? severity,
      Value<String>? message,
      Value<String>? module,
      Value<DateTime>? createdAt,
      Value<DateTime?>? readAt,
      Value<int>? rowid}) {
    return AppNotificationsCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      severity: severity ?? this.severity,
      message: message ?? this.message,
      module: module ?? this.module,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt ?? this.readAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('severity: $severity, ')
          ..write('message: $message, ')
          ..write('module: $module, ')
          ..write('createdAt: $createdAt, ')
          ..write('readAt: $readAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CoreDatabase extends GeneratedDatabase {
  _$CoreDatabase(QueryExecutor e) : super(e);
  $CoreDatabaseManager get managers => $CoreDatabaseManager(this);
  late final $BusinessesTable businesses = $BusinessesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $RolesTable roles = $RolesTable(this);
  late final $UserBusinessRolesTable userBusinessRoles =
      $UserBusinessRolesTable(this);
  late final $PermissionsMatrixTable permissionsMatrix =
      $PermissionsMatrixTable(this);
  late final $AccessRequestsTable accessRequests = $AccessRequestsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $BackupLogTable backupLog = $BackupLogTable(this);
  late final $AppNotificationsTable appNotifications =
      $AppNotificationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        businesses,
        users,
        roles,
        userBusinessRoles,
        permissionsMatrix,
        accessRequests,
        appSettings,
        backupLog,
        appNotifications
      ];
}

typedef $$BusinessesTableCreateCompanionBuilder = BusinessesCompanion Function({
  required String id,
  required String name,
  required String businessType,
  required String location,
  Value<bool> isHeadOffice,
  Value<String> status,
  required String dbFilename,
  required String fiscalYearLabel,
  Value<int> fiscalYearStartMonth,
  Value<String> currencyCode,
  required DateTime createdAt,
  required DateTime lastActivityAt,
  Value<int> rowid,
});
typedef $$BusinessesTableUpdateCompanionBuilder = BusinessesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> businessType,
  Value<String> location,
  Value<bool> isHeadOffice,
  Value<String> status,
  Value<String> dbFilename,
  Value<String> fiscalYearLabel,
  Value<int> fiscalYearStartMonth,
  Value<String> currencyCode,
  Value<DateTime> createdAt,
  Value<DateTime> lastActivityAt,
  Value<int> rowid,
});

class $$BusinessesTableFilterComposer
    extends Composer<_$CoreDatabase, $BusinessesTable> {
  $$BusinessesTableFilterComposer({
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

  ColumnFilters<String> get businessType => $composableBuilder(
      column: $table.businessType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHeadOffice => $composableBuilder(
      column: $table.isHeadOffice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dbFilename => $composableBuilder(
      column: $table.dbFilename, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fiscalYearLabel => $composableBuilder(
      column: $table.fiscalYearLabel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fiscalYearStartMonth => $composableBuilder(
      column: $table.fiscalYearStartMonth,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt,
      builder: (column) => ColumnFilters(column));
}

class $$BusinessesTableOrderingComposer
    extends Composer<_$CoreDatabase, $BusinessesTable> {
  $$BusinessesTableOrderingComposer({
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

  ColumnOrderings<String> get businessType => $composableBuilder(
      column: $table.businessType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHeadOffice => $composableBuilder(
      column: $table.isHeadOffice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dbFilename => $composableBuilder(
      column: $table.dbFilename, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fiscalYearLabel => $composableBuilder(
      column: $table.fiscalYearLabel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fiscalYearStartMonth => $composableBuilder(
      column: $table.fiscalYearStartMonth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt,
      builder: (column) => ColumnOrderings(column));
}

class $$BusinessesTableAnnotationComposer
    extends Composer<_$CoreDatabase, $BusinessesTable> {
  $$BusinessesTableAnnotationComposer({
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

  GeneratedColumn<String> get businessType => $composableBuilder(
      column: $table.businessType, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get isHeadOffice => $composableBuilder(
      column: $table.isHeadOffice, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get dbFilename => $composableBuilder(
      column: $table.dbFilename, builder: (column) => column);

  GeneratedColumn<String> get fiscalYearLabel => $composableBuilder(
      column: $table.fiscalYearLabel, builder: (column) => column);

  GeneratedColumn<int> get fiscalYearStartMonth => $composableBuilder(
      column: $table.fiscalYearStartMonth, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
      column: $table.currencyCode, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt, builder: (column) => column);
}

class $$BusinessesTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $BusinessesTable,
    BusinessesData,
    $$BusinessesTableFilterComposer,
    $$BusinessesTableOrderingComposer,
    $$BusinessesTableAnnotationComposer,
    $$BusinessesTableCreateCompanionBuilder,
    $$BusinessesTableUpdateCompanionBuilder,
    (
      BusinessesData,
      BaseReferences<_$CoreDatabase, $BusinessesTable, BusinessesData>
    ),
    BusinessesData,
    PrefetchHooks Function()> {
  $$BusinessesTableTableManager(_$CoreDatabase db, $BusinessesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> businessType = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<bool> isHeadOffice = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> dbFilename = const Value.absent(),
            Value<String> fiscalYearLabel = const Value.absent(),
            Value<int> fiscalYearStartMonth = const Value.absent(),
            Value<String> currencyCode = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> lastActivityAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BusinessesCompanion(
            id: id,
            name: name,
            businessType: businessType,
            location: location,
            isHeadOffice: isHeadOffice,
            status: status,
            dbFilename: dbFilename,
            fiscalYearLabel: fiscalYearLabel,
            fiscalYearStartMonth: fiscalYearStartMonth,
            currencyCode: currencyCode,
            createdAt: createdAt,
            lastActivityAt: lastActivityAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String businessType,
            required String location,
            Value<bool> isHeadOffice = const Value.absent(),
            Value<String> status = const Value.absent(),
            required String dbFilename,
            required String fiscalYearLabel,
            Value<int> fiscalYearStartMonth = const Value.absent(),
            Value<String> currencyCode = const Value.absent(),
            required DateTime createdAt,
            required DateTime lastActivityAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BusinessesCompanion.insert(
            id: id,
            name: name,
            businessType: businessType,
            location: location,
            isHeadOffice: isHeadOffice,
            status: status,
            dbFilename: dbFilename,
            fiscalYearLabel: fiscalYearLabel,
            fiscalYearStartMonth: fiscalYearStartMonth,
            currencyCode: currencyCode,
            createdAt: createdAt,
            lastActivityAt: lastActivityAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BusinessesTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $BusinessesTable,
    BusinessesData,
    $$BusinessesTableFilterComposer,
    $$BusinessesTableOrderingComposer,
    $$BusinessesTableAnnotationComposer,
    $$BusinessesTableCreateCompanionBuilder,
    $$BusinessesTableUpdateCompanionBuilder,
    (
      BusinessesData,
      BaseReferences<_$CoreDatabase, $BusinessesTable, BusinessesData>
    ),
    BusinessesData,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String username,
  Value<String?> email,
  required String passwordHash,
  required String fullName,
  Value<bool> isSuperAdmin,
  Value<String> status,
  Value<DateTime?> lastLoginAt,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> username,
  Value<String?> email,
  Value<String> passwordHash,
  Value<String> fullName,
  Value<bool> isSuperAdmin,
  Value<String> status,
  Value<DateTime?> lastLoginAt,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$UsersTableFilterComposer extends Composer<_$CoreDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSuperAdmin => $composableBuilder(
      column: $table.isSuperAdmin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$CoreDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSuperAdmin => $composableBuilder(
      column: $table.isSuperAdmin,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$CoreDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<bool> get isSuperAdmin => $composableBuilder(
      column: $table.isSuperAdmin, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLoginAt => $composableBuilder(
      column: $table.lastLoginAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$CoreDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$CoreDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String> passwordHash = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<bool> isSuperAdmin = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> lastLoginAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            username: username,
            email: email,
            passwordHash: passwordHash,
            fullName: fullName,
            isSuperAdmin: isSuperAdmin,
            status: status,
            lastLoginAt: lastLoginAt,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String username,
            Value<String?> email = const Value.absent(),
            required String passwordHash,
            required String fullName,
            Value<bool> isSuperAdmin = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> lastLoginAt = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            username: username,
            email: email,
            passwordHash: passwordHash,
            fullName: fullName,
            isSuperAdmin: isSuperAdmin,
            status: status,
            lastLoginAt: lastLoginAt,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$CoreDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$RolesTableCreateCompanionBuilder = RolesCompanion Function({
  required String id,
  required String name,
  Value<int> rowid,
});
typedef $$RolesTableUpdateCompanionBuilder = RolesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> rowid,
});

class $$RolesTableFilterComposer extends Composer<_$CoreDatabase, $RolesTable> {
  $$RolesTableFilterComposer({
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
}

class $$RolesTableOrderingComposer
    extends Composer<_$CoreDatabase, $RolesTable> {
  $$RolesTableOrderingComposer({
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
}

class $$RolesTableAnnotationComposer
    extends Composer<_$CoreDatabase, $RolesTable> {
  $$RolesTableAnnotationComposer({
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
}

class $$RolesTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $RolesTable,
    Role,
    $$RolesTableFilterComposer,
    $$RolesTableOrderingComposer,
    $$RolesTableAnnotationComposer,
    $$RolesTableCreateCompanionBuilder,
    $$RolesTableUpdateCompanionBuilder,
    (Role, BaseReferences<_$CoreDatabase, $RolesTable, Role>),
    Role,
    PrefetchHooks Function()> {
  $$RolesTableTableManager(_$CoreDatabase db, $RolesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RolesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RolesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RolesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RolesCompanion(
            id: id,
            name: name,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<int> rowid = const Value.absent(),
          }) =>
              RolesCompanion.insert(
            id: id,
            name: name,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RolesTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $RolesTable,
    Role,
    $$RolesTableFilterComposer,
    $$RolesTableOrderingComposer,
    $$RolesTableAnnotationComposer,
    $$RolesTableCreateCompanionBuilder,
    $$RolesTableUpdateCompanionBuilder,
    (Role, BaseReferences<_$CoreDatabase, $RolesTable, Role>),
    Role,
    PrefetchHooks Function()>;
typedef $$UserBusinessRolesTableCreateCompanionBuilder
    = UserBusinessRolesCompanion Function({
  required String id,
  required String userId,
  required String businessId,
  required String roleId,
  required String accessLevel,
  Value<String> status,
  Value<int> rowid,
});
typedef $$UserBusinessRolesTableUpdateCompanionBuilder
    = UserBusinessRolesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> businessId,
  Value<String> roleId,
  Value<String> accessLevel,
  Value<String> status,
  Value<int> rowid,
});

class $$UserBusinessRolesTableFilterComposer
    extends Composer<_$CoreDatabase, $UserBusinessRolesTable> {
  $$UserBusinessRolesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessLevel => $composableBuilder(
      column: $table.accessLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$UserBusinessRolesTableOrderingComposer
    extends Composer<_$CoreDatabase, $UserBusinessRolesTable> {
  $$UserBusinessRolesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessLevel => $composableBuilder(
      column: $table.accessLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$UserBusinessRolesTableAnnotationComposer
    extends Composer<_$CoreDatabase, $UserBusinessRolesTable> {
  $$UserBusinessRolesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => column);

  GeneratedColumn<String> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);

  GeneratedColumn<String> get accessLevel => $composableBuilder(
      column: $table.accessLevel, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$UserBusinessRolesTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $UserBusinessRolesTable,
    UserBusinessRole,
    $$UserBusinessRolesTableFilterComposer,
    $$UserBusinessRolesTableOrderingComposer,
    $$UserBusinessRolesTableAnnotationComposer,
    $$UserBusinessRolesTableCreateCompanionBuilder,
    $$UserBusinessRolesTableUpdateCompanionBuilder,
    (
      UserBusinessRole,
      BaseReferences<_$CoreDatabase, $UserBusinessRolesTable, UserBusinessRole>
    ),
    UserBusinessRole,
    PrefetchHooks Function()> {
  $$UserBusinessRolesTableTableManager(
      _$CoreDatabase db, $UserBusinessRolesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserBusinessRolesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserBusinessRolesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserBusinessRolesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> businessId = const Value.absent(),
            Value<String> roleId = const Value.absent(),
            Value<String> accessLevel = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserBusinessRolesCompanion(
            id: id,
            userId: userId,
            businessId: businessId,
            roleId: roleId,
            accessLevel: accessLevel,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String businessId,
            required String roleId,
            required String accessLevel,
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserBusinessRolesCompanion.insert(
            id: id,
            userId: userId,
            businessId: businessId,
            roleId: roleId,
            accessLevel: accessLevel,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserBusinessRolesTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $UserBusinessRolesTable,
    UserBusinessRole,
    $$UserBusinessRolesTableFilterComposer,
    $$UserBusinessRolesTableOrderingComposer,
    $$UserBusinessRolesTableAnnotationComposer,
    $$UserBusinessRolesTableCreateCompanionBuilder,
    $$UserBusinessRolesTableUpdateCompanionBuilder,
    (
      UserBusinessRole,
      BaseReferences<_$CoreDatabase, $UserBusinessRolesTable, UserBusinessRole>
    ),
    UserBusinessRole,
    PrefetchHooks Function()>;
typedef $$PermissionsMatrixTableCreateCompanionBuilder
    = PermissionsMatrixCompanion Function({
  required String id,
  required String roleId,
  required String module,
  required String access,
  Value<int> rowid,
});
typedef $$PermissionsMatrixTableUpdateCompanionBuilder
    = PermissionsMatrixCompanion Function({
  Value<String> id,
  Value<String> roleId,
  Value<String> module,
  Value<String> access,
  Value<int> rowid,
});

class $$PermissionsMatrixTableFilterComposer
    extends Composer<_$CoreDatabase, $PermissionsMatrixTable> {
  $$PermissionsMatrixTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get access => $composableBuilder(
      column: $table.access, builder: (column) => ColumnFilters(column));
}

class $$PermissionsMatrixTableOrderingComposer
    extends Composer<_$CoreDatabase, $PermissionsMatrixTable> {
  $$PermissionsMatrixTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roleId => $composableBuilder(
      column: $table.roleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get access => $composableBuilder(
      column: $table.access, builder: (column) => ColumnOrderings(column));
}

class $$PermissionsMatrixTableAnnotationComposer
    extends Composer<_$CoreDatabase, $PermissionsMatrixTable> {
  $$PermissionsMatrixTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);

  GeneratedColumn<String> get module =>
      $composableBuilder(column: $table.module, builder: (column) => column);

  GeneratedColumn<String> get access =>
      $composableBuilder(column: $table.access, builder: (column) => column);
}

class $$PermissionsMatrixTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $PermissionsMatrixTable,
    PermissionsMatrixData,
    $$PermissionsMatrixTableFilterComposer,
    $$PermissionsMatrixTableOrderingComposer,
    $$PermissionsMatrixTableAnnotationComposer,
    $$PermissionsMatrixTableCreateCompanionBuilder,
    $$PermissionsMatrixTableUpdateCompanionBuilder,
    (
      PermissionsMatrixData,
      BaseReferences<_$CoreDatabase, $PermissionsMatrixTable,
          PermissionsMatrixData>
    ),
    PermissionsMatrixData,
    PrefetchHooks Function()> {
  $$PermissionsMatrixTableTableManager(
      _$CoreDatabase db, $PermissionsMatrixTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PermissionsMatrixTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PermissionsMatrixTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PermissionsMatrixTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> roleId = const Value.absent(),
            Value<String> module = const Value.absent(),
            Value<String> access = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PermissionsMatrixCompanion(
            id: id,
            roleId: roleId,
            module: module,
            access: access,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String roleId,
            required String module,
            required String access,
            Value<int> rowid = const Value.absent(),
          }) =>
              PermissionsMatrixCompanion.insert(
            id: id,
            roleId: roleId,
            module: module,
            access: access,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PermissionsMatrixTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $PermissionsMatrixTable,
    PermissionsMatrixData,
    $$PermissionsMatrixTableFilterComposer,
    $$PermissionsMatrixTableOrderingComposer,
    $$PermissionsMatrixTableAnnotationComposer,
    $$PermissionsMatrixTableCreateCompanionBuilder,
    $$PermissionsMatrixTableUpdateCompanionBuilder,
    (
      PermissionsMatrixData,
      BaseReferences<_$CoreDatabase, $PermissionsMatrixTable,
          PermissionsMatrixData>
    ),
    PermissionsMatrixData,
    PrefetchHooks Function()>;
typedef $$AccessRequestsTableCreateCompanionBuilder = AccessRequestsCompanion
    Function({
  required String id,
  required String userId,
  required String requestedByUserId,
  required String businessId,
  required String accessChangeDescription,
  Value<String> status,
  required DateTime requestedAt,
  Value<DateTime?> resolvedAt,
  Value<int> rowid,
});
typedef $$AccessRequestsTableUpdateCompanionBuilder = AccessRequestsCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> requestedByUserId,
  Value<String> businessId,
  Value<String> accessChangeDescription,
  Value<String> status,
  Value<DateTime> requestedAt,
  Value<DateTime?> resolvedAt,
  Value<int> rowid,
});

class $$AccessRequestsTableFilterComposer
    extends Composer<_$CoreDatabase, $AccessRequestsTable> {
  $$AccessRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get requestedByUserId => $composableBuilder(
      column: $table.requestedByUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessChangeDescription => $composableBuilder(
      column: $table.accessChangeDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get requestedAt => $composableBuilder(
      column: $table.requestedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => ColumnFilters(column));
}

class $$AccessRequestsTableOrderingComposer
    extends Composer<_$CoreDatabase, $AccessRequestsTable> {
  $$AccessRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get requestedByUserId => $composableBuilder(
      column: $table.requestedByUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessChangeDescription => $composableBuilder(
      column: $table.accessChangeDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get requestedAt => $composableBuilder(
      column: $table.requestedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => ColumnOrderings(column));
}

class $$AccessRequestsTableAnnotationComposer
    extends Composer<_$CoreDatabase, $AccessRequestsTable> {
  $$AccessRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get requestedByUserId => $composableBuilder(
      column: $table.requestedByUserId, builder: (column) => column);

  GeneratedColumn<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => column);

  GeneratedColumn<String> get accessChangeDescription => $composableBuilder(
      column: $table.accessChangeDescription, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get requestedAt => $composableBuilder(
      column: $table.requestedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => column);
}

class $$AccessRequestsTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $AccessRequestsTable,
    AccessRequest,
    $$AccessRequestsTableFilterComposer,
    $$AccessRequestsTableOrderingComposer,
    $$AccessRequestsTableAnnotationComposer,
    $$AccessRequestsTableCreateCompanionBuilder,
    $$AccessRequestsTableUpdateCompanionBuilder,
    (
      AccessRequest,
      BaseReferences<_$CoreDatabase, $AccessRequestsTable, AccessRequest>
    ),
    AccessRequest,
    PrefetchHooks Function()> {
  $$AccessRequestsTableTableManager(
      _$CoreDatabase db, $AccessRequestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccessRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccessRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccessRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> requestedByUserId = const Value.absent(),
            Value<String> businessId = const Value.absent(),
            Value<String> accessChangeDescription = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> requestedAt = const Value.absent(),
            Value<DateTime?> resolvedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccessRequestsCompanion(
            id: id,
            userId: userId,
            requestedByUserId: requestedByUserId,
            businessId: businessId,
            accessChangeDescription: accessChangeDescription,
            status: status,
            requestedAt: requestedAt,
            resolvedAt: resolvedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String requestedByUserId,
            required String businessId,
            required String accessChangeDescription,
            Value<String> status = const Value.absent(),
            required DateTime requestedAt,
            Value<DateTime?> resolvedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccessRequestsCompanion.insert(
            id: id,
            userId: userId,
            requestedByUserId: requestedByUserId,
            businessId: businessId,
            accessChangeDescription: accessChangeDescription,
            status: status,
            requestedAt: requestedAt,
            resolvedAt: resolvedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AccessRequestsTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $AccessRequestsTable,
    AccessRequest,
    $$AccessRequestsTableFilterComposer,
    $$AccessRequestsTableOrderingComposer,
    $$AccessRequestsTableAnnotationComposer,
    $$AccessRequestsTableCreateCompanionBuilder,
    $$AccessRequestsTableUpdateCompanionBuilder,
    (
      AccessRequest,
      BaseReferences<_$CoreDatabase, $AccessRequestsTable, AccessRequest>
    ),
    AccessRequest,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$CoreDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$CoreDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$CoreDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$CoreDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$CoreDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$CoreDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$BackupLogTableCreateCompanionBuilder = BackupLogCompanion Function({
  required String id,
  Value<String?> businessId,
  required DateTime startedAt,
  required String status,
  required String locationPath,
  Value<int> sizeBytes,
  required String backupType,
  Value<int> rowid,
});
typedef $$BackupLogTableUpdateCompanionBuilder = BackupLogCompanion Function({
  Value<String> id,
  Value<String?> businessId,
  Value<DateTime> startedAt,
  Value<String> status,
  Value<String> locationPath,
  Value<int> sizeBytes,
  Value<String> backupType,
  Value<int> rowid,
});

class $$BackupLogTableFilterComposer
    extends Composer<_$CoreDatabase, $BackupLogTable> {
  $$BackupLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationPath => $composableBuilder(
      column: $table.locationPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backupType => $composableBuilder(
      column: $table.backupType, builder: (column) => ColumnFilters(column));
}

class $$BackupLogTableOrderingComposer
    extends Composer<_$CoreDatabase, $BackupLogTable> {
  $$BackupLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationPath => $composableBuilder(
      column: $table.locationPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backupType => $composableBuilder(
      column: $table.backupType, builder: (column) => ColumnOrderings(column));
}

class $$BackupLogTableAnnotationComposer
    extends Composer<_$CoreDatabase, $BackupLogTable> {
  $$BackupLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get locationPath => $composableBuilder(
      column: $table.locationPath, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get backupType => $composableBuilder(
      column: $table.backupType, builder: (column) => column);
}

class $$BackupLogTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $BackupLogTable,
    BackupLogData,
    $$BackupLogTableFilterComposer,
    $$BackupLogTableOrderingComposer,
    $$BackupLogTableAnnotationComposer,
    $$BackupLogTableCreateCompanionBuilder,
    $$BackupLogTableUpdateCompanionBuilder,
    (
      BackupLogData,
      BaseReferences<_$CoreDatabase, $BackupLogTable, BackupLogData>
    ),
    BackupLogData,
    PrefetchHooks Function()> {
  $$BackupLogTableTableManager(_$CoreDatabase db, $BackupLogTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> businessId = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> locationPath = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String> backupType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BackupLogCompanion(
            id: id,
            businessId: businessId,
            startedAt: startedAt,
            status: status,
            locationPath: locationPath,
            sizeBytes: sizeBytes,
            backupType: backupType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> businessId = const Value.absent(),
            required DateTime startedAt,
            required String status,
            required String locationPath,
            Value<int> sizeBytes = const Value.absent(),
            required String backupType,
            Value<int> rowid = const Value.absent(),
          }) =>
              BackupLogCompanion.insert(
            id: id,
            businessId: businessId,
            startedAt: startedAt,
            status: status,
            locationPath: locationPath,
            sizeBytes: sizeBytes,
            backupType: backupType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BackupLogTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $BackupLogTable,
    BackupLogData,
    $$BackupLogTableFilterComposer,
    $$BackupLogTableOrderingComposer,
    $$BackupLogTableAnnotationComposer,
    $$BackupLogTableCreateCompanionBuilder,
    $$BackupLogTableUpdateCompanionBuilder,
    (
      BackupLogData,
      BaseReferences<_$CoreDatabase, $BackupLogTable, BackupLogData>
    ),
    BackupLogData,
    PrefetchHooks Function()>;
typedef $$AppNotificationsTableCreateCompanionBuilder
    = AppNotificationsCompanion Function({
  required String id,
  required String businessId,
  required String severity,
  required String message,
  required String module,
  required DateTime createdAt,
  Value<DateTime?> readAt,
  Value<int> rowid,
});
typedef $$AppNotificationsTableUpdateCompanionBuilder
    = AppNotificationsCompanion Function({
  Value<String> id,
  Value<String> businessId,
  Value<String> severity,
  Value<String> message,
  Value<String> module,
  Value<DateTime> createdAt,
  Value<DateTime?> readAt,
  Value<int> rowid,
});

class $$AppNotificationsTableFilterComposer
    extends Composer<_$CoreDatabase, $AppNotificationsTable> {
  $$AppNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get readAt => $composableBuilder(
      column: $table.readAt, builder: (column) => ColumnFilters(column));
}

class $$AppNotificationsTableOrderingComposer
    extends Composer<_$CoreDatabase, $AppNotificationsTable> {
  $$AppNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get readAt => $composableBuilder(
      column: $table.readAt, builder: (column) => ColumnOrderings(column));
}

class $$AppNotificationsTableAnnotationComposer
    extends Composer<_$CoreDatabase, $AppNotificationsTable> {
  $$AppNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessId => $composableBuilder(
      column: $table.businessId, builder: (column) => column);

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get module =>
      $composableBuilder(column: $table.module, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get readAt =>
      $composableBuilder(column: $table.readAt, builder: (column) => column);
}

class $$AppNotificationsTableTableManager extends RootTableManager<
    _$CoreDatabase,
    $AppNotificationsTable,
    AppNotification,
    $$AppNotificationsTableFilterComposer,
    $$AppNotificationsTableOrderingComposer,
    $$AppNotificationsTableAnnotationComposer,
    $$AppNotificationsTableCreateCompanionBuilder,
    $$AppNotificationsTableUpdateCompanionBuilder,
    (
      AppNotification,
      BaseReferences<_$CoreDatabase, $AppNotificationsTable, AppNotification>
    ),
    AppNotification,
    PrefetchHooks Function()> {
  $$AppNotificationsTableTableManager(
      _$CoreDatabase db, $AppNotificationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppNotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppNotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppNotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> businessId = const Value.absent(),
            Value<String> severity = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<String> module = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> readAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppNotificationsCompanion(
            id: id,
            businessId: businessId,
            severity: severity,
            message: message,
            module: module,
            createdAt: createdAt,
            readAt: readAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String businessId,
            required String severity,
            required String message,
            required String module,
            required DateTime createdAt,
            Value<DateTime?> readAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppNotificationsCompanion.insert(
            id: id,
            businessId: businessId,
            severity: severity,
            message: message,
            module: module,
            createdAt: createdAt,
            readAt: readAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppNotificationsTableProcessedTableManager = ProcessedTableManager<
    _$CoreDatabase,
    $AppNotificationsTable,
    AppNotification,
    $$AppNotificationsTableFilterComposer,
    $$AppNotificationsTableOrderingComposer,
    $$AppNotificationsTableAnnotationComposer,
    $$AppNotificationsTableCreateCompanionBuilder,
    $$AppNotificationsTableUpdateCompanionBuilder,
    (
      AppNotification,
      BaseReferences<_$CoreDatabase, $AppNotificationsTable, AppNotification>
    ),
    AppNotification,
    PrefetchHooks Function()>;

class $CoreDatabaseManager {
  final _$CoreDatabase _db;
  $CoreDatabaseManager(this._db);
  $$BusinessesTableTableManager get businesses =>
      $$BusinessesTableTableManager(_db, _db.businesses);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$RolesTableTableManager get roles =>
      $$RolesTableTableManager(_db, _db.roles);
  $$UserBusinessRolesTableTableManager get userBusinessRoles =>
      $$UserBusinessRolesTableTableManager(_db, _db.userBusinessRoles);
  $$PermissionsMatrixTableTableManager get permissionsMatrix =>
      $$PermissionsMatrixTableTableManager(_db, _db.permissionsMatrix);
  $$AccessRequestsTableTableManager get accessRequests =>
      $$AccessRequestsTableTableManager(_db, _db.accessRequests);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$BackupLogTableTableManager get backupLog =>
      $$BackupLogTableTableManager(_db, _db.backupLog);
  $$AppNotificationsTableTableManager get appNotifications =>
      $$AppNotificationsTableTableManager(_db, _db.appNotifications);
}
