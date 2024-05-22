import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/core/repository/base_repository.dart';
import 'package:maids/core/shared_preferences/shared_preference_helper.dart';
import 'package:maids/core/utils/logger.dart';
import 'package:maids/modules/auth/data/datasource/auth_remote_data_source_impl.dart';
import 'package:maids/modules/auth/data/requests/sign_in_request_model.dart';
import 'package:maids/modules/auth/data/response/profile_model.dart';
import 'package:maids/modules/auth/domain/entity/profile_entity.dart';

import 'auth_repository_i.dart';

@Singleton(as: IAuthRepository)
class ImplAuthRepository extends IAuthRepository {
  final IAuthRemoteDataSource _remoteDataSource;
  final Isar _db;

  final SharedPreferenceHelper _sharedPreferenceHelper;

  const ImplAuthRepository(
    this._remoteDataSource,
    this._sharedPreferenceHelper,
    this._db,
  );

  @override
  Future<Result<ProfileEntity>> login({
    CancelToken? cancelToken,
    required SignInRequestModel request,
    bool rememberMe = true,
  }) async {
    final result = await _remoteDataSource.login(
      cancelToken: cancelToken,
      requestModel: request,
    );

    if (rememberMe) {
      if (result.data != null) {
        await _saveProfileAndToken(result.data!);
      } else {
        await _deleteProfileAndToken();
      }
    }
    return BaseRepository.execute(remoteResult: result);
  }

  @override
  Future<Result<ProfileEntity>> getProfile({
    CancelToken? cancelToken,
  }) async {
    final result = await _remoteDataSource.getProfile(
      cancelToken: cancelToken,
    );
    return BaseRepository.execute(remoteResult: result);
  }

  @override
  Future<bool> isAlreadyLogged() async {
    return _sharedPreferenceHelper.isLoggedIn;
  }

  @override
  Future<bool> checkFirstLaunch() {
    final result = _sharedPreferenceHelper.isFirstLoad;
    return Future.value(result);
  }

  @override
  Future<bool> didChangeFirstLaunchApp([bool value = false]) {
    final result = _sharedPreferenceHelper.changeFirstLoadStatus(value);
    return Future.value(result);
  }

  @override
  Future<ProfileEntity?> getSavedProfile() async {
    final result = await _sharedPreferenceHelper.profile;
    return result?.toEntity();
  }

  @override
  Future<bool> logout() async {
    try {
      await _deleteProfileAndToken();
      _db.writeTxn(() async => await _db.clear());
    } catch (error, stack) {
      Logger.error(error, stack);
    }

    return Future.value(true);
  }

  Future<void> _saveProfileAndToken(ProfileModel result) async {
    if (result.token?.isNotEmpty ?? false) {
      await _sharedPreferenceHelper.saveAuthProfile(result);
      await _sharedPreferenceHelper.saveAuthToken(result.token);

      await _sharedPreferenceHelper.saveLoginStatus(true);
    }
  }

  Future<bool> _deleteProfileAndToken() async {
    final result = await Future.wait([
      _sharedPreferenceHelper.removeSavedProfile(),
      _sharedPreferenceHelper.removeToken(),
      _sharedPreferenceHelper.saveLoginStatus(false),
    ]);
    return result.fold(
      true,
      (previousValue, element) async => await previousValue && element,
    );
  }
}
