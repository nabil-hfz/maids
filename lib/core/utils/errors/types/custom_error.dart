import 'package:maids/core/utils/errors/types/msg_custom_error.dart';

import 'base_error.dart';

class CustomError extends BaseError {
  const CustomError._({super.message});

  factory CustomError.specific({String? message}) {
    if (message == MSGCustomError.msgPasswordNotExists) {
      return const PasswordNotExistsError();
    } else if (message == MSGCustomError.msgEmailOrPhoneRequired) {
      return const EmailOrPhoneRequiredError();
    } else if (message == MSGCustomError.msgEmailAlreadyExist) {
      return const EmailAlreadyExistError();
    } else if (message == MSGCustomError.msgPhoneNumberAlreadyExist) {
      return const PhoneNumberAlreadyExistError();
    } else if (message == MSGCustomError.msgCityNotExists) {
      return const CityNotExistsError();
    } else if (message == MSGCustomError.msgCustomerTypesRequired) {
      return const CustomerTypesRequiredError();
    } else if (message == MSGCustomError.msgNoCodeWasRegistered) {
      return const NoCodeWasRegisteredError();
    } else if (message == MSGCustomError.msgCodeMaxCount) {
      return const CodeMaxCountError();
    } else if (message == MSGCustomError.msgNotValidUser) {
      return const NotValidUserError();
    } else if (message == MSGCustomError.msgNotValidUserNameOrPassword) {
      return const NotValidUserNameOrPasswordError();
    } else if (message == MSGCustomError.msgNotEmailConfirmed) {
      return const EmailNotConfirmedError();
    } else if (message == MSGCustomError.msgTokenError) {
      return const TokenError();
    } else if (message == MSGCustomError.msgSalonNotExist) {
      return const SalonNotFoundError();
    } else if (message == MSGCustomError.msgNotValidCode) {
      return const NotValidCodeError();
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

class CityNotExistsError extends CustomError {
  const CityNotExistsError({super.message}) : super._();

  @override
  String toString() {
    return "$CityNotExistsError(message: $message, statusCode: $statusCode)";
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

class SalonNotFoundError extends CustomError {
  const SalonNotFoundError({super.message}) : super._();

  @override
  String toString() {
    return "$SalonNotFoundError(message: $message, statusCode: $statusCode)";
  }
}

class NotValidCodeError extends CustomError {
  const NotValidCodeError({super.message}) : super._();

  @override
  String toString() {
    return "$NotValidCodeError(message: $message, statusCode: $statusCode)";
  }
}
