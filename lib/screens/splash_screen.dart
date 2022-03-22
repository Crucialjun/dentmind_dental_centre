import 'package:dentmind_dental_centre/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Image.asset("assets/logo.png"),
      )),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool("isFirstTime") ?? true;
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, "onboarding");
      prefs.setBool("isFirstTime", false);
    } else {
      Navigator.pushReplacementNamed(context, "dashboard");
    }
  }
}
