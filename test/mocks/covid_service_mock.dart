import 'dart:convert';

import 'package:covid19/app/core/constants.dart';
import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/model/Summary.dart';
import 'package:covid19/app/core/services/config/api_service.dart';
import 'package:covid19/app/core/services/covid_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

import '../json/summary_json_mock.dart';

class CovidServiceMock extends Fake implements ICovidService {
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
    final json = summaryJsonMock;
    final response = jsonDecode(json);
    return Summary.fromJson(response);
  }
}
