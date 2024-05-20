// Dart imports:
// Package imports:
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

class AppUtils {
  static AppUtils instance = AppUtils._();

  AppUtils._();

  static bool notNullOrEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }

  static languagePlatform({arabic, english}) {
    if (findDep<AppLanguageManager>().isEnglish) {
      return english;
    }
    return arabic;
  }

  static showToast({
    required String message,
    Toast? toastLength,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: AppTextSize.size_16,
    );
  }

  static Future<T?> appShowDialog<T>({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return builder(context);
      },
    );
  }

  static Future<T?> _showCustomMessage<T>({
    required BuildContext context,
    String? title,
    String? message,
    Widget? titleText,
    Widget? messageText,
    Color? backgroundColor,
    Color? titleColor,
    FlushbarPosition position = FlushbarPosition.TOP,
    Curve reverseAnimationCurve = Curves.decelerate,
    Curve forwardAnimationCurve = Curves.elasticOut,
    bool isDismissible = true,
    Duration? duration,
    Widget? icon,
    Widget? mainButton,
  }) async {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(
      context,
      listen: false,
    );

    return Flushbar<T>(
      title: title,
      titleColor: titleColor,
      message: message,
      flushbarPosition: position,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: reverseAnimationCurve,
      forwardAnimationCurve: forwardAnimationCurve,
      backgroundColor:
          backgroundColor ?? themeStore.appColors.flushBarBackground,
      isDismissible: isDismissible,
      duration: duration ??
          const Duration(
            milliseconds: AppDuration.flushbarDuration,
          ),
      icon: icon,
      mainButton: mainButton,
      titleText: titleText,
      messageText: messageText,
    ).show(context);
  }

  static Future<T?> showWarningMessage<T>({
    required BuildContext context,
    String? title,
    String? message,
    Widget? titleText,
    Widget? messageText,
    Duration? duration,
    Color? titleColor,
    Color? iconColor,
    FlushbarPosition position = FlushbarPosition.BOTTOM,
  }) async {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(
      context,
      listen: false,
    );
    return _showCustomMessage(
      title: title,
      titleColor: titleColor,
      message: message,
      position: position,
      context: context,
      duration: duration,
      icon: Icon(
        Icons.warning_amber_rounded,
        size: AppIconSize.size_16,
        color: iconColor ?? themeStore.appColors.iconColor,
      ),
    );
  }

  static Future<T?> showErrorMessage<T>({
    required BuildContext context,
    String? title,
    String? message,
    Widget? titleText,
    Widget? messageText,
    Color? titleColor,
    Color? iconColor,
    FlushbarPosition position = FlushbarPosition.BOTTOM,
  }) async {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(
      context,
      listen: false,
    );
    return _showCustomMessage<T>(
      title: title,
      titleColor: titleColor,
      message: message,
      position: position,
      context: context,
      backgroundColor: themeStore.appColors.flushBarErrorBackground,
      icon: Icon(
        Icons.error_outline,
        size: AppIconSize.size_24,
        color: iconColor ?? themeStore.appColors.iconReversedColor,
      ),
    );
  }

  static Future<T?> showSuccessMessage<T>({
    required BuildContext context,
    required String? message,
    String? title,
    Widget? titleText,
    Widget? messageWidget,
    Color? titleColor,
    Color? iconColor,
    FlushbarPosition position = FlushbarPosition.BOTTOM,
  }) async {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(
      context,
      listen: false,
    );
    return _showCustomMessage<T>(
      title: title,
      titleColor: titleColor,
      message: message,
      position: position,
      context: context,
      backgroundColor: themeStore.appColors.flushBarSuccessBackground,
      icon: Icon(
        Icons.check_circle,
        size: AppIconSize.size_24,
        color: iconColor ?? themeStore.appColors.iconReversedColor,
      ),
    );
  }
}

AppUtils appUtils = AppUtils.instance;
