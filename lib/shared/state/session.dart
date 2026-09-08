import 'package:flutter/foundation.dart';

/// Which top-level module is showing in the content area. One enum value
/// per sidebar item in the mock design.
enum AppModule {
  dashboard,
  accountsFinance,
  multiBranch,
  payrollStaff,
  assetValuation,
  inventory,
  eventCalendar,
  reports,
  securityAdmin,
}

class CurrentUser {
  const CurrentUser({required this.id, required this.fullName, required this.roleLabel});
  final String id;
  final String fullName;
  final String roleLabel;
}

class BusinessSummary {
  const BusinessSummary({
    required this.id,
    required this.name,
    required this.businessType,
    required this.location,
    required this.isHeadOffice,
    required this.dbFilename,
  });

  final String id;
  final String name;
  final String businessType;
  final String location;
  final bool isHeadOffice;
  final String dbFilename;
}

/// Top-level app session: who is signed in, which module is selected, and
/// which business is the active context (per the top-bar business selector
/// / Multi-Branch screen). Switching [currentBusiness] is what swaps which
/// per-business SQLite file every module reads from.
class SessionState extends ChangeNotifier {
  CurrentUser? _user;
  AppModule _module = AppModule.dashboard;
  BusinessSummary? _currentBusiness;
  List<BusinessSummary> _businesses = const [];
  bool _offlineModeAcknowledged = true;

  CurrentUser? get user => _user;
  AppModule get module => _module;
  BusinessSummary? get currentBusiness => _currentBusiness;
  List<BusinessSummary> get businesses => _businesses;
  bool get isSignedIn => _user != null;
  bool get offlineModeAcknowledged => _offlineModeAcknowledged;

  void signIn(CurrentUser user) {
    _user = user;
    notifyListeners();
  }

  void signOut() {
    _user = null;
    notifyListeners();
  }

  void setModule(AppModule module) {
    _module = module;
    notifyListeners();
  }

  void setBusinesses(List<BusinessSummary> businesses) {
    _businesses = businesses;
    _currentBusiness ??= businesses.isNotEmpty ? businesses.first : null;
    notifyListeners();
  }

  void switchBusiness(BusinessSummary business) {
    _currentBusiness = business;
    notifyListeners();
  }
}
