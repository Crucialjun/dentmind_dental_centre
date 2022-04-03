import 'dart:convert';

import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/utils/text_field_validators.dart';
import 'package:dentmind_dental_centre/utils/text_form_decoration.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../models/services_model.dart';

class AppoitnmentBooking extends StatefulWidget {
  const AppoitnmentBooking({Key? key}) : super(key: key);

  @override
  State<AppoitnmentBooking> createState() => _AppoitnmentBookingState();
}

class _AppoitnmentBookingState extends State<AppoitnmentBooking> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final List<String> branches = [
    'Kitengela',
    'Mombasa Road',
    'Buruburu',
  ];
  List listOfServices = [];
  String? selectedBranch;
  String? selectedService;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  bool isDateSelected = false;
  bool isTimeSelected = false;
  @override
  void initState() {
    super.initState();
    loadServices();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryAppColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset("assets/appointment.svg")),
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
                    validator: (value) => firstNameValidator(value),
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    decoration:
                        const TextFormDecoration(labelString: "First name"),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) => lastNameValidator(value),
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                    decoration:
                        const TextFormDecoration(labelString: "Last name"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) => emailValidator(value),
              keyboardType: TextInputType.name,
              controller: _lastNameController,
              decoration: const TextFormDecoration(labelString: "Email"),
            ),
            const SizedBox(
              height: 16,
            ),
            IntlPhoneField(
              initialCountryCode:
                  WidgetsBinding.instance!.window.locale.countryCode,
              decoration: const TextFormDecoration(labelString: "Phone Number"),
            ),
            DropdownButtonFormField2(
              focusColor: Colors.white,
              value: selectedBranch,
              items: branches
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration:
                  const TextFormDecoration(labelString: "Choose Branch"),
              validator: (value) {
                if (value == null) {
                  return 'Please Select Branch';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
              },
              onSaved: (value) {
                selectedBranch = value.toString();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownButtonFormField2(
              focusColor: Colors.white,
              value: selectedService,
              items: listOfServices
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              decoration:
                  const TextFormDecoration(labelString: "Choose Service"),
              validator: (value) {
                if (value == null) {
                  return 'Please Select Service';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
              },
              onSaved: (value) {
                selectedBranch = value.toString();
              },
            ),
            Row(
              children: [
                const Text(
                  'Pick a date for the appointment',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                TextButton(
                    onPressed: () async {
                      var dateSelected = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2030));

                      if (dateSelected != null &&
                          dateSelected != _selectedDate) {
                        setState(() {
                          _selectedDate = dateSelected;
                        });
                      }
                    },
                    child: Text(
                        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                        style: const TextStyle(
                          color: primaryAppColor,
                          fontWeight: FontWeight.w600,
                        ))),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text(
                  'Pick a date for the appointment',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                TextButton(
                    onPressed: () async {
                      var timeSelected = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(_selectedDate));

                      if (timeSelected != null &&
                          timeSelected != _selectedTime) {
                        setState(() {
                          _selectedTime = timeSelected;
                        });
                      }
                    },
                    child: Text("${_selectedTime.hour}:${_selectedTime.minute}",
                        style: const TextStyle(
                          color: primaryAppColor,
                          fontWeight: FontWeight.w600,
                        ))),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Enter additional appointment details",
                style: TextStyle(
                  color: primaryAppColor,
                  fontWeight: FontWeight.w600,
                )),
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLength: null,
              maxLines: null,
              decoration: TextFormDecoration(labelString: ""),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: accentAppColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: primaryAppColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Book Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Future loadServices() async {
    var list = await rootBundle.loadString('assets/services.json');

    List decode = jsonDecode(list);

    for (var i = 0; i < decode.length; i++) {
      var services = DentmindServices.fromJson(decode[i]);
      listOfServices.add(services.serviceName);
    }

    setState(() {});
  }
}
