import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/shared_preferences/shared_preference_helper.dart';
import 'package:maids/modules/auth/data/response/profile_model.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group('SharedPreferenceHelper', () {
    late SharedPreferenceHelper sharedPreferenceHelper;
    late MockSharedPreferences mockSharedPreferences;
    late MockFlutterSecureStorage mockFlutterSecureStorage;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      mockFlutterSecureStorage = MockFlutterSecureStorage();
      sharedPreferenceHelper = SharedPreferenceHelper(
          mockSharedPreferences, mockFlutterSecureStorage);
    });

    test('removeValue removes value from SharedPreferences', () async {
      when(mockSharedPreferences.remove('test_key'))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.removeValue('test_key');

      expect(result, true);
      verify(mockSharedPreferences.remove('test_key')).called(1);
    });

    test('_saveString saves string to SharedPreferences', () async {
      when(mockSharedPreferences.setString('test_key', 'test_value'))
          .thenAnswer((_) async => true);

      final result =
          await sharedPreferenceHelper.saveString('test_key', 'test_value');

      expect(result, true);
      verify(mockSharedPreferences.setString('test_key', 'test_value'))
          .called(1);
    });

    test('_getString retrieves string from SharedPreferences', () {
      when(mockSharedPreferences.getString('test_key'))
          .thenReturn('test_value');

      final result = sharedPreferenceHelper.getString('test_key');

      expect(result, 'test_value');
      verify(mockSharedPreferences.getString('test_key')).called(1);
    });

    test('_saveBool saves bool to SharedPreferences', () async {
      when(mockSharedPreferences.setBool('test_key', true))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.saveBool('test_key', true);

      expect(result, true);
      verify(mockSharedPreferences.setBool('test_key', true)).called(1);
    });

    test('_getBool retrieves bool from SharedPreferences', () {
      when(mockSharedPreferences.getBool('test_key')).thenReturn(true);

      final result = sharedPreferenceHelper.getBool('test_key');

      expect(result, true);
      verify(mockSharedPreferences.getBool('test_key')).called(1);
    });

    test('authToken retrieves token from secure storage', () async {
      when(mockFlutterSecureStorage.read(key: AppStrings.secureAuthToken))
          .thenAnswer((_) async => 'token');

      final result = await sharedPreferenceHelper.authToken;

      expect(result, 'token');
      verify(mockFlutterSecureStorage.read(key: AppStrings.secureAuthToken))
          .called(1);
    });

    test('saveAuthToken saves token to secure storage', () async {
      when(mockFlutterSecureStorage.write(
              key: AppStrings.secureAuthToken, value: anyNamed('value')))
          .thenAnswer((_) async => true);

      await sharedPreferenceHelper.saveAuthToken('token');

      verify(mockFlutterSecureStorage.delete(key: AppStrings.secureAuthToken))
          .called(1);
      verify(mockFlutterSecureStorage.write(
              key: AppStrings.secureAuthToken, value: 'Bearer token'))
          .called(1);
    });

    test('removeToken deletes token from secure storage', () async {
      when(mockFlutterSecureStorage.delete(key: AppStrings.secureAuthToken))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.removeToken();

      expect(result, true);
      verify(mockFlutterSecureStorage.delete(key: AppStrings.secureAuthToken))
          .called(1);
    });

    test('profile retrieves profile from SharedPreferences', () async {
      final profileJson =
          json.encode(ProfileModel(id: 1, firstName: 'Test').toJson());
      when(mockSharedPreferences.getString(AppStrings.prefAuthMaidsProfile))
          .thenReturn(profileJson);

      final result = await sharedPreferenceHelper.profile;

      expect(result, isNotNull);
      expect(result!.id, 1);
      expect(result.firstName, 'Test');
      verify(mockSharedPreferences.getString(AppStrings.prefAuthMaidsProfile))
          .called(1);
    });

    test('saveAuthProfile saves profile to SharedPreferences', () async {
      final profile = ProfileModel(id: 1, firstName: 'Test');
      when(mockSharedPreferences.setString(
              AppStrings.prefAuthMaidsProfile, 'Test'))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.saveAuthProfile(profile);

      expect(result, true);
      verify(mockSharedPreferences.setString(
              AppStrings.prefAuthMaidsProfile, json.encode(profile.toJson())))
          .called(1);
    });

    test('removeSavedProfile removes profile from SharedPreferences', () async {
      when(mockSharedPreferences.remove(AppStrings.prefAuthMaidsProfile))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.removeSavedProfile();

      expect(result, true);
      verify(mockSharedPreferences.remove(AppStrings.prefAuthMaidsProfile))
          .called(1);
    });

    test('isLoggedIn retrieves login status from SharedPreferences', () async {
      when(mockSharedPreferences.getBool(AppStrings.prefIsLoggedIn))
          .thenReturn(true);

      final result = await sharedPreferenceHelper.isLoggedIn;

      expect(result, true);
      verify(mockSharedPreferences.getBool(AppStrings.prefIsLoggedIn))
          .called(1);
    });

    test('saveLoginStatus saves login status to SharedPreferences', () async {
      when(mockSharedPreferences.setBool(AppStrings.prefIsLoggedIn, true))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.saveLoginStatus(true);

      expect(result, true);
      verify(mockSharedPreferences.setBool(AppStrings.prefIsLoggedIn, true))
          .called(1);
    });

    test('isDarkMode retrieves dark mode status from SharedPreferences',
        () async {
      when(mockSharedPreferences.getBool(AppStrings.prefIsDarkMode))
          .thenReturn(true);

      final result = await sharedPreferenceHelper.isDarkMode;

      expect(result, true);
      verify(mockSharedPreferences.getBool(AppStrings.prefIsDarkMode))
          .called(1);
    });

    test('changeMode saves dark mode status to SharedPreferences', () async {
      when(mockSharedPreferences.setBool(AppStrings.prefIsDarkMode, true))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.changeMode(true);

      expect(result, true);
      verify(mockSharedPreferences.setBool(AppStrings.prefIsDarkMode, true))
          .called(1);
    });

    test('getThemeMode retrieves theme mode from SharedPreferences', () async {
      when(mockSharedPreferences.getString(AppStrings.prefThemeMode))
          .thenReturn('light');

      final result = await sharedPreferenceHelper.getThemeMode;

      expect(result, 'light');
      verify(mockSharedPreferences.getString(AppStrings.prefThemeMode))
          .called(1);
    });

    test('changeTheme saves theme mode to SharedPreferences', () async {
      when(mockSharedPreferences.setString(AppStrings.prefThemeMode, 'dark'))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.changeTheme('dark');

      expect(result, true);
      verify(mockSharedPreferences.setString(AppStrings.prefThemeMode, 'dark'))
          .called(1);
    });

    test(
        'getBrightnessStatus retrieves brightness status from SharedPreferences',
        () async {
      when(mockSharedPreferences.getString(AppStrings.prefBrightnessStatus))
          .thenReturn('dark');

      final result = await sharedPreferenceHelper.getBrightnessStatus;

      expect(result, 'dark');
      verify(mockSharedPreferences.getString(AppStrings.prefBrightnessStatus))
          .called(1);
    });

    test('changeBrightnessStatus saves brightness status to SharedPreferences',
        () async {
      when(mockSharedPreferences.setString(
              AppStrings.prefBrightnessStatus, 'light'))
          .thenAnswer((_) async => true);

      final result =
          await sharedPreferenceHelper.changeBrightnessStatus('light');

      expect(result, true);
      verify(mockSharedPreferences.setString(
              AppStrings.prefBrightnessStatus, 'light'))
          .called(1);
    });

    test('isFirstLoad retrieves first load status from SharedPreferences',
        () async {
      when(mockSharedPreferences.getBool(AppStrings.prefIsFirstLoad))
          .thenReturn(true);

      final result = await sharedPreferenceHelper.isFirstLoad;

      expect(result, true);
      verify(mockSharedPreferences.getBool(AppStrings.prefIsFirstLoad))
          .called(1);
    });

    test('changeFirstLoadStatus saves first load status to SharedPreferences',
        () async {
      when(mockSharedPreferences.setBool(AppStrings.prefIsFirstLoad, false))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.changeFirstLoadStatus(false);

      expect(result, true);
      verify(mockSharedPreferences.setBool(AppStrings.prefIsFirstLoad, false))
          .called(1);
    });

    test('currentLanguage retrieves current language from SharedPreferences',
        () async {
      when(mockSharedPreferences.getString(AppStrings.prefCurrentLanguage))
          .thenReturn('en');

      final result = await sharedPreferenceHelper.currentLanguage;

      expect(result, 'en');
      verify(mockSharedPreferences.getString(AppStrings.prefCurrentLanguage))
          .called(1);
    });

    test('changeLanguage saves current language to SharedPreferences',
        () async {
      when(mockSharedPreferences.setString(
              AppStrings.prefCurrentLanguage, 'fr'))
          .thenAnswer((_) async => true);

      final result = await sharedPreferenceHelper.changeLanguage('fr');

      expect(result, true);
      verify(mockSharedPreferences.setString(
              AppStrings.prefCurrentLanguage, 'fr'))
          .called(1);
    });
  });
}
