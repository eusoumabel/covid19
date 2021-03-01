import 'package:covid19/model/Country.dart';
import 'package:covid19/model/Summary.dart';
import 'package:covid19/utils/constants.dart';
import 'package:flutter/material.dart';

import 'config/api_service.dart';

class SearchService {
  final APIService _service;

  String _getSummaryBaseUrl = "/summary";

  SearchService(this._service);

  Future<List<Country>> makeSearch({@required String searchText}) async {
    var allCountries = await getSummary();
    List<Country> countries = allCountries.countries;
    List<Country> _results;
    _results = countries
        .where(
            (element) => (element.country.toLowerCase().contains(searchText)))
        .toList();
    return _results;
  }

  Future<Summary> getSummary() async {
    final response = await _service.doRequest(
        Constants.kBaseUrl, RequestConfig(_getSummaryBaseUrl, HttpMethod.get));
    var _results = Summary.fromJson(response);
    return _results;
  }
}
