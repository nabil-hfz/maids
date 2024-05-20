import 'package:flutter/material.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/buttons/bouncing_button.dart';
import 'package:maids/core/widgets/dialogs/base_dialog.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';

import 'package:provider/provider.dart';

import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';

import '../images/app_image_widget.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback? onConfirm;
  final VoidCallback onCancel;
  final bool isOnConfirmLoading;

  const LogoutDialog({
    super.key,
    required this.onCancel,
    required this.onConfirm,
    this.isOnConfirmLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    return BaseDialog(
      withDivider: false,
      title: "",
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageWidget(
              path: Assets.icons.logout.path,
              width: AppIconSize.size_66,
              height: AppIconSize.size_66,
            ),
            const VerticalPadding(
              percentage: 0.06,
            ),
            Text(
              translate.log_out,
              style: appTextStyle.semiBold.copyWith(
                  color: themeStore.appColors.textColor,
                  fontSize: AppTextSize.size_22),
            ),
            const VerticalPadding(
              percentage: 0.03,
            ),
            Text(
              translate.logout_message,
              style: appTextStyle.light12
                  .copyWith(color: themeStore.appColors.textColor),
            ),
            const VerticalPadding(
              percentage: 0.06,
            ),
            BouncingButton(
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  themeStore.appColors.primaryColor,
                ),
                textStyle: MaterialStateProperty.all(
                  appTextStyle.medium16.copyWith(
                    color: themeStore.appColors.textReversedColor,
                  ),
                ),
              ),
              title: isOnConfirmLoading
                  ? AppLoader(
                      size: AppLoaderSize.tiny,
                      iconColor: themeStore.appColors.iconReversedColor,
                    )
                  : null,
              height: 50,
              text: translate.log_out,
              onPressed: isOnConfirmLoading ? null : onConfirm,
            ),
            const VerticalPadding(
              percentage: 0.03,
            ),
            BouncingButton(
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    themeStore.appColors.logoutCancelBtnColor),
                textStyle: MaterialStateProperty.all(
                  appTextStyle.medium16.copyWith(
                    color: themeStore.appColors.primaryColor,
                  ),
                ),
              ),
              height: 50,
              text: translate.cancel,
              onPressed: onCancel,
            ),
            const VerticalPadding(
              percentage: 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
