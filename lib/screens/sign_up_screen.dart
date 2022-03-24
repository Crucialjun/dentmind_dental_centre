import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/logo.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Text(
              "Let's Create an Account",
              style: TextStyle(
                  fontFamily: GoogleFonts.chivo().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: Colors.black),
            ),
            const Text(
              "Create your Dentmind Account in an easy way ",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            color: primaryAppColor,
                            fontWeight: FontWeight.w600),
                        labelText: "First Name",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryAppColor, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryAppColor, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: accentAppColor, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            color: primaryAppColor,
                            fontWeight: FontWeight.w600),
                        labelText: "Last Name",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryAppColor, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryAppColor, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: accentAppColor, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                  labelStyle: const TextStyle(
                      color: primaryAppColor, fontWeight: FontWeight.w600),
                  labelText: "Email",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryAppColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryAppColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: accentAppColor, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Set Password",
                    labelStyle: const TextStyle(
                        color: primaryAppColor, fontWeight: FontWeight.w600),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: primaryAppColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: primaryAppColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: accentAppColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: const TextStyle(
                        color: primaryAppColor, fontWeight: FontWeight.w600),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: primaryAppColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: primaryAppColor, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: accentAppColor, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                FirebaseUserRepo().signupUser(_emailController.text.trim(),
                    _passwordController.text.trim());
                Navigator.pushReplacementNamed(context, dashboardRoute);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: primaryAppColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, signinRoute);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Or Connect'),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: primaryAppColor)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/facebook.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: primaryAppColor)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/google.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      )),
    );
  }
}
