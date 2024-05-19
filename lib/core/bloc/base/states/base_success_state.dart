import 'package:maids/core/bloc/base/states/base_state.dart';

/// This is the base success state for all blocs in the application as
/// a standard state extends the base state class [BaseState].
/// Also it's possible to extend this state to customize as much as you can.
/// {@tool snippet}
/// ```dart
/// class TaskSuccessState extends BaseSuccessState {
///   final List<TaskModel> tasks;
///
///   const TaskSuccessState(this.tasks);
///
///   @override
///   List<Object?> get props => [super.props, tasks];
///
///   @override
///   String toString() {
///     return 'TaskSuccessState(BaseSuccessState: ${super.toString()}, tasks: $tasks)';
///   }
/// }
/// ```
/// {@end-tool}
///
class BaseSuccessState extends BaseState {
  /// Holding an optional message requesting or processing.
  final String? message;

  /// Holding an optional data when finishes requesting or processing.
  final dynamic data;

  const BaseSuccessState({this.message, this.data});

  @override
  String toString() {
    return '$BaseSuccessState(message: $message, data: $data)';
  }

  @override
  List<Object?> get props => [message, data];
}
