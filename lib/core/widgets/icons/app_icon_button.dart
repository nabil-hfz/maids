// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/app_radius.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:provider/provider.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconSize,
  });

  final Widget icon;
  final Function()? onPressed;
  final Color? backgroundColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      splashRadius: AppRadius.radius20,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      icon: icon,
    );
  }
}
