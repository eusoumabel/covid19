import 'package:covid19/app/core/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'search_bloc.dart';
import 'search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(SEARCH_ROUTE, child: (_, args) => SearchPage()),
  ];
}
