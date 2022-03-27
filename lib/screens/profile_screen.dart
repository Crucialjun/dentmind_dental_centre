import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/firebase/firebase_storage_methods.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Container(
      child: Column(
        children: [
          SvgPicture.asset("assets/profile.svg"),
          Text("FirstName LastName"),
          Text("${_firebaseUser?.email}"),
          Text("Edit"),
          Container(
            child: Row(children: [
              Icon(Icons.account_box),
              Text("Account"),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_right_outlined)
            ]),
          ),
          Container(
            child: Row(children: [
              Icon(Icons.account_box),
              Text("My Appointments"),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_right_outlined)
            ]),
          ),
          Container(
            child: Row(children: [
              Icon(Icons.account_box),
              Text("My dental information"),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_right_outlined)
            ]),
          ),
          Container(
            child: Row(children: [
              Icon(Icons.account_box),
              Text("Favorite Services"),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_right_outlined)
            ]),
          ),
          Container(
            child: Row(children: [
              Icon(Icons.account_box),
              Text("Settings"),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_right_outlined)
            ]),
          ),
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
      ),
    );
  }
}
