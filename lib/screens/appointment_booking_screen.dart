import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:flutter/material.dart';

class AppoitnmentBooking extends StatefulWidget {
  const AppoitnmentBooking({Key? key}) : super(key: key);

  @override
  State<AppoitnmentBooking> createState() => _AppoitnmentBookingState();
}

class _AppoitnmentBookingState extends State<AppoitnmentBooking> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Book an Appoitment",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: primaryAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            Row(
              children: [
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
                                color: primaryAppColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryAppColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: accentAppColor, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
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
                                color: primaryAppColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: primaryAppColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: accentAppColor, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
