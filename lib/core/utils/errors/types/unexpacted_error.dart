import 'base_error.dart';

class UnexpectedError extends BaseError {
  const UnexpectedError({super.message, super.statusCode});

  @override
  String toString() {
    return "$UnexpectedError(message: $message, statusCode: $statusCode)";
  }
}
