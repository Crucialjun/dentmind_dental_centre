import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../firebase/firebase_storage_methods.dart';
import '../models/client_model.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              "Edit Profile",
              style: TextStyle(
                  fontFamily: GoogleFonts.chivo().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: primaryAppColor),
            ),
            const SizedBox(
              height: 24,
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
                    backgroundImage: AssetImage("assets/plus.png"),
                  ),
                )
              ],
            ),
            FutureBuilder(
                future: FirebaseStorageMethods().getClient(_firebaseUser!.uid),
                builder: (context, AsyncSnapshot<Client?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    _firstnameController.text = snapshot.data?.firstName ?? "";
                    _lastnameController.text = snapshot.data?.lastName ?? "";
                    _phoneNumberController.text =
                        snapshot.data?.phoneNumber ?? "";
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16, bottom: 4),
                              child: Text(
                                "First Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your First Name";
                                } else if (!RegExp('[a-zA-Z]')
                                    .hasMatch(value)) {
                                  return "Please enter a valid First Name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              controller: _firstnameController,
                              decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: primaryAppColor,
                                      fontWeight: FontWeight.w600),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primaryAppColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primaryAppColor, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: accentAppColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16, bottom: 4),
                              child: Text(
                                "Last Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Last Name";
                                } else if (!RegExp('[a-zA-Z]')
                                    .hasMatch(value)) {
                                  return "Please enter a valid Last Name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              controller: _lastnameController,
                              decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: primaryAppColor,
                                      fontWeight: FontWeight.w600),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primaryAppColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primaryAppColor, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: accentAppColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16, bottom: 4),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Last Name";
                                } else if (!RegExp('[a-zA-Z]')
                                    .hasMatch(value)) {
                                  return "Please enter a valid Last Name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                      color: primaryAppColor,
                                      fontWeight: FontWeight.w600),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primaryAppColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: primaryAppColor, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: accentAppColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                          ]),
                    );
                  }
                  return Container();
                }),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        primary: primaryAppColor),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
