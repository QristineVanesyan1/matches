import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String format(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatDDMM(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM');
    return formatter.format(date);
  }
}
