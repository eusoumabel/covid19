import 'dart:async';

import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/services/config/base_response.dart';
import 'package:covid19/app/core/services/covid_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;

class SearchBloc extends Disposable {
  final ICovidService _service;
  late StreamController<BaseResponse<List<Country>>> searchController;
  late TextEditingController searchTextController;
  late List<Country> countries;

  SearchBloc(this._service) {
    searchController = StreamController();
    searchTextController = TextEditingController();
    countries = [];
  }

  makeSearch({required String searchText}) async {
    try {
      countries = await _service.doSearch(searchText: searchText.toLowerCase());
      searchController.sink.add(BaseResponse.completed(data: countries));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  clearSearch() {
    searchTextController.clear();
    countries.clear();
    searchController.sink.add(BaseResponse.completed(data: countries));
  }

  @override
  void dispose() {
    searchController.close();
  }
}
