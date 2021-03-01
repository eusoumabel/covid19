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

  Esse é um aplicativo para monitorar o vírus Covid-19 pelo mundo. Ele foi criado, não só, como um projeto pessoal, para que eu pudesse aprender mais sobre Flutter, mas também para me manter e manter aqueles que estão perto de mim informados.
  Todos os dados utilizados foram obtidos da API disponibilizada pelo Postman.
  """;

  static String kAuthor = "Desenvolvedora: Ester Mabel Silva Santos.";
  static String kAuthorGit = "https://github.com/estermabel";
}
