import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

BubbleBottomBarItem bottomNavBarItem(
    IconData icon, String tag, BuildContext context) {
  return BubbleBottomBarItem(
    backgroundColor: Colors.grey,
    icon: Icon(
      icon,
      color: Colors.grey,
    ),
    activeIcon: IconTheme(
      data: Theme.of(context).iconTheme,
      child: Icon(icon),
    ),
    title: Text(
      tag,
      style: Theme.of(context).textTheme.button,
    ),
  );
}
