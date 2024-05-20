import 'package:flutter/material.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/utils/validators/base_validator.dart';

class RequiredValidator extends BaseValidator {
  RequiredValidator();

  @override
  String getMessage(BuildContext? context) {
    return translate.required;
  }

  @override
  bool validate(String? value) {
    return value?.isNotEmpty ?? false;
  }
}
