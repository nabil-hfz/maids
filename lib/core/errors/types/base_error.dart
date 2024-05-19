// Package imports:
import 'package:equatable/equatable.dart';

///
/// It is a base class for many types of different errors holds a specific message
/// that describes the error in more details and possible code for the error.
///
/// The errors are as following:
/// [CustomError], [BaseDioError], [InternalServerError], [UnexpectedError].
abstract class BaseError extends Equatable {
  final String? message;
  final String? statusCode;

  const BaseError({this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
