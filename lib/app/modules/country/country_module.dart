import 'package:covid19/app/core/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'country_bloc.dart';
import 'country_page.dart';

class CountryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CountryBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(COUNTRY_ROUTE,
        child: (_, args) => CountryPage(country: args.data)),
  ];
}
