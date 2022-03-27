import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              "Let's Log in",
              style: TextStyle(
                  fontFamily: GoogleFonts.chivo().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: Colors.black),
            ),
            const Text(
              "Welcome back, you've been missed!",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
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
              child: InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  bool isLoggedIn = await FirebaseUserRepo().loginUser(context,
                      _emailController.text.trim(), _passwordController.text);
                  setState(() {
                    isLoading = false;
                  });

                  if (isLoggedIn) {
                    Navigator.pushReplacementNamed(context, dashboardRoute);
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: primaryAppColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Log In",
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
                const Text("Dont have an account?"),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, signupRoute);
                  },
                  child: const Text(
                    "Sign Up",
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
