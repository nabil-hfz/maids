// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/icons/app_icon_button.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:provider/provider.dart';

class AppBackIconWidget extends StatelessWidget {
  const AppBackIconWidget({
    super.key,
    this.color,
    this.withBgColor = true,
    this.onPressed,
  });

  final bool withBgColor;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeManager = Provider.of<AppThemeManager>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                withBgColor ? themeManager.appColors.iconReversedColor : null,
          ),
          width: AppIconSize.size_32,
          height: AppIconSize.size_32,
          child: AppIconButton(
            onPressed: onPressed ?? Navigator.of(context).pop, //onPressed,
            icon: RotatedBox(
              quarterTurns:
                  Directionality.of(context) == TextDirection.rtl ? 2 : 0,
              child: AppImageWidget(
                width: AppIconSize.size_18,
                height: AppIconSize.size_18,
                path: Assets.icons.arrowBack.path,
                color: color ?? themeManager.appColors.iconColor,
                // color: isSilverCollapsed.value ? AppColors.black : AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
