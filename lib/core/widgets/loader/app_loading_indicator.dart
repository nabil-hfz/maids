// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

enum AppLoaderSize {
  microscopic,
  tiny,
  small,
  normal,
}

class AppLoader extends StatelessWidget {
  final AppLoaderSize size;
  final Color? iconColor;

  const AppLoader({
    super.key,
    this.size = AppLoaderSize.small,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    double size = 40;
    if (this.size == AppLoaderSize.small) size = 40;
    if (this.size == AppLoaderSize.tiny) size = 24;
    if (this.size == AppLoaderSize.microscopic) size = 18;
    return Center(
      child: SpinKitFadingFour(
        size: size,
        color: iconColor ?? themeStore.appColors.loaderColor,
      ),
    );
  }
}
