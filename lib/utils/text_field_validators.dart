import 'package:email_validator/email_validator.dart';

String? firstNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your First Name";
  } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
    return "Enter a valid First Name";
  }
  return null;
}

String? lastNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your Last Name";
  } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
    return "Enter a valid Last Name";
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter an Email Address";
  } else if (!EmailValidator.validate(value.trim())) {
    return "Please enter a valid Email Address";
  }
  return null;
}
