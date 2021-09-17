import 'package:intl/intl.dart';

class Helpers {
  static String formatterNumber(dynamic num) {
    final numberFormat = NumberFormat("#,###,000", 'pt_BR');
    return numberFormat.format(num);
  }

  static String formatterDateFromAPI(String date) {
    var split = date.split("-");
    return "${split[2] + '/' + split[1] + '/' + split[0]}";
  }

  static String formatterDateAndTimeFromAPI(String date) {
    var split = date.split("T");
    var finalDate = formatterDateFromAPI(split[0]);
    var splitTime = split[1].split(".");
    var finalTime = splitTime[0];
    return "$finalDate $finalTime";
  }
}
