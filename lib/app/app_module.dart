import 'package:covid19/app/core/routes.dart';
import 'package:covid19/app/core/services/covid_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/countries/countries_module.dart';
import 'modules/country/country_module.dart';
import 'modules/search/search_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => CovidService(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(SPLASH_ROUTE, module: SplashModule()),
    ModuleRoute(COUNTRIES_ROUTE, module: CountriesModule()),
    ModuleRoute(SEARCH_ROUTE, module: SearchModule()),
    ModuleRoute(COUNTRY_ROUTE, module: CountryModule()),
  ];
}
