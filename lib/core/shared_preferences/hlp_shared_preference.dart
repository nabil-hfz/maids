import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/managers/network/dio_client.dart';
import 'package:maids/core/utils/logger.dart';
import 'package:maids/modules/auth/data/response/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

@Singleton()
class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;
  final FlutterSecureStorage _secureStorage;

  // constructor
  SharedPreferenceHelper(this._sharedPreference, this._secureStorage);

  // General Method ------------------------------------------------------------

  Future<bool> removeValue(String key) {
    return _sharedPreference.remove(key);
  }

  Future<bool> _saveString(String key, String value) {
    return _sharedPreference.setString(key, value);
  }

  String? _getString(String key) => _sharedPreference.getString(key);

  Future<bool> _saveBool(String key, bool value) {
    return _sharedPreference.setBool(key, value);
  }

  bool? _getBool(String key) => _sharedPreference.getBool(key);

  Future<bool> _saveInt(String key, int value) {
    return _sharedPreference.setInt(key, value);
  }

  // Auth Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    String? token = await _secureStorage.read(key: AppStrings.secureAuthToken);
    return token;
  }

  Future<void> saveAuthToken(String? authToken) async {
    authToken = DioClient.appendBearerForToken(authToken);
    await _secureStorage.delete(key: AppStrings.secureAuthToken);

    return await _secureStorage.write(
        key: AppStrings.secureAuthToken, value: authToken);
  }

  Future<bool> removeToken() async {
    try {
      await _secureStorage.delete(key: AppStrings.secureAuthToken);
      return true;
    } catch (error, stack) {
      Logger.error(error, stack);
      return false;
    }
  }

  // Maids Profile: ----------------------------------------------------------
  Future<ProfileModel?> get profile async {
    final result = _getString(AppStrings.prefAuthMaidsProfile);
    if (result != null) {
      return ProfileModel.fromJson(json.decode(result));
    }
    return null;
  }

  Future<bool> saveAuthProfile(ProfileModel maidsProfile) async {
    return _saveString(
      AppStrings.prefAuthMaidsProfile,
      json.encode(maidsProfile.toJson()),
    );
  }

  Future<bool> removeSavedProfile() async {
    return removeValue(AppStrings.prefAuthMaidsProfile);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _getBool(AppStrings.prefIsLoggedIn) ?? false;
  }

  Future<bool> saveLoginStatus(bool value) async {
    return _saveBool(AppStrings.prefIsLoggedIn, value);
  }

  // Theme:------------------------------------------------------
  Future<bool> get isDarkMode async {
    return _getBool(AppStrings.prefIsDarkMode) ?? false;
  }

  Future<bool> changeMode(bool value) async {
    return _saveBool(AppStrings.prefIsDarkMode, value);
  }

  Future<String?> get getThemeMode async {
    return Future.value(_getString(AppStrings.prefThemeMode));
  }

  Future<bool> changeTheme(String value) async {
    return _saveString(AppStrings.prefThemeMode, value);
  }

  Future<String?> get getBrightnessStatus async {
    return Future.value(_getString(AppStrings.prefBrightnessStatus));
  }

  Future<bool> changeBrightnessStatus(String value) async {
    return _saveString(AppStrings.prefBrightnessStatus, value);
  }

  // App First launch:---------------------------------------------
  Future<bool> get isFirstLoad async {
    return Future.value(_getBool(AppStrings.prefIsFirstLoad) ?? true);
  }

  Future<bool> changeFirstLoadStatus(bool value) async {
    return await _saveBool(AppStrings.prefIsFirstLoad, value);
  }

  // Language:---------------------------------------------------
  Future<String?> get currentLanguage async {
    return _getString(AppStrings.prefCurrentLanguage);
  }

  Future<bool> changeLanguage(String language) async {
    return _saveString(AppStrings.prefCurrentLanguage, language);
  }
}
