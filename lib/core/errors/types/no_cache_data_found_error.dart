import 'base_error.dart';

class NoCacheDataFoundError extends BaseError {
  const NoCacheDataFoundError({super.message});

  @override
  String toString() {
    return "$NoCacheDataFoundError(message: $message, statusCode: $statusCode)";
  }
}
