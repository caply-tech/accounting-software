import 'package:intl/intl.dart';

final _inrFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);
final _dateFormat = DateFormat('dd MMM yyyy');

/// [minorUnits] is paise (see docs/database-architecture.md — money is
/// always stored as an integer to avoid float drift).
String formatInr(int minorUnits) => _inrFormat.format(minorUnits / 100);

String formatDate(DateTime date) => _dateFormat.format(date);
