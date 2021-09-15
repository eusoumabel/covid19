import 'dart:async';

import 'package:covid19/app/core/model/Summary.dart';
import 'package:covid19/app/core/services/config/base_response.dart';
import 'package:covid19/app/core/services/covid_service_interface.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable, Modular;

class CountriesBloc extends Disposable {
  final ICovidService _service;
  late StreamController<BaseResponse<Summary>> summaryController;

  CountriesBloc(this._service) {
    summaryController = StreamController();
  }

  getSummary() async {
    summaryController.sink.add(BaseResponse.loading());
    try {
      Summary _summary = await _service.getSummary();
      summaryController.sink.add(BaseResponse.completed(data: _summary));
    } catch (e) {
      summaryController.sink.add(BaseResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    summaryController.close();
  }
}
