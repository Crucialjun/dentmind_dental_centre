import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/logo.png",
                height: 200,
                width: 200,
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
            TextFormField(
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
                decoration: InputDecoration(
                    labelText: "Password",
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
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
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
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Dont have an account?"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blue),
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
