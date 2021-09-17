import 'package:covid19/app/modules/search/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/covid_service_mock.dart';

main() {
  late SearchBloc bloc;
  late CovidServiceMock mockService;

  setUp(() {
    mockService = CovidServiceMock();
    bloc = SearchBloc(mockService);
  });

  group('Countries Bloc Test', () {
    test('makeSearch - countries list must not be null', () {
      bloc.makeSearch(searchText: 'br');
      expect(bloc.countries.isEmpty, false);
    });
    test('clearSearch - countries list must be null', () {
      bloc.clearSearch();
      expect(bloc.countries.isEmpty, true);
    });
  });
}
