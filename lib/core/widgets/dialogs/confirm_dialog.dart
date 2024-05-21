import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/dialogs/base_dialog.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:provider/provider.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String desc;
  final String? confirmStr;
  final String? cancelStr;
  final Color? confirmColor;
  final Color? cancelColor;
  final Function()? confirmAction;

  const ConfirmDialog({
    super.key,
    required this.desc,
    required this.title,
    required this.confirmAction,
    this.cancelStr,
    this.confirmStr,
    this.confirmColor,
    this.cancelColor,
  });

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    return BaseDialog(
      title: title,
      withDivider: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimens.space4),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              desc,
              style: appTextStyle.medium16.copyWith(
                color: themeStore.appColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const VerticalPadding(percentage: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text(
                  cancelStr ?? translate.cancel,
                  style: appTextStyle.medium16.copyWith(
                    color: cancelColor ?? themeStore.appColors.textGreyColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                onPressed: confirmAction != null
                    ? () {
                        Navigator.pop(context);
                        confirmAction!();
                      }
                    : null,
                child: Text(
                  confirmStr ?? translate.confirm,
                  style: appTextStyle.medium16.copyWith(
                    color: confirmColor ?? themeStore.appColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
