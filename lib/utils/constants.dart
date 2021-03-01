import 'package:dio/dio.dart';

class Constants {
  static String kBaseUrl = "https://api.covid19api.com";
  static String kFlagsUrl = "https://flagcdn.com";

  //static String kApiKey = "";

  static Options kOptions = Options(
    headers: {"X-Access-Token": "b5cf9dfd5-3449-485e-b5ae-70a60e997864"},
  );

  static String kApiDocumentationUrl =
      "https://documenter.getpostman.com/view/10808728/SzS8rjbc?version=latest";

  static String kInformationString = """
  Covid-19

  This is an app to keep track of the Covid-19 effect around the world. It was first created as a personal project to learn more about Flutter, but also to keep myself updated and others around me.
  All the data used in this project is from an API provided by Postman.
  """;

  static String kAuthor = "Developer: Ester Mabel Silva Santos.";
  static String kAuthorGit = "https://github.com/estermabel";
}
