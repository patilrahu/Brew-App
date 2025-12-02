import 'package:brewy_app/constant/string_constant.dart';
import 'package:brewy_app/features/home/ui/home.dart';
import 'package:brewy_app/helper/navigation_helper.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToScreen();
  }

  void _navigateToScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    NavigationHelper().pushNavigation(context, Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          StringConstant.appName.toUpperCase(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
