import 'package:flutter/material.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmerWidget extends StatelessWidget {
  final Widget? child;

  const BaseShimmerWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    return Shimmer.fromColors(
      baseColor: themeStore.appColors.shimmerBaseColor,
      highlightColor: themeStore.appColors.shimmerHighlightColor,
      child: child!,
    );
  }
}
