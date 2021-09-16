import 'dart:convert';
import 'package:covid19/app/core/model/Summary.dart';
import 'package:covid19/app/core/services/config/base_response.dart';
import 'package:covid19/app/core/services/covid_service.dart';
import 'package:covid19/app/modules/countries/countries_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mocks/covid_service_mock.dart';

@GenerateMocks([CovidService])
main() {
  late CountriesBloc bloc;
  late CovidServiceMock mockService;

  setUp(() {
    mockService = CovidServiceMock(Dio());
    bloc = CountriesBloc(mockService);
  });

  group('Countries Bloc Test', () {
    test('getSummary - summary stream must not be null', () {
      bloc.getSummary();
      expect(bloc.summaryController.stream, isNotNull);
    });
  });
}
