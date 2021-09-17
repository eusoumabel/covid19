import 'package:covid19/app/modules/countries/countries_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/covid_service_mock.dart';

main() {
  late CountriesBloc bloc;
  late CovidServiceMock mockService;

  setUp(() {
    mockService = CovidServiceMock();
    bloc = CountriesBloc(mockService);
  });

  group('Countries Bloc Test', () {
    test('getSummary - summary stream must not be null', () {
      bloc.getSummary();
      expect(bloc.summaryController.stream, isNotNull);
    });
  });
}
