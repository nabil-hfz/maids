import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/colors/app_colors.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/localization/generated/l10n.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/widgets/general/base_stateful_app_widget.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';

enum CurrentTab { home, more }

class MainRootPage extends BaseAppStatefulWidget {
  const MainRootPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  _MainRootPageState createBaseState() => _MainRootPageState();
}

class _MainRootPageState extends BaseAppState<MainRootPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onWillPop,
      child: AdaptiveScaffold(
        smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
        mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
        largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
        bodyRatio: 1,
        onSelectedIndexChange: onTap,
        selectedIndex: widget.navigationShell.currentIndex,
        destinations: _buildDestinations(context),
        body: (_) => widget.navigationShell,
        smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
      ),
    );
  }

  void onTap(index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  List<NavigationDestination> _buildDestinations(BuildContext context) {
    return [
      _buildNavigationDestination(
        Assets.icons.home.path,
        Translations.of(context).home,
      ),
      _buildNavigationDestination(
        Assets.icons.more.path,
        Translations.of(context).more,
      ),
    ];
  }

  NavigationDestination _buildNavigationDestination(
    String imagePath,
    String title, {
    Color selectedColor = AppColors.appPrimaryColor,
  }) {
    return NavigationDestination(
      label: title,
      tooltip: title,
      icon: AppImageWidget(
        path: imagePath,
        color: appTheme.appColors.iconGreyColor,
        height: AppIconSize.size_18,
        width: AppIconSize.size_18,
        boxFit: BoxFit.contain,
      ),
      selectedIcon: AppImageWidget(
        path: imagePath,
        color: selectedColor,
        height: AppIconSize.size_20,
        width: AppIconSize.size_20,
        boxFit: BoxFit.contain,
      ),
    );
  }

  DateTime? currentTime;

  bool get isInHomePage {
    return widget.navigationShell.currentIndex == CurrentTab.home.index;
  }

  bool isPressedInLessThanTwoSeconds() {
    final now = DateTime.now();
    return currentTime == null ||
        now.difference(currentTime!).inMilliseconds > 2000;
  }

  void _onWillPop(didPop) async {
    if (didPop) {
      return;
    }
    DateTime now = DateTime.now();
    if (!isInHomePage) {
      onTap(CurrentTab.home.index);
    } else if (currentTime == null ||
        now.difference(currentTime!).inMilliseconds > 2000) {
      //add duration of press gap
      currentTime = now;
      setState(() {});
      AppUtils.showToast(message: translate.press_again_to_exit);
    } else {
      SystemNavigator.pop();
      // exit(0);
    }
  }
}
