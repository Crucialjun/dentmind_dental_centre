import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:dentmind_dental_centre/screens/main_dashboard.dart';
import 'package:dentmind_dental_centre/screens/onboarding_screen.dart';
import 'package:dentmind_dental_centre/screens/sign_in_screen.dart';
import 'package:dentmind_dental_centre/screens/sign_up_screen.dart';
import 'package:dentmind_dental_centre/screens/splash_screen.dart';
import 'package:dentmind_dental_centre/utils/auth_checker.dart';
import 'package:dentmind_dental_centre/utils/custom_scroll.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScroll(),
        title: appName,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryColor: const Color(0xFF0f4b87),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFFfcb017)),
        ),
        initialRoute: splashRoute,
        routes: {
          splashRoute: (context) => const SplashScreen(),
          onboardingRoute: (context) => const OnboardingScreen(),
          dashboardRoute: (context) => const MainDashboard(),
          signinRoute: (context) => const SignInScreen(),
          signupRoute: (context) => const SignUpScreen(),
          authCheckerRoute: (context) => const AuthChecker(),
        });
  }
}
