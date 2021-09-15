import 'package:covid19/app/core/constants.dart';
import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/model/Summary.dart';
import 'package:covid19/app/core/services/config/api_service.dart';
import 'package:covid19/app/core/services/covid_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class CovidServiceMock extends Fake implements ICovidService {
  late final APIService _service;
  final Dio dio;
  String _summaryPath = "/summary";

  CovidServiceMock(this.dio) {
    this._service = APIService(dio);
  }

  @override
  Future<List<Country>> doSearch({required String searchText}) async {
    var _response = await getSummary();
    List<Country> _countries = _response.countries
        .where(
            (e) => (e.country.toLowerCase().contains(searchText.toLowerCase())))
        .toList();
    return _countries;
  }

  @override
  Future<Summary> getSummary() async {
    final response = await _service.doRequest(
      API_BASE_URL,
      RequestConfig(_summaryPath, HttpMethod.get),
    );
    return Summary.fromJson(response);
  }
}
