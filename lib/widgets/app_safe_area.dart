import 'package:flutter/material.dart';

class AppSafeArea extends StatelessWidget {
  final Widget child;
  const AppSafeArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return Container(
      color: brightness == Brightness.dark ? Colors.black : Colors.white,
      child: SafeArea(child: child),
    );
  }
}
