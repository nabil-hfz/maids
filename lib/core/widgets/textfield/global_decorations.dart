import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_radius.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';

abstract class GlobalDecorations {
  static InputDecoration get kNormalFieldInputDecoration {
    AppThemeManager appThemeManager = findDep<AppThemeManager>();
    return InputDecoration(
      fillColor: appThemeManager.appColors.fillTextFieldColor,
      labelStyle: appTextStyle.regular14.copyWith(
        color: appThemeManager.appColors.textColor,
      ),
      errorStyle: appTextStyle.light12.copyWith(
        color: appThemeManager.appColors.textErrorColor,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appThemeManager.appColors.fillTextFieldColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: appThemeManager.appColors.borderTextFieldColor,
        ),
      ),
    );
  }

  static InputDecoration get normalFieldUerManagementNInputDecoration {
    AppThemeManager appThemeManager = findDep<AppThemeManager>();
    return InputDecoration(
      filled: true,
      alignLabelWithHint: true,
      fillColor: appThemeManager.appColors.fillTextFieldColor,
      hintStyle: TextStyle(color: appThemeManager.appColors.hintColor),
      labelStyle: appTextStyle.regular14.copyWith(
        color: appThemeManager.appColors.textColor,
      ),
      errorStyle: appTextStyle.light12.copyWith(
        color: appThemeManager.appColors.textErrorColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppRadius.radius16),
        ),
        borderSide: BorderSide(
          color: appThemeManager.appColors.borderTextFieldColor,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.radius16),
        ),
      ),
    );
  }
}
