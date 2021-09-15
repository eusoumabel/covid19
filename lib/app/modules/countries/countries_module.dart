import 'package:covid19/app/core/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'countries_bloc.dart';
import 'countries_page.dart';

class CountriesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CountriesBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(COUNTRIES_ROUTE, child: (_, args) => CountriesPage()),
  ];
}
