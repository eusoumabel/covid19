import 'package:dio/dio.dart';

class Constants {
  static String kBaseUrl = "https://api.covid19api.com/";

  //static String kApiKey = "bcd15b7346mshe40da8dad1ab385p1b99ebjsn720e5c3d3c90";

  static Options kOptions = Options(
    headers: {"X-Access-Token": "b5cf9dfd5-3449-485e-b5ae-70a60e997864"},
  );
}
