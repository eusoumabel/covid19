import 'package:covid19/model/Summary.dart';
import 'package:covid19/utils/constants.dart';

import 'config/api_service.dart';

class CountriesService {
  final APIService _service;

  String _getSummaryBaseUrl = "/summary";

  CountriesService(this._service);

  Future<Summary> getSummary() async {
    final response = await _service.doRequest(
        Constants.kBaseUrl, RequestConfig(_getSummaryBaseUrl, HttpMethod.get));
    var _results = Summary.fromJson(response);
    return _results;
  }
}
