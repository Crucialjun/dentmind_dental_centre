import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:dentmind_dental_centre/widgets/onboarding_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 16.0),
        child: Column(
          children: [
            Hero(tag: "logo", child: Image.asset('assets/logo.png')),
            const Flexible(child: OnboardingPageView()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: primaryAppColor),
              onPressed: () {
                Navigator.pushReplacementNamed(context, signupRoute);
              },
              child: const Text("Create an Account"),
            ),
            const SizedBox(
              height: 8,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, signinRoute);
              },
              style: OutlinedButton.styleFrom(
                  primary: primaryAppColor,
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1.0, color: primaryAppColor)),
              child: const Text("I already have an account"),
            ),
          ],
        ),
      ),
    );
  }
}
