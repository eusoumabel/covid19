import 'dart:async';

import 'package:covid19/model/Country.dart';
import 'package:covid19/services/config/api_service.dart';
import 'package:covid19/services/config/base_response.dart';
import 'package:covid19/services/search_service.dart';
import 'package:flutter/material.dart';

class SearchBloc {
  SearchService _searchService;

  StreamController<BaseResponse<List<Country>>> _searchController;

  Stream<BaseResponse<List<Country>>> get searchStream =>
      _searchController.stream;
  Sink<BaseResponse<List<Country>>> get searchSink => _searchController.sink;
  TextEditingController searchTextController;
  List<Country> _countries;

  SearchBloc() {
    _searchService = SearchService(APIService());
    _searchController = StreamController.broadcast();
    searchTextController = TextEditingController();
    _countries = [];
  }

  makeSearch({@required String searchText}) async {
    try {
      _countries =
          await _searchService.makeSearch(searchText: searchText.toLowerCase());
      searchSink.add(BaseResponse.completed(data: _countries));
    } catch (e) {
      debugPrint("get error = $e");
    }
  }

  clearSearch() {
    searchTextController.clear();
    _countries.clear();
    searchSink.add(BaseResponse.completed(data: _countries));
  }

  dispose() {
    _searchController.close();
  }
}
