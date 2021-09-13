import 'package:covid19/app/core/constants.dart';
import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/model/Summary.dart';

import 'config/api_service.dart';

class CovidService {
  late final APIService _service;
  String _summaryPath = "/summary";

  CovidService() {
    this._service = APIService();
  }

  Future<List<Country>> doSearch({required String searchText}) async {
    var _response = await getSummary();
    List<Country> _countries = _response.countries
        .where(
            (e) => (e.country.toLowerCase().contains(searchText.toLowerCase())))
        .toList();
    return _countries;
  }

  Future<Summary> getSummary() async {
    final response = await _service.doRequest(
      API_BASE_URL,
      RequestConfig(_summaryPath, HttpMethod.get),
    );
    return Summary.fromJson(response);
  }
}
