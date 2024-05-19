// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/icons/app_back_icon_widget.dart';

// Package imports:
import 'package:provider/provider.dart';

class SalonyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SalonyAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.customTitle,
    this.statusBarColor,
    this.backgroundColor,
    this.arrowBackColor,
    this.systemOverlayStyle,
    this.toolbarHeight,
    this.bottom,
    this.titleColor,
    this.onBackPressed,
    this.elevation = 0.0,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
  });

  final String? title;
  final bool centerTitle;
  final double? elevation;
  final double? toolbarHeight;
  final Function()? onBackPressed;

  final Widget? leading;
  final Widget? customTitle;
  final List<Widget>? actions;
  final Color? statusBarColor;
  final Color? backgroundColor;
  final Color? arrowBackColor;
  final Color? titleColor;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    double leftPadding = automaticallyImplyLeading ? 0.0 : AppDimens.space4;
    AppThemeManager themeManager = Provider.of<AppThemeManager>(context);

    Widget? title;
    Widget? leading;
    if (automaticallyImplyLeading) {
      leading = AppBackIconWidget(
        onPressed: onBackPressed ?? Navigator.of(context).pop,
        color: arrowBackColor ?? themeManager.appColors.iconColor,
      );
    } else if (this.leading != null) {
      leading = this.leading;
    }
    if (customTitle != null) {
      title = customTitle;
    } else {
      title = CustomAppBarTextWidget(
        title: this.title ?? '',
        titleColor: titleColor ?? themeManager.appColors.textColor,
      );
    }
    return AppBar(
      title: title,
      toolbarHeight: preferredSize.height,
      bottom: bottom,
      leading: leading,
      actions: actions,
      elevation: elevation,
      centerTitle: centerTitle,
      titleSpacing: leftPadding,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        toolbarHeight ??
            (customTitle == null
                ? (kToolbarHeight + (bottom != null ? kTextTabBarHeight : 0))
                : 65),
      );
}

class CustomAppBarTextWidget extends StatelessWidget {
  const CustomAppBarTextWidget(
      {super.key, required this.title, this.titleColor});

  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppThemeManager>(context);
    List<Widget> titleColumn = [
      Text(
        title,
        style: appTextStyle.bold18.copyWith(
          color: titleColor ?? theme.appColors.textColor,
        ),
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: titleColumn,
    );
  }
}
