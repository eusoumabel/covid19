import 'package:covid19/model/Summary.dart';
import 'package:covid19/model/Svg.dart';
import 'package:covid19/utils/constants.dart';

import 'config/api_service.dart';

class CountriesService {
  final APIService _service;

  String _getSummaryBaseUrl = "/summary";
  String _getFlagsUlr;

  CountriesService(this._service);

  Future<Summary> getSummary() async {
    final response = await _service.doRequest(
        Constants.kBaseUrl, RequestConfig(_getSummaryBaseUrl, HttpMethod.get));
    var _results = Summary.fromJson(response);
    // _results.countries.forEach((element) {
    //   element.flag = getFlags(element.countryCode.toLowerCase());
    // });
    return _results;
  }

  Future<Svg> getFlags(String countryCode) async {
    _getFlagsUlr = "/$countryCode.svg";
    final response = await _service.doRequest(
        Constants.kFlagsUrl, RequestConfig(_getFlagsUlr, HttpMethod.get));
    var _results = Svg.fromJson(response);
    return _results;
  }
}
