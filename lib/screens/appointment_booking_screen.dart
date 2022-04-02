import 'package:dentmind_dental_centre/app_colors.dart';
import 'package:dentmind_dental_centre/utils/text_field_validators.dart';
import 'package:dentmind_dental_centre/utils/text_form_decoration.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  String? selectedBranch;

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
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: const Text(
                  'show date time picker (Chinese)',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      )),
    );
  }
}
