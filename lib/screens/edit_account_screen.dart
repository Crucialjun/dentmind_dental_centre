import 'package:dentmind_dental_centre/screens/string_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../firebase/firebase_auth.dart';
import '../firebase/firebase_storage_methods.dart';
import '../global_constants.dart';
import '../models/client_model.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Edit Account Details",
                style: TextStyle(
                    fontFamily: GoogleFonts.chivo().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: primaryAppColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Stack(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/man.png"),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/addphoto.png"),
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future:
                      FirebaseStorageMethods().getClient(_firebaseUser!.uid),
                  builder: (context, AsyncSnapshot<Client?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "First Name: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  snapshot.data!.firstName,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  }),
              Text("${_firebaseUser.email}"),
              const SizedBox(
                height: 4,
              ),
              InkWell(
                  onTap: () {},
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w500),
                  )),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: primaryAppColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/man.png"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 4,
                      ),
                    ),
                    Icon(Icons.arrow_right_outlined)
                  ]),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: primaryAppColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/appointment.png"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "My Appointments",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 4,
                      ),
                    ),
                    Icon(Icons.arrow_right_outlined)
                  ]),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: primaryAppColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/dental.png"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "My Dental Information",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 4,
                      ),
                    ),
                    Icon(Icons.arrow_right_outlined)
                  ]),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: primaryAppColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/favorite.png"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Favorite Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 4,
                      ),
                    ),
                    Icon(Icons.arrow_right_outlined)
                  ]),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: primaryAppColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/setting.png"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 4,
                      ),
                    ),
                    Icon(Icons.arrow_right_outlined)
                  ]),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseUserRepo().logoutUser();
                  Navigator.pushReplacementNamed(context, signinRoute);
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
