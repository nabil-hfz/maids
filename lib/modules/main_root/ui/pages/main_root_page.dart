import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/colors/app_colors.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';

enum CurrentTab { home, more }

class MainRootPage extends StatefulWidget {
  const MainRootPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() => _MainRootPageState();
}

class _MainRootPageState extends State<MainRootPage> {
  late AppThemeManager _appTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    _appTheme = context.watch<AppThemeManager>();
    return PopScope(
      canPop: _canPop,
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
        translate.home,
      ),
      _buildNavigationDestination(
        Assets.icons.more.path,
        translate.more,
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
        color: _appTheme.appColors.iconGreyColor,
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

  get _canPop {
    return widget.navigationShell.currentIndex == CurrentTab.home.index;
  }

  Future<bool> _onWillPop(_) {
    bool isHome = widget.navigationShell.currentIndex == CurrentTab.home.index;
    if (!isHome) {
      onTap(CurrentTab.home.index);
    }
    return Future.value(isHome);
  }
}
