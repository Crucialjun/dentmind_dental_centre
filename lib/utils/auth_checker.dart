import 'package:dentmind_dental_centre/screens/main_dashboard.dart';
import 'package:dentmind_dental_centre/screens/sign_in_screen.dart';
import 'package:dentmind_dental_centre/utils/main_pageview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return _firebaseUser == null ? const SignInScreen() : const MainPageView();
  }
}
