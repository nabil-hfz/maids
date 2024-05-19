import 'package:flutter/material.dart';
import 'package:maids/core/utils/validators/base_validator.dart';

class RequiredValidator extends BaseValidator {
  RequiredValidator();

  @override
  String getMessage(BuildContext? context) {
    return "";
  }

  @override
  bool validate(String? value) {
    return value?.isNotEmpty ?? false;
  }
}
