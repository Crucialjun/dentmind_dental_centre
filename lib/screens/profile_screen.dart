import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/firebase/firebase_storage_methods.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await FirebaseUserRepo().logoutUser();
              Navigator.pushReplacementNamed(context, signinRoute);
            },
            child: Text("Logout"),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseStorageMethods().getClient(context);
            },
            child: Text("Check user"),
          ),
        ],
      )),
    );
  }
}
