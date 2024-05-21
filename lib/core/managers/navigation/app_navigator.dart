// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/managers/navigation/app_router.dart';
import 'package:maids/core/utils/device_utils.dart';

@Singleton()
class AppNavigator {
  AppNavigator();

  GlobalKey<NavigatorState> get navigatorKey => AppRouter.parentKey;

  GoRouter get router => AppRouter.router;

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    dynamic extra,
    Map<String, String>? pathParameters,
  }) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    return router.pushNamed<T>(
      routeName,
      extra: extra,
      pathParameters: pathParameters ?? {},
    );
  }

  void go<T>(String routeName, {dynamic extra}) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    router.go(
      routeName,
      extra: extra,
    );
  }

  void goNamed(
    String routeName, {
    dynamic extra,
    Map<String, String>? pathParameters,
  }) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    router.goNamed(
      routeName,
      extra: extra,
      pathParameters: pathParameters ?? {},
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?>(
    String routeName, {
    dynamic extra,
  }) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    return router.pushReplacementNamed<T>(routeName, extra: extra);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName,
      {Object? extra}) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    while (router.canPop()) {
      router.pop();
    }
    return router.pushReplacementNamed(routeName, extra: extra);
  }

  void goNamedAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? extra,
  }) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    while (router.canPop()) {
      router.pop();
    }
    return router.goNamed(routeName, extra: extra);
  }

  void pop<T>([T? result]) {
    DeviceUtils.hideKeyboard(navigatorKey.currentContext!);
    if (canPop()) router.pop(result);
  }

  bool canPop() {
    return router.canPop();
  }
}
