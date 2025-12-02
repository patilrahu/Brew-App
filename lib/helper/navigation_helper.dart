import 'package:flutter/material.dart';

class NavigationHelper {
  NavigationHelper._internal();

  static final _instance = NavigationHelper._internal();

  factory NavigationHelper() {
    return _instance;
  }

  MaterialPageRoute _materialContext(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }

  void pushNavigation(BuildContext context, Widget screen) {
    Navigator.push(context, _materialContext(screen));
  }
}
