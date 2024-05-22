import 'package:maids/core/errors/types/msg_custom_error.dart';

import 'base_error.dart';

class CustomError extends BaseError {
  const CustomError._({super.message});

  factory CustomError.specific({String? message}) {
    if (message == MSGCustomError.msgNotValidUserNameOrPassword) {
      return const NotValidUserNameOrPasswordError();
    } else if (message == MSGCustomError.msgUserIdIsRequired) {
      return const MissingUserIdError();
    } else if (message?.contains(MSGCustomError.msgTodoNotFound) ?? false) {
      return const TodoNotFoundError();
    }

    return CustomError._(message: message);
  }

  @override
  String toString() {
    return "$CustomError(message: $message, statusCode: $statusCode)";
  }
}

class EmailOrPhoneRequiredError extends CustomError {
  const EmailOrPhoneRequiredError({super.message}) : super._();

  @override
  String toString() {
    return "$EmailOrPhoneRequiredError(message: $message, statusCode: $statusCode)";
  }
}

class PasswordNotExistsError extends CustomError {
  const PasswordNotExistsError({super.message}) : super._();

  @override
  String toString() {
    return "$PasswordNotExistsError(message: $message, statusCode: $statusCode)";
  }
}

class EmailAlreadyExistError extends CustomError {
  const EmailAlreadyExistError({super.message}) : super._();

  @override
  String toString() {
    return "$EmailAlreadyExistError(message: $message, statusCode: $statusCode)";
  }
}

class PhoneNumberAlreadyExistError extends CustomError {
  const PhoneNumberAlreadyExistError({super.message}) : super._();

  @override
  String toString() {
    return "$PhoneNumberAlreadyExistError(message: $message, statusCode: $statusCode)";
  }
}

class MissingUserIdError extends CustomError {
  const MissingUserIdError({super.message}) : super._();

  @override
  String toString() {
    return "$MissingUserIdError(message: $message, statusCode: $statusCode)";
  }
}

class CustomerTypesRequiredError extends CustomError {
  const CustomerTypesRequiredError({super.message}) : super._();

  @override
  String toString() {
    return "$CustomerTypesRequiredError(message: $message, statusCode: $statusCode)";
  }
}

class NoCodeWasRegisteredError extends CustomError {
  const NoCodeWasRegisteredError({super.message}) : super._();

  @override
  String toString() {
    return "$NoCodeWasRegisteredError(message: $message, statusCode: $statusCode)";
  }
}

class CodeMaxCountError extends CustomError {
  const CodeMaxCountError({super.message}) : super._();

  @override
  String toString() {
    return "$CodeMaxCountError(message: $message, statusCode: $statusCode)";
  }
}

class NotValidUserError extends CustomError {
  const NotValidUserError({super.message}) : super._();

  @override
  String toString() {
    return "$NotValidUserError(message: $message, statusCode: $statusCode)";
  }
}

class NotValidUserNameOrPasswordError extends CustomError {
  const NotValidUserNameOrPasswordError({super.message}) : super._();

  @override
  String toString() {
    return "$NotValidUserNameOrPasswordError(message: $message, statusCode: $statusCode)";
  }
}

class EmailNotConfirmedError extends CustomError {
  const EmailNotConfirmedError({super.message}) : super._();

  @override
  String toString() {
    return "$EmailNotConfirmedError(message: $message, statusCode: $statusCode)";
  }
}

class TokenError extends CustomError {
  const TokenError({super.message}) : super._();

  @override
  String toString() {
    return "$TokenError(message: $message, statusCode: $statusCode)";
  }
}

class TodoNotFoundError extends CustomError {
  const TodoNotFoundError({super.message}) : super._();

  @override
  String toString() {
    return "$TodoNotFoundError(message: $message, statusCode: $statusCode)";
  }
}

class NotValidCodeError extends CustomError {
  const NotValidCodeError({super.message}) : super._();

  @override
  String toString() {
    return "$NotValidCodeError(message: $message, statusCode: $statusCode)";
  }
}
