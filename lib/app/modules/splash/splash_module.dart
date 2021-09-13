import 'package:covid19/app/core/routes.dart';
import 'package:covid19/app/modules/splash/splash_bloc.dart';
import 'package:covid19/app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(SPLASH_ROUTE, child: (_, args) => SplashPage()),
  ];
}
