import 'package:flutter/material.dart';

import 'base_validator.dart';

class EmailValidator extends BaseValidator {
  @override
  String getMessage(BuildContext? context) {
    return "";
  }

  @override
  bool validate(String? value) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) return true;
    return regex.hasMatch(value);
  }
}
