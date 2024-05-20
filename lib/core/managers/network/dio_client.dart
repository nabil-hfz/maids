import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/model/result.dart';

import 'error_util.dart';

@Singleton()
class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  static String appendBearerForToken([String? token]) {
    return 'Bearer $token';
  }

  Future<Result<BaseModel>> get<BaseModel>(
    String uri, {
    BaseModel Function(Map<String, dynamic>)? converter,
    BaseModel Function(dynamic)? converterDynamic,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      BaseModel r;
      if (converterDynamic != null) {
        r = converterDynamic(response.data);
      } else {
        r = converter!(response.data);
      }
      return Result(data: r);
    } catch (error, stack) {
      return Result(error: ErrorUtil.handleError(error, stack));
    }
  }

  Future<Result<List<T>>> getList<T>(
    String uri, {
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) converter,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      final result =
          response.data?.profile<T>((json) => converter(json)).toList();
      return Result(data: result);
    } catch (error, stack) {
      return Result(error: ErrorUtil.handleError(error, stack));
    }
  }

  Future<Result<BaseModel>> post<BaseModel>(
    String uri, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    BaseModel Function(Map<String, dynamic>)? converter,
    BaseModel Function(dynamic)? converterDynamic,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      BaseModel r;
      if (converterDynamic != null) {
        r = converterDynamic(response.data);
      } else {
        r = converter!(response.data);
      }
      return Result(data: r);
    } catch (error, stack) {
      return Result(error: ErrorUtil.handleError(error, stack));
    }
  }

  Future<Result<BaseModel>> put<BaseModel>(
    String uri, {
    data,
    BaseModel Function(dynamic)? converter,
    BaseModel Function(dynamic)? converterDynamic,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      BaseModel r;
      if (converterDynamic != null) {
        r = converterDynamic(response.data);
      } else {
        r = converter!(response.data);
      }
      return Result(data: r);
    } catch (error, stack) {
      return Result(error: ErrorUtil.handleError(error, stack));
    }
  }

  Future<Result<BaseModel>> delete<BaseModel>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    BaseModel Function(Map<String, dynamic>)? converter,
    BaseModel Function(dynamic)? converterDynamic,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      BaseModel r;
      if (converterDynamic != null) {
        r = converterDynamic(response.data);
      } else {
        r = converter!(response.data);
      }
      return Result(data: r);
    } catch (error, stack) {
      return Result(error: ErrorUtil.handleError(error, stack));
    }
  }
}
