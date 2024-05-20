import 'package:flutter/material.dart';
import 'package:maids/core/utils/device_utils.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';

import 'package:provider/provider.dart';

import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';

class ConnectionErrorWidget extends StatelessWidget {
  final double? width;
  final Function() callback;

  const ConnectionErrorWidget({super.key, this.width, required this.callback});

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
            AppImageWidget(
              path: Assets.images.appLauncher.path,
              width: widthC * .5,
              height: widthC * .5,
            ),
            const VerticalPadding(percentage: 0.04),
            Text(
              translate.whoops,
              textAlign: TextAlign.center,
              style: appTextStyle.bold18.copyWith(
                color: themeStore.appColors.textGreyColor,
              ),
            ),
            const VerticalPadding(percentage: 0.02),
            Text(
              translate.something_went_wrong_check_connection,
              textAlign: TextAlign.center,
              style: appTextStyle.medium16.copyWith(
                color: themeStore.appColors.hintColor,
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
