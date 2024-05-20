// Flutter imports:
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// Project imports:
import 'package:maids/core/constants/constants.dart';
// import 'package:maids/core/managers/managers.dart';

class AppTitleHeader extends StatelessWidget {
  const AppTitleHeader({
    super.key,
    required this.title,
    this.style,
  });
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    // var appTheme = Provider.of<AppThemeManager>(context);
    return Text(
      title,
      style: style ??
          appTextStyle.semiBold18.copyWith(
              // color: appTheme.appColors.textColor,
              ),
      textAlign: TextAlign.center,
    );
  }
}
