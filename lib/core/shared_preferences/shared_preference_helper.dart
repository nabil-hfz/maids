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
  final SharedPreferences _sharedPreference;
  final FlutterSecureStorage _secureStorage;

  SharedPreferenceHelper(this._sharedPreference, this._secureStorage);

  Future<bool> removeValue(String key) {
    return _sharedPreference.remove(key);
  }

  Future<bool> saveString(String key, String value) {
    return _sharedPreference.setString(key, value);
  }

  String? getString(String key) => _sharedPreference.getString(key);

  Future<bool> saveBool(String key, bool value) {
    return _sharedPreference.setBool(key, value);
  }

  bool? getBool(String key) => _sharedPreference.getBool(key);

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
    final result = getString(AppStrings.prefAuthMaidsProfile);
    if (result != null) {
      return ProfileModel.fromJson(json.decode(result));
    }
    return null;
  }

  Future<bool> saveAuthProfile(ProfileModel maidsProfile) async {
    return saveString(
      AppStrings.prefAuthMaidsProfile,
      json.encode(maidsProfile.toJson()),
    );
  }

  Future<bool> removeSavedProfile() async {
    return removeValue(AppStrings.prefAuthMaidsProfile);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return getBool(AppStrings.prefIsLoggedIn) ?? false;
  }

  Future<bool> saveLoginStatus(bool value) async {
    return saveBool(AppStrings.prefIsLoggedIn, value);
  }

  // Theme:------------------------------------------------------
  Future<bool> get isDarkMode async {
    return getBool(AppStrings.prefIsDarkMode) ?? false;
  }

  Future<bool> changeMode(bool value) async {
    return saveBool(AppStrings.prefIsDarkMode, value);
  }

  Future<String?> get getThemeMode async {
    return Future.value(getString(AppStrings.prefThemeMode));
  }

  Future<bool> changeTheme(String value) async {
    return saveString(AppStrings.prefThemeMode, value);
  }

  Future<String?> get getBrightnessStatus async {
    return Future.value(getString(AppStrings.prefBrightnessStatus));
  }

  Future<bool> changeBrightnessStatus(String value) async {
    return saveString(AppStrings.prefBrightnessStatus, value);
  }

  // App First launch:---------------------------------------------
  Future<bool> get isFirstLoad async {
    return Future.value(getBool(AppStrings.prefIsFirstLoad) ?? true);
  }

  Future<bool> changeFirstLoadStatus(bool value) async {
    return await saveBool(AppStrings.prefIsFirstLoad, value);
  }

  // Language:---------------------------------------------------
  Future<String?> get currentLanguage async {
    return getString(AppStrings.prefCurrentLanguage);
  }

  Future<bool> changeLanguage(String language) async {
    return saveString(AppStrings.prefCurrentLanguage, language);
  }
}
