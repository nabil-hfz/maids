// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';

class HeaderItemWidget extends StatelessWidget {
  const HeaderItemWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    AppThemeManager appTheme = context.read<AppThemeManager>();

    BorderSide border = BorderSide(
      color: appTheme.appColors.borderColor,
      width: AppDimens.appLightDividerWidth,
    );

    return Container(
      decoration: BoxDecoration(
        color: appTheme.appColors.stickyHeaderColor,
        border: BorderDirectional(
          top: border,
          bottom: border,
        ),
        // color: Colors.amber,
      ),
      padding:
          const EdgeInsets.symmetric(vertical: AppDimens.verticalPadding16),
      alignment: Alignment.center,
      child: Text(
        text,
        style: appTextStyle.bold14.copyWith(
          color: appTheme.appColors.textColor,
        ),
      ),
    );
  }
}
