import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/firebase/firebase_auth.dart';
import 'package:dentmind_dental_centre/global_constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordValid = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your First Name";
                          } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                            return "Enter a valid First Name";
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Last Name";
                          } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                            return "Please enter a valid Last Name";
                          }
                          return null;
                        },
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
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an Email Address";
                    } else if (!EmailValidator.validate(value.trim())) {
                      return "Please enter a valid Email Address";
                    }
                    return null;
                  }),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: primaryAppColor, fontWeight: FontWeight.w600),
                      labelText: "Email",
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
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: "Set Password",
                        labelStyle: const TextStyle(
                            color: primaryAppColor,
                            fontWeight: FontWeight.w600),
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
                        ))),
                const SizedBox(
                  height: 4,
                ),
                FlutterPwValidator(
                    controller: _passwordController,
                    uppercaseCharCount: 1,
                    numericCharCount: 1,
                    minLength: 6,
                    width: 400,
                    height: 105,
                    onSuccess: () {
                      setState(() {
                        _isPasswordValid = true;
                      });
                    },
                    onFail: () {
                      setState(() {
                        _isPasswordValid = false;
                      });
                    }),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the password confirmation";
                      } else if (_confirmPasswordController.text !=
                          _passwordController.text) {
                        return "Password do not match,please enter the same password";
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: const TextStyle(
                            color: primaryAppColor,
                            fontWeight: FontWeight.w600),
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
                        ))),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate() & _isPasswordValid) {
                      setState(() {
                        _isLoading = true;
                      });
                      bool _userCreated = await FirebaseUserRepo().signupUser(
                          context,
                          _emailController.text.trim(),
                          _passwordController.text.trim());
                      setState(() {
                        _isLoading = false;
                      });
                      if (_userCreated) {
                        Navigator.pushReplacementNamed(context, dashboardRoute);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: primaryAppColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const Text(
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
          ),
        ),
      )),
    );
  }
}
