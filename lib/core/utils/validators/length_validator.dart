import 'package:flutter/material.dart';

import 'base_validator.dart';

class MinLengthValidator extends BaseValidator {
  final int minLength;

  MinLengthValidator({required this.minLength});

  @override
  String getMessage(BuildContext? context) {
    return "translate.validator_should_be_with_minimum_length_of_characters(minLength)";
  }

  @override
  bool validate(String? value) {
    return (value?.length ?? 0) >= minLength;
  }
}

class MaxLengthValidator extends BaseValidator {
  final int maxLength;

  MaxLengthValidator({required this.maxLength});

  @override
  String getMessage(BuildContext? context) {
    return "translate.validator_should_be_with_maximum_length_of_characters(maxLength)";
  }

  @override
  bool validate(String? value) {
    return (value?.length ?? 0) <= maxLength;
  }
}
