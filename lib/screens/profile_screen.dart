import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/firebase/firebase_storage_methods.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
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
              var client =
                  await FirebaseStorageMethods().getClient(_firebaseUser!.uid);

              print(client!.firstName);
            },
            child: Text("Check user"),
          ),
        ],
      )),
    );
  }
}
