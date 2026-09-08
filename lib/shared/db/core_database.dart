import 'package:drift/drift.dart';
import 'connection/connection.dart' as impl;

part 'core_database.g.dart';

/// Installation-wide registry: businesses, users, roles and settings.
/// See docs/database-architecture.md for why this is separate from the
/// per-business database.
class Businesses extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get businessType => text()();
  TextColumn get location => text()();
  BoolColumn get isHeadOffice => boolean().withDefault(const Constant(false))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get dbFilename => text()();
  TextColumn get fiscalYearLabel => text()();
  IntColumn get fiscalYearStartMonth => integer().withDefault(const Constant(4))();
  TextColumn get currencyCode => text().withDefault(const Constant('INR'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastActivityAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get username => text().unique()();
  TextColumn get email => text().nullable()();
  TextColumn get passwordHash => text()();
  TextColumn get fullName => text()();
  BoolColumn get isSuperAdmin => boolean().withDefault(const Constant(false))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get lastLoginAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Roles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().unique()();

  @override
  Set<Column> get primaryKey => {id};
}

class UserBusinessRoles extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get businessId => text().references(Businesses, #id)();
  TextColumn get roleId => text().references(Roles, #id)();
  TextColumn get accessLevel => text()();
  TextColumn get status => text().withDefault(const Constant('active'))();

  @override
  Set<Column> get primaryKey => {id};
}

class PermissionsMatrix extends Table {
  TextColumn get id => text()();
  TextColumn get roleId => text().references(Roles, #id)();
  TextColumn get module => text()();
  TextColumn get access => text()(); // full | view_limited | none

  @override
  Set<Column> get primaryKey => {id};
}

class AccessRequests extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get requestedByUserId => text().references(Users, #id)();
  TextColumn get businessId => text().references(Businesses, #id)();
  TextColumn get accessChangeDescription => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get requestedAt => dateTime()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class BackupLog extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text().nullable().references(Businesses, #id)();
  DateTimeColumn get startedAt => dateTime()();
  TextColumn get status => text()();
  TextColumn get locationPath => text()();
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get backupType => text()(); // full | incremental

  @override
  Set<Column> get primaryKey => {id};
}

class AppNotifications extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text().references(Businesses, #id)();
  TextColumn get severity => text()(); // info | warning | critical
  TextColumn get message => text()();
  TextColumn get module => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get readAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  Businesses,
  Users,
  Roles,
  UserBusinessRoles,
  PermissionsMatrix,
  AccessRequests,
  AppSettings,
  BackupLog,
  AppNotifications,
])
class CoreDatabase extends _$CoreDatabase {
  CoreDatabase() : super(impl.openConnection('core.db'));

  @override
  int get schemaVersion => 1;
}
