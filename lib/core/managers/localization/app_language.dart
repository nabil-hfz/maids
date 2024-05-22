import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/shared_preferences/hlp_shared_preference.dart';
import 'package:maids/core/utils/logger.dart';

///
/// This manager is responsible of holding all required data for language
/// and determines current language.
///
/// For first launch of the application it gets the device's lang and
/// tries to see if we have a localized version of device's lang if
/// Yes: it will load it, otherwise by default English lang it will be loaded.
/// Then the application will save any changes to this preference with
/// help of [SharedPreferenceHelper] class.
@Singleton()
class AppLanguageManager extends ChangeNotifier {
  ///
  /// This is a classic class that is used to be like an interface for all
  /// the application that contains all used methods with all features across
  /// the application. This module all the time is
  /// ** injected ** to where it's used.
  late final SharedPreferenceHelper _sharedPreference;

  late Locale _appLocale;

  late String _langCode;

  Locale get appLocal => _appLocale;

  String get appLanguage => _langCode;

  bool get isEnglish => appLanguage == "en";

  String appName = AppStrings.appName;

  AppLanguageManager(this._sharedPreference) {
    // _sharedPreference.currentLanguage.then((value) {
    //   _appLocale = Locale(value);
    //   _langCode = value;
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     notifyListeners();
    //   });
    // });
  }

  Future fetchLocale() async {
    final currentLanguage =
        await _sharedPreference.currentLanguage ?? await getDeviceLang();

    final language = AppStrings.listOfLanguages
        .firstWhere((element) => element.code == currentLanguage);
    _appLocale = Locale(language.code);
    _langCode = language.code;

    notifyListeners();
  }

  void changeLanguage(String langCode) async {
    if (_langCode == langCode) {
      return;
    }
    final language = AppStrings.listOfLanguages
        .firstWhere((element) => element.code == langCode);

    _langCode = language.code;
    _appLocale = Locale(language.code);
    _sharedPreference.changeLanguage(_langCode);
    notifyListeners();
  }

  Future<String> getDeviceLang() async {
    String? locale = await Devicelocale.currentLocale;
    String str;
    if (locale.toString().contains("_")) {
      str = locale.toString().substring(0, locale.toString().indexOf('_'));
    } else if (locale.toString().contains("-")) {
      str = locale.toString().substring(0, locale.toString().indexOf('-'));
    } else {
      str = locale.toString();
    }
    Logger.debug("GetDeviceLang $str");
    return str;
  }

  /// This method is called from [MyApp] class when the whole app is disposed.
  @disposeMethod
  void disposeManager() {
    super.dispose();
  }

  String getFlag() {
    final language = AppStrings.listOfLanguages
        .firstWhere((element) => element.code == _langCode);

    return language.flag;
  }

  String getLangLabel() {
    final language = AppStrings.listOfLanguages
        .firstWhere((element) => element.code == _langCode);

    return language.label;
  }

  getTextDirection() {}
}
