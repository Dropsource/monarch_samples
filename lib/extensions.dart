import 'package:intl/intl.dart';

final formatCurrency = new NumberFormat.simpleCurrency();

extension StringUtils on double {
  String get formattedPrice => formatCurrency.format(this);
}
