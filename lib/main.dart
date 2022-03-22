import 'package:dentmind_dental_centre/providers/onboarding_provider.dart';
import 'package:dentmind_dental_centre/screens/main_dashboard.dart';
import 'package:dentmind_dental_centre/screens/onboarding_screen.dart';
import 'package:dentmind_dental_centre/screens/splash_screen.dart';
import 'package:dentmind_dental_centre/utils/custom_scroll.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
        title: 'Dentmind Dental Centre',
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryColor: const Color(0xFF0f4b87),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFFfcb017)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          'onboarding': (context) => const OnboardingScreen(),
          'dashboard': (context) => const MainDashboard(),
        });
  }
}
