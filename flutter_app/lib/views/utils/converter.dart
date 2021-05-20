import 'package:intl/intl.dart';

class OLConverter {
  static date(date) {
    return DateTime.parse(date).toLocal().toString().split('.')[0];
    //return DateFormat(format).format(DateTime.parse(date));
  }

  static time(hours) {
    return Duration(seconds: (hours * 3600).toInt()).toString().split('.')[0];
  }
}
