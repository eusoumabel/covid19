import 'dart:convert';
import 'package:covid19/app/core/model/Summary.dart';
import 'package:covid19/app/modules/countries/countries_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/covid_service_mock.dart';

main() {
  late CountriesBloc bloc;
  late CovidServiceMock mockService;
  late Dio dio;

  setUp(() {
    dio = Dio();
    mockService = CovidServiceMock(dio);
    bloc = CountriesBloc(mockService);
  });

  group('Countries Bloc Test', () {
    test('Mock Get Summary - Expect 200 status code', () async {
      // Summary _summary = await mockService.getSummary();
      await bloc.getSummary();
      //expect(bloc.summaryController.stream, bloc.summaryController.stream);
    });
  });
}
