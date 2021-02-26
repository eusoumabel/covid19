import 'package:flutter/material.dart';

AppBar appBar({BuildContext context, String title}) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline5,
    ),
  );
}
