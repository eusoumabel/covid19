import 'dart:async';

import 'package:covid19/model/Summary.dart';
import 'package:covid19/service/config/api_service.dart';
import 'package:covid19/service/config/base_response.dart';
import 'package:covid19/service/countries_service.dart';
import 'package:covid19/service/home_service.dart';
import 'package:flutter/material.dart';

class CountriesBloc {
  CountriesService _countriesService;

  StreamController<BaseResponse<Summary>> _summaryController;

  Stream<BaseResponse<Summary>> get summaryStream => _summaryController.stream;
  Sink<BaseResponse<Summary>> get summarySink => _summaryController.sink;

  Summary _summary;

  CountriesBloc() {
    _countriesService = CountriesService(APIService());
    _summaryController = StreamController.broadcast();
    _summary = Summary();
  }

  getSummary() async {
    try {
      _summary = await _countriesService.getSummary();
      summarySink.add(BaseResponse.completed(data: _summary));
    } catch (e) {
      debugPrint("get error = $e");
    }
  }

  dispose() {
    _summaryController.close();
  }
}
