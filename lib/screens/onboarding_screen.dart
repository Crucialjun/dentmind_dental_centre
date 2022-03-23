import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:dentmind_dental_centre/widgets/onboarding_pageview.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, right: 8.0, left: 8.0, bottom: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  appName,
                  style: TextStyle(
                      fontSize: 24,
                      color: primaryAppColor,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, authCheckerRoute);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: primaryAppColor, fontSize: 22),
                  ),
                )
              ],
            ),
            Image.asset('assets/logo.png'),
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
      )),
    );
  }
}
