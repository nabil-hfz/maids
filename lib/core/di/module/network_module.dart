// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:maids/core/constants/app_endpoints.dart';
import 'package:maids/core/shared_preferences/hlp_shared_preference.dart';
import 'package:maids/core/utils/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final appOptions = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

@module
abstract class ServiceModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @factoryMethod
  Dio getDio(SharedPreferenceHelper sharedPreference) {
    final dio = Dio();
    // final authKey = await sharedPreference.authToken;
    appOptions;
    dio
      ..options.baseUrl = AppEndpoints.baseUrl
      ..options.connectTimeout =
          const Duration(seconds: AppEndpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(seconds: AppEndpoints.receiveTimeout)
      ..options.headers = appOptions
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: false,
          maxWidth: 100,
          request: true,
        ),
      )
      ..interceptors.add(AuthInterceptor(dio, sharedPreference));

    return dio;
  }
}

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SharedPreferenceHelper sharedPreference;
  bool _isRefreshing = false;
  int tryingCount = 0;

  AuthInterceptor(this._dio, this.sharedPreference);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authKey = await sharedPreference.authToken;

    options.headers['Authorization'] = authKey;
    Logger.debug('Authorization is ${options.headers['Authorization']}');

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    if (err.response?.statusCode == 401 && !_isRefreshing && tryingCount < 3) {
      _isRefreshing = true;
      tryingCount++;
      try {
        /// assume receiving the token has no errors
        /// to check `null-safety` and error handling
        /// please check inside the [onRequest] closure
        final newToken = await _getToken();

        options.headers['Authorization'] = newToken;
        Logger.debug('New Token has been saved is newToken $newToken');

        _isRefreshing = false;

        if (options.headers['Authorization'] != null) {
          Logger.debug('the token has been updated');

          /// since the api has no state, force to pass the 401 error
          /// by adding query parameter
          final originResult = await _dio.fetch(options..path);
          // print('originResult.statusCode is ${originResult.statusCode}');
          tryingCount = 0;
          if (originResult.statusCode != null &&
              originResult.statusCode! ~/ 100 == 2) {
            return handler.resolve(originResult);
          }
        }
        Logger.debug('the token has not been updated');
        return handler.reject(
          DioException(
            requestOptions: options,
            error: err,
            response: err.response,
            stackTrace: err.stackTrace,
            message: err.message,
            type: err.type,
          ),
        );
      } catch (error, stack) {
        Logger.error(error, stack);
        _isRefreshing = false;
        Logger.debug('the token has not been updated');
        return handler.reject(
          DioException(
            requestOptions: options,
            error: err,
            response: err.response,
            stackTrace: err.stackTrace,
            message: err.message,
            type: err.type,
          ),
        );
      }
    }
    Logger.debug('the token has not been updated');
    return handler.reject(
      DioException(
        requestOptions: options,
        error: err,
        response: err.response,
        stackTrace: err.stackTrace,
        message: err.message,
        type: err.type,
      ),
    );
  }

  Future _getToken() async {
    final newToken = await refreshToken();
    if (newToken != null) {
      // here we save the token without adding Bearer as we appended it in when saving it.
      await sharedPreference.saveAuthToken(newToken);
    }
    final appToken = 'Bearer $newToken';

    return appToken;
  }

  Future<String?> refreshToken() async {
    final response = await _dio.post(AppEndpoints.refresh);
    return response.data?['token'];
  }
}
