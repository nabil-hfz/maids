import 'package:flutter/material.dart';

/// An abstract base class for creating custom validation classes.
///
/// This class provides a base structure for creating validators
/// and applying them to input values. Extend this class to implement
/// custom validation logic.
abstract class BaseValidator {
  /// Validates the given [value] according to the implemented validation logic.
  ///
  /// Returns `true` if the [value] is valid, `false` otherwise.
  bool validate(String? value);

  /// Returns the validation error message for the implemented validation logic.
  ///
  /// The [context] is an optional [BuildContext] that can be used to retrieve
  /// localizations or other context-dependent resources.
  String getMessage(BuildContext? context);

  /// Validates the given [value] using the provided list of [validators].
  ///
  /// The [context] is an optional [BuildContext] that can be used to retrieve
  /// localizations or other context-dependent resources.
  /// The [validators] is a list of [BaseValidator] instances to apply to the [value].
  /// The [isValidationActive] is a boolean that indicates whether the validation
  /// process is active. If it's `false`, the function will not perform any validation
  /// and will return `null`.
  ///
  /// Returns the error message of the first failed validation, or `null` if all
  /// validations pass or if [isValidationActive] is `false`.
  static String? validateValue(
    BuildContext? context,
    String? value,
    List<BaseValidator> validators,
    bool isValidationActive,
  ) {
    if (!isValidationActive) return null;
    for (int i = 0; i < validators.length; i++) {
      if (!validators[i].validate(value)) {
        return validators[i].getMessage(context);
      }
    }
    return null;
  }
}
