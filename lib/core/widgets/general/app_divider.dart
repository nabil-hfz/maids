import 'package:flutter/material.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';

import 'package:provider/provider.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;

  const AppDivider({super.key, this.height, this.color, this.thickness});

  factory AppDivider.withoutHeight() {
    return const AppDivider(height: 0, thickness: 0);
  }

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    return Divider(
      height: height ?? 20.0,
      color: color ?? themeStore.appColors.dividerColor,
      indent: 0,
      endIndent: 0,
      thickness: thickness,
    );
  }
}
