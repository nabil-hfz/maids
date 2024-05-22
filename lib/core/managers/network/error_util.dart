// Dart imports:
// Package imports:
import 'package:dio/dio.dart';
import 'package:maids/core/errors/errors.dart';
import 'package:maids/core/utils/logger.dart';

class ErrorUtil {
  static String specialCode = '1000';
  static String typeErrorCode = '2000';
  static String unKnowErrorCode = '3000';

  ///
  /// General method that tries to infer the type of error according to
  /// all [Dio]'s errors and returns a special kind of error for each
  /// case that matches the current error.
  /// Also if an exception was thrown by this function for some reasons
  /// it will returns a [UnexpectedError] with a special code (currently
  /// [specialCode] this should replace with another value more suitable one) to
  /// indicate that is error is happening on the side of the application
  /// regardless of how this is produced..
  static BaseError handleError(dynamic error, dynamic stack) {
    Logger.error(error, stack);

    String? defaultError;
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            return CancelDioError(
              statusCode: error.response?.statusCode?.toString() ??
                  DioExceptionType.cancel.name,
            );

          case DioExceptionType.connectionTimeout:
            return ConnectTimeoutDioError(
              statusCode: error.response?.statusCode?.toString() ??
                  DioExceptionType.cancel.name,
            );
          case DioExceptionType.receiveTimeout:
            return ReceiveTimeoutDioError(
              statusCode: error.response?.statusCode?.toString() ??
                  DioExceptionType.cancel.name,
            );
          case DioExceptionType.badResponse:
            return _handleDioResponseError(
              error.response?.statusCode,
              error.response?.data,
            );
          case DioExceptionType.sendTimeout:
            return SendTimeoutDioError(
              statusCode: error.response?.statusCode?.toString() ??
                  DioExceptionType.cancel.name,
            );
          case DioExceptionType.unknown:
          case DioExceptionType.connectionError:
          default:
            return ConnectionDioError(
              statusCode: error.response?.statusCode?.toString() ??
                  DioExceptionType.cancel.name,
            );
        }
      } else {
        if (error is TypeError) {
          return UnexpectedError(
            message: error.toString(),
            statusCode: typeErrorCode,
          );
        }

        return UnexpectedError(
          message: error.toString(),
          statusCode: unKnowErrorCode,
        );
      }
    } catch (error, stack) {
      Logger.debug('ErrorUtil => handleError: error is $error');
      Logger.debug('ErrorUtil => handleError: stackTrace is $stack');

      return UnexpectedError(
        message: defaultError,
        statusCode: specialCode,
      );
    }
  }

  static BaseError _handleDioResponseError(int? statusCode, dynamic error) {
    String? message;
    try {
      message = error?['message'];
    } catch (error, stack) {
      Logger.error(error, stack);
    }
    switch (statusCode) {
      case 400:
      case 403:
        if (message?.isNotEmpty ?? false) {
          return CustomError.specific(message: message);
        }
        return BadRequestDioError(
          message: message,
          statusCode: statusCode.toString(),
        );
      case 404:
        return NotFoundDioError(
          message: message,
          statusCode: statusCode.toString(),
        );
      case 500:
        return InternalServerError(
          statusCode: statusCode.toString(),
        );
      default:
        return UnexpectedError(
          message: message,
          statusCode: statusCode.toString(),
        );
    }
  }
}
