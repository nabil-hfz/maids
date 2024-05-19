import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:maids/core/bloc/base/states/base_success_state.dart';
import 'package:maids/core/constants/app_animation_duration.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/utils/device_utils.dart';
import 'package:maids/core/widgets/general/salony_app_bar.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:maids/modules/auth/domain/blocs/auth_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppThemeManager _themeManager;
  late AuthCubit _cubit;
  bool hasNavigated = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _cubit = findDep<AuthCubit>();
    _cubit.checkIfLoggedIn();
    _timer = startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeManager = context.read<AppThemeManager>();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1);
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.isLoggedIn is AppFirstLoadSuccess) {
          navigator.goNamedAndRemoveUntil(Routes.logInPage);
          return;
        } else if (state.isLoggedIn is ContinueToLoginSuccess) {
          if (mounted) {
            setState(() {
              hasNavigated = true;
            });
          }
          navigator.goNamedAndRemoveUntil(Routes.logInPage);
        } else if (state.isLoggedIn is BaseSuccessState) {
          if (mounted) {
            setState(() {
              hasNavigated = true;
            });
          }
          navigator.goNamedAndRemoveUntil(Routes.homePage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: _themeManager.appColors.scaffoldBgColor,
          appBar: SalonyAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: _themeManager.appColors.splashAppBarColor,
          ),
          body: SafeArea(
            child: SizedBox(
              height: height,
              width: width,
              child: Center(
                child: AppImageWidget(
                  path: Assets.images.appLauncher.path,
                  width: 160,
                  height: 160,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Timer startTimer() {
    var duration = const Duration(seconds: AppDuration.splashScreenDuration);
    return Timer(duration, navigate);
  }

  navigate() async {
    if (!hasNavigated) {
      navigator.goNamedAndRemoveUntil(Routes.logInPage);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
