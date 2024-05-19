import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maids/core/constants/app_endpoints.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/utils/logger.dart';
import 'package:maids/modules/my_app.dart';

bool isProduction = true;
bool isRelease = true;

Future<void> main() async {
  AppEndpoints.baseUrl = const String.fromEnvironment('BASE_URL');
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();

    EquatableConfig.stringify = kDebugMode;
    isRelease = !kDebugMode;
    isProduction = true;

    await setPreferredOrientations();

    FlutterError.onError = (errorDetails) {
      Logger.error(
        errorDetails.exception,
        errorDetails.stack,
        recordFirebase: false,
      );
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      Logger.error(error, stack);
      return true;
    };

    await findDep<AppLanguageManager>().fetchLocale();
    runApp(const MyApp(appName: AppStrings.appName));
  }, (error, stack) {
    Logger.error(error, stack);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
