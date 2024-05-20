import 'package:dio/dio.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/modules/auth/data/requests/sign_in_request_model.dart';
import 'package:maids/modules/auth/domain/entity/profile_entity.dart';

abstract class IAuthRepository {
  const IAuthRepository();

  Future<Result<ProfileEntity>> login({
    CancelToken? cancelToken,
    required SignInRequestModel request,
    bool rememberMe = true,
  });

  Future<Result<ProfileEntity>> getProfile({
    CancelToken? cancelToken,
  });

  Future<bool> logout();

  Future<bool> checkFirstLaunch();

  Future<bool> didChangeFirstLaunchApp([bool value = false]);

  Future<bool> isAlreadyLogged();

  Future<ProfileEntity?> getSavedProfile();
}
