import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:maids/core/constants/app_theme.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/shared_preferences/hlp_shared_preference.dart';
import 'package:maids/core/utils/logger.dart';

///
/// This manager is responsible of holding all required data for theme
/// and app's colors which is used by [MaterialApp].
///
/// For the first launch of the application it will load the appropriate
/// theme depending on the system them, then the application will save any
/// changes to this preference with help of [SharedPreferenceHelper] class.
@Singleton()
class AppThemeManager with ChangeNotifier {
  ///
  /// This is a classic class that is used to be like an interface for all
  /// the application that contains all used methods with all features across
  /// the application. This module all the time is
  /// ** injected ** to where it's used.
  late final SharedPreferenceHelper _sharedPreference;

  /// Used to listen to the changes upon the system of brightness.
  PlatformDispatcher? get _window {
    if (navigator.navigatorKey.currentContext != null) {
      return View.of(navigator.navigatorKey.currentContext!).platformDispatcher;
    }
    return null;
    // PlatformDispatcher.instance.
  }

  /// Used to utilize using of system's brightness.
  Brightness get currentBrightness {
    return _window?.platformBrightness ?? Brightness.light;
  }

  /// A derived class [DarkColors] that has implemented the
  /// base class of [AppColors]
  late AppColors _appDarkColors;

  /// A derived class [LightColors] that has implemented the
  /// base class of [AppColors]
  late AppColors _appLightColors;

  /// Describes which theme will be used by [MaterialApp] for internal use.
  ThemeMode _internalThemeMode = ThemeMode.system;

  /// Describes current brightness will be used by [MaterialApp] for internal use.
  Brightness _brightness = Brightness.dark;

  /// Describes current brightness will be used by [MaterialApp] for internal use.
  SystemUiOverlayStyle _systemUiOverlayStyle = SystemUiOverlayStyle.dark;

  bool _isPossibleToListenToSystemChanges = true;

  /// Used by [MaterialApp].
  ThemeData getLightTheme(BuildContext context) =>
      buildLightTheme(_appLightColors, context);

  /// Used by [MaterialApp].
  ThemeData getDarkTheme(BuildContext context) =>
      buildDarkTheme(_appDarkColors, context);

  /// Used by [MaterialApp] to determine which Brightness should be used by
  /// [AnnotatedRegion].
  Brightness get brightness => _brightness;

  /// Used by [AnnotatedRegion] to determine which Some sort of colors should be
  /// used by it.
  SystemUiOverlayStyle get systemUiOverlayStyle => _systemUiOverlayStyle;

  bool get isDarkMode => _internalThemeMode == ThemeMode.dark;

  bool get _isSystemLightMode => (_internalThemeMode == ThemeMode.system &&
      currentBrightness == Brightness.light);

  /// Used by the whole application except [MaterialApp] to determine which ThemeData should be used by app.
  ThemeMode get getThemeMode {
    return _internalThemeMode;
  }

  /// Returns current [AppColors] depending on [_internalThemeMode] value.
  AppColors get appColors {
    if (_internalThemeMode == ThemeMode.light || _isSystemLightMode) {
      return _appLightColors;
    }
    return _appDarkColors;
  }

  AppThemeManager(this._sharedPreference) {
    initAppTheme();

    /// Loads current user preference of theme mode.
    /// If not then it's first load of the application
    /// And it will be system preference...
    /// If there is no saved value we can listen to system changes
    /// if there is a value we should look for this value, if is it system
    /// value then we can listen as well. If not then will not listen
    _sharedPreference.getThemeMode.then((value) {
      _isPossibleToListenToSystemChanges = (value != null);
      if (value != null) {
        var result =
            $enumDecodeNullable(themeModeEnumMap, value.split('.').last);
        _isPossibleToListenToSystemChanges = result == ThemeMode.system;
        toggleTheme(result ?? ThemeMode.system);
      } else {
        _isPossibleToListenToSystemChanges = true;
        toggleTheme(ThemeMode.system);
      }
    });

    addListener(listener);
    SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) {
      return Future.value(null);
    });
  }

  void initAppListener() {
    /// This callback gets invoked every time brightness changes.
    _window?.onPlatformBrightnessChanged = () {
      if (_isPossibleToListenToSystemChanges) onChange(ThemeMode.system);
    };
  }

  void initAppTheme() {
    _appLightColors = AppColors(ThemAppMode.light);

    _appDarkColors = AppColors(ThemAppMode.dark);
  }

  void toggleTheme(ThemeMode value) async {
    if (_internalThemeMode == value) return;
    initAppTheme();
    onChange(value);
  }

  /// Loads and saves dark configurations.
  void setDarkMode() async {
    _systemUiOverlayStyle = _systemUiOverlayStyle.copyWith(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: _appDarkColors.systemStatusBarColor,
      systemNavigationBarColor: _appDarkColors.systemBottomNavigationBarColor,
      systemNavigationBarDividerColor: _appDarkColors.systemDividerColor,
    );
    Logger.debug('AppThemeManager setDarkMode $_systemUiOverlayStyle');
    notifyListeners();
    _sharedPreference.changeTheme(_internalThemeMode.toString());
    _sharedPreference.changeBrightnessStatus(_brightness.toString());
  }

  /// Loads and saves light configurations.
  void setLightMode() async {
    _systemUiOverlayStyle = _systemUiOverlayStyle.copyWith(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: _appLightColors.systemStatusBarColor,
      systemNavigationBarColor: _appLightColors.systemBottomNavigationBarColor,
      systemNavigationBarDividerColor: _appLightColors.systemDividerColor,
    );
    Logger.debug('AppThemeManager setLightMode $_systemUiOverlayStyle');
    notifyListeners();
    _sharedPreference.changeTheme(_internalThemeMode.toString());
    _sharedPreference.changeBrightnessStatus(_brightness.toString());
  }

  void onChange(ThemeMode themeMode) {
    _internalThemeMode = themeMode;
    Brightness brightness;
    if (themeMode == ThemeMode.system) {
      _isPossibleToListenToSystemChanges = true;
      brightness = currentBrightness;
    } else {
      _isPossibleToListenToSystemChanges = false;
      brightness =
          (themeMode == ThemeMode.light) ? Brightness.light : Brightness.dark;
    }
    _brightness = brightness;
    if (brightness == Brightness.light) {
      setLightMode();
    } else {
      setDarkMode();
    }
  }

  void listener() {
    Logger.debug("Theme mode is $_internalThemeMode");
  }

  /// Cleans the listener of system theme changes.
  ///
  /// This method is called from [MyApp] class when the whole app is disposed
  @disposeMethod
  void disposeManager() {
    removeListener(listener);
    _window?.onPlatformBrightnessChanged = null;
    super.dispose();
  }
}

const themeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.dark: 'dark',
  ThemeMode.light: 'light',
};
