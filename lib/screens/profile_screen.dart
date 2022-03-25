import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        onPressed: () async {
          await FirebaseUserRepo().logoutUser();
          Navigator.pushReplacementNamed(context, signinRoute);
        },
        child: Text("Logout"),
      )),
    );
  }
}
