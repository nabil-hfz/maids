import 'package:flutter/material.dart';

/// Helper class for device related operations.
class DeviceUtils {
  ///
  /// hides the keyboard if its already open
  ///
  static hideKeyboard(BuildContext? context) {
    if (context != null) {
      FocusScope.of(context).unfocus();
    }
  }

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  ///
  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height
  ///
  static EdgeInsets getViewPadding(BuildContext context) =>
      MediaQuery.of(context).viewPadding;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
  ///
  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height
  ///
  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}
