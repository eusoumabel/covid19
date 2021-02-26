import 'dart:async';

import 'package:covid/model/Summary.dart';
import 'package:covid/service/config/api_service.dart';
import 'package:covid/service/config/base_response.dart';
import 'package:covid/service/home_service.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  HomeService _homeService;

  StreamController<BaseResponse<Summary>> _summaryController;

  Stream<BaseResponse<Summary>> get summaryStream => _summaryController.stream;
  Sink<BaseResponse<Summary>> get summarySink => _summaryController.sink;

  Summary _summary;

  HomeBloc() {
    _homeService = HomeService(APIService());
    _summaryController = StreamController.broadcast();
    _summary = Summary();
  }

  getSummary() async {
    try {
      _summary = await _homeService.getSummary();
      summarySink.add(BaseResponse.completed(data: _summary));
    } catch (e) {
      debugPrint("get error = $e");
    }
  }

  dispose() {
    _summaryController.close();
  }
}
