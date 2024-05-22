import 'package:flutter/material.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';

import 'package:provider/provider.dart';

import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
    this.width,
    this.height,
    this.path,
    this.message,
    this.messageChild,
    this.withImage = true,
  }) : assert(
          !(message != null && messageChild != null),
          "You should pass only one message content",
        );
  final double? width;
  final double? height;
  final String? message;
  final Widget? messageChild;
  final bool withImage;
  final String? path;

  @override
  Widget build(BuildContext context) {
    AppThemeManager appTheme =
        Provider.of<AppThemeManager>(context, listen: true);

    return Container(
      width: height ?? MediaQuery.of(context).size.width,
      height: height ??
          (withImage ? MediaQuery.of(context).size.height * 0.6 : null),
      padding: const EdgeInsets.all(AppDimens.space12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withImage)
            LayoutBuilder(
              builder: (context, constraints) {
                final size = constraints.maxWidth * .6;
                return AppImageWidget(
                  path: path ?? Assets.icons.resultNotFound.path,
                  width: size,
                  height: size,
                  boxFit: BoxFit.fitHeight,
                );
              },
            ),
          const SizedBox(height: AppDimens.space32),
          if (messageChild != null) messageChild!,
          if (messageChild == null)
            message == null || message!.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.space12,
                    ),
                    child: Column(
                      children: [
                        Text(
                          translate.whoops_info,
                          textAlign: TextAlign.center,
                          style: appTextStyle.bold16.copyWith(
                            color: appTheme.appColors.headerTextFieldColor,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppDimens.space12),
                        Text(
                          translate.no_result_found,
                          textAlign: TextAlign.center,
                          style: appTextStyle.regular14.copyWith(
                            color: appTheme.appColors.textSubTitle,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.space12,
                    ),
                    child: Text(
                      message!,
                      textAlign: TextAlign.center,
                      style: appTextStyle.medium16.copyWith(
                        color: appTheme.appColors.textSubTitle,
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
