import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'core/utils/style/themes/base_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
    ).modular();
  }
}
