import 'package:flutter/material.dart';

import 'pages/splash_page.dart';
import 'utils/style/themes/base_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      home: SplashPage(),
    );
  }
}
