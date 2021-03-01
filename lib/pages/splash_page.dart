import 'package:covid19/utils/style/animations/fade_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'controller_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() async {
    await Future.delayed(new Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (context) => ControllerPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(0.7, _icon()),
            FadeAnimation(1.4, _textTitle()),
          ],
        ),
      ),
    );
  }

  Padding _textTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Covid-19",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _icon() {
    return SvgPicture.asset(
      'assets/images/virus.svg',
      color: Theme.of(context).accentColor,
      height: MediaQuery.of(context).size.height * 0.2,
    );
  }
}
