import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  Future<bool> get getIsFirstTime async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isFirstTime") ?? true;
  }

  void updateIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstTime", false);
  }
}
