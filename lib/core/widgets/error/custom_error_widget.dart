// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maids/core/errors/types/base_error.dart';
import 'package:maids/core/utils/device_utils.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  final double? width;
  final Function()? callback;
  final BaseError? error;

  const CustomErrorWidget({
    super.key,
    this.callback,
    this.error,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    double widthC = width ?? DeviceUtils.getScaledWidth(context, 1);
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    return SizedBox(
      width: widthC,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_outlined,
              size: widthC * .5,
              color: themeStore.appColors.iconActiveColor,
            ),
            const VerticalPadding(percentage: 0.04),
            Text(
              translate.whoops,
              textAlign: TextAlign.center,
              style: appTextStyle.bold18.copyWith(
                color: themeStore.appColors.textColor,
              ),
            ),
            const VerticalPadding(percentage: 0.02),
            Text(
              error?.message ?? translate.something_went_wrong_please_try_again,
              textAlign: TextAlign.center,
              style: appTextStyle.medium16.copyWith(
                color: themeStore.appColors.textColor,
              ),
            ),
            const VerticalPadding(percentage: 0.02),
            ElevatedButton(
              onPressed: callback,
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.radius16),
                  ),
                ),
              ),
              child: Text(
                translate.try_again,
                style: appTextStyle.bold16.copyWith(
                  color: themeStore.appColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
