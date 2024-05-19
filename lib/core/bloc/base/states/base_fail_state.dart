import 'package:maids/core/bloc/base/states/base_state.dart';
import 'package:maids/core/errors/types/base_error.dart';

/// This is the failure state for all blocs in the application as
/// a standard state extends the base state class [BaseState].
class BaseFailState extends BaseState {
  /// Holds a specific error that provides some more data about this error.
  final BaseError? error;

  /// Provides the same failed action to try again the same action.
  final void Function()? callback;

  const BaseFailState(this.error, {this.callback});

  @override
  String toString() {
    return '$BaseFailState(error: $error, callback: $callback)';
  }

  @override
  List<Object?> get props => [error, callback];
}
