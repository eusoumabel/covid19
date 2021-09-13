import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NativeLoading extends StatelessWidget {
  final bool animating;

  NativeLoading({
    Key? key,
    required this.animating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Platform.isIOS ? _iosLoading() : _androidLoading(context),
    );
  }

  _iosLoading() {
    return Align(
      alignment: Alignment.center,
      child: CupertinoActivityIndicator(
        animating: true,
      ),
    );
  }

  _androidLoading(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
