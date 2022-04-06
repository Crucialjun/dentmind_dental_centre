import 'dart:convert';

import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/firebase/firebase_storage_methods.dart';
import 'package:dentmind_dental_centre/models/client_model.dart';
import 'package:dentmind_dental_centre/utils/text_form_decoration.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';

import '../models/appointment_model.dart';
import '../models/services_model.dart';

class AppoitnmentBooking extends StatefulWidget {
  const AppoitnmentBooking({Key? key, required this.location})
      : super(key: key);

  final String location;

  @override
  State<AppoitnmentBooking> createState() => _AppoitnmentBookingState();
}

class _AppoitnmentBookingState extends State<AppoitnmentBooking> {
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
  PhoneNumber? _phoneNumber;
  Country? _country;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _extraDetailController = TextEditingController();

  bool isDateSelected = false;
  bool isTimeSelected = false;

  @override
  void initState() {
    super.initState();
    loadServices();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _extraDetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Client? _client = context.watch<Client?>();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryAppColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                  height: 240,
                  child: SvgPicture.asset("assets/appointment.svg")),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Book an Appointment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.chivo().fontFamily,
                      color: primaryAppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
              IntlPhoneField(
                autovalidateMode: AutovalidateMode.disabled,
                decoration:
                    const TextFormDecoration(labelString: "Phone Number"),
                controller: _phoneNumberController,
                onChanged: (phone) {
                  _phoneNumber = phone;
                },
                onCountryChanged: (country) {
                  _country = country;
                },
              ),
              DropdownButtonFormField2(
                focusColor: Colors.white,
                value: selectedBranch ?? widget.location,
                items: branches
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                decoration:
                    const TextFormDecoration(labelString: "Choose Branch"),
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value.toString();
                  });
                },
                onSaved: (value) {
                  setState(() {
                    selectedBranch = value.toString();
                  });
                },
              ),
              const SizedBox(
                height: 12,
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
                  setState(() {
                    selectedService = value.toString();
                  });
                },
                onSaved: (value) {},
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
                height: 12,
              ),
              Row(
                children: [
                  const Text(
                    'Pick the time for the appointment',
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
                      child: Text(
                          "${_selectedTime.hourOfPeriod}:${_selectedTime.minute}",
                          style: const TextStyle(
                            color: primaryAppColor,
                            fontWeight: FontWeight.w600,
                          ))),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text("Enter additional appointment details",
                  style: TextStyle(
                    color: primaryAppColor,
                    fontWeight: FontWeight.w600,
                  )),
              TextField(
                controller: _extraDetailController,
                keyboardType: TextInputType.multiline,
                maxLength: null,
                maxLines: null,
                decoration: const TextFormDecoration(labelString: ""),
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
                      onPressed: () {
                        var phoneNumber = _phoneNumber!.completeNumber;
                        var branch = selectedBranch;
                        var service = selectedService;
                        var date =
                            "${_selectedDate.toString()} ${_selectedTime.toString()}";
                        var additionalInfo = _extraDetailController.text;

                        Appointment appointment = Appointment(
                            clientuid: _client?.uid ?? "",
                            phonenumber: phoneNumber,
                            branch: branch ?? "",
                            service: service ?? "",
                            time: DateTime.now(),
                            additionalInfo: additionalInfo);

                        FirebaseStorageMethods().addAppointment(appointment);
                      },
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
