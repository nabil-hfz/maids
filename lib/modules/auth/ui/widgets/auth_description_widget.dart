import 'package:flutter/material.dart';

import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

class AuthDescriptionWidget extends StatelessWidget {
  const AuthDescriptionWidget({
    super.key,
    required this.text,
    this.value,
  });
  final String text;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppThemeManager>(context);

    return Text.rich(
      TextSpan(
        text: '$text${value != null ? ' ' : ''}',
        children: (value != null)
            ? [
                TextSpan(
                  text: value,
                  style: appTextStyle.regular16.copyWith(
                    color: appTheme.appColors.textActiveColor,
                    decoration: TextDecoration.underline,
                    decorationColor: appTheme.appColors.textActiveColor,
                  ),
                )
              ]
            : null,
      ),
      textAlign: TextAlign.center,
      style: appTextStyle.regular16.copyWith(
          // color: appTheme.appColors.textColor,
          ),
    );
  }
}
