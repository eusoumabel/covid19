import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  setPathUrlStrategy();
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
