import 'package:covid/model/Summary.dart';

import 'config/api_service.dart';

class HomeService {
  final APIService _service;

  String _getSummaryBaseUrl = "/summary";

  HomeService(this._service);

  Future<Summary> getSummary() async {
    final response = await _service
        .doRequest(RequestConfig(_getSummaryBaseUrl, HttpMethod.get));
    var _results = Summary.fromJson(response);
    return _results;
  }
}
