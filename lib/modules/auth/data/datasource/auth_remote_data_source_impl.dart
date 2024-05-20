import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:maids/core/constants/app_endpoints.dart';
import 'package:maids/core/managers/network/dio_client.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/modules/auth/data/requests/sign_in_request_model.dart';
import 'package:maids/modules/auth/data/response/profile_model.dart';

/// A data source abstraction for managing auth requests.
///
/// Provides methods for fetching, creating, updating, and deleting
abstract class IAuthRemoteDataSource {
  const IAuthRemoteDataSource();

  /// sign in.
  ///
  /// [cancelToken] is an optional parameter for canceling the request if needed.
  /// Returns a [Result] containing the [MaidsProfileModel] on success or an error on failure.
  Future<Result<ProfileModel>> login({
    CancelToken? cancelToken,
    required SignInRequestModel requestModel,
  });

  ///
  /// [cancelToken] is an optional parameter for canceling the request if needed.
  /// Returns a [Result] containing the [ProfileModel] on success or an error on failure.
  Future<Result<ProfileModel>> getProfile({
    CancelToken? cancelToken,
  });
}

@Singleton(as: IAuthRemoteDataSource)
class ImplAuthRemoteDataSource implements IAuthRemoteDataSource {
  final DioClient _dioClient;

  ImplAuthRemoteDataSource(this._dioClient) {
    _dioClient.toString();
  }

  @override
  Future<Result<ProfileModel>> login({
    CancelToken? cancelToken,
    required SignInRequestModel requestModel,
  }) async {
    return await _dioClient.post<ProfileModel>(
      AppEndpoints.login,
      cancelToken: cancelToken,
      data: requestModel.toJson(),
      converter: (json) {
        return ProfileModel.fromJson(json);
      },
    );
  }

  @override
  Future<Result<ProfileModel>> getProfile({
    CancelToken? cancelToken,
  }) async {
    return await _dioClient.get<ProfileModel>(
      AppEndpoints.getProfile,
      cancelToken: cancelToken,
      converter: (json) {
        return ProfileModel.fromJson(json);
      },
    );
  }
}
