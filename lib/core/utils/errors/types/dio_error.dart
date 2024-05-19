import 'base_error.dart';

class BaseDioError extends BaseError {
  const BaseDioError(String? message, String? statusCode)
      : super(message: message, statusCode: statusCode);
}

class CancelDioError extends BaseDioError {
  const CancelDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$CancelDioError(message: $message, statusCode: $statusCode)";
  }
}

class ConnectTimeoutDioError extends BaseDioError {
  const ConnectTimeoutDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$ConnectTimeoutDioError(message: $message, statusCode: $statusCode)";
  }
}

class ReceiveTimeoutDioError extends BaseDioError {
  const ReceiveTimeoutDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$ReceiveTimeoutDioError(message: $message, statusCode: $statusCode)";
  }
}

class ConnectionDioError extends BaseDioError {
  const ConnectionDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$ConnectionDioError(message: $message, statusCode: $statusCode)";
  }
}

class ResponseDioError extends BaseDioError {
  const ResponseDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$ResponseDioError(message: $message, statusCode: $statusCode)";
  }
}

class SendTimeoutDioError extends BaseDioError {
  const SendTimeoutDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$SendTimeoutDioError(message: $message, statusCode: $statusCode)";
  }
}

class BadRequestDioError extends BaseDioError {
  const BadRequestDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$BadRequestDioError(message: $message, statusCode: $statusCode)";
  }
}

class NotFoundDioError extends BaseDioError {
  const NotFoundDioError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$NotFoundDioError(message: $message, statusCode: $statusCode)";
  }
}

class InternalServerError extends BaseDioError {
  const InternalServerError({String? message, String? statusCode})
      : super(message, statusCode);

  @override
  String toString() {
    return "$InternalServerError(message: $message, statusCode: $statusCode)";
  }
}
