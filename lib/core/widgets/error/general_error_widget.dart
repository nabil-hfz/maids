// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/errors/errors.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/widgets/error/custom_error_widget.dart';

class AppErrorWidget extends StatefulWidget {
  final Widget? body;
  final BaseFailState? errorState;
  final String? message;

  const AppErrorWidget({
    super.key,
    this.message,
    this.body,
    this.errorState,
  });

  static String getErrorMsgByMessageCode(
    BaseError? msgError, {
    BuildContext? context,
  }) {
    String msg;

    if (msgError is NotValidUserNameOrPasswordError) {
      msg = translate.err_not_valid_username_or_password;
    } else if (msgError is MissingUserIdError) {
      msg = translate.err_missing_user_id;
    } else if (msgError is TodoNotFoundError) {
      msg = translate.err_todo_with_this_id_not_found;
    } else if (msgError is ConnectionDioError) {
      msg = translate.connection_error;
    } else if (msgError is NotFoundDioError) {
      msg = translate.err_todo_with_this_id_not_found;
    } else if (msgError is NoCacheDataFoundError) {
      msg = translate.connection_error;
    } else {
      msg = translate.something_went_wrong_please_try_again;
    }

    return msg;
  }

  @override
  _AppErrorWidgetState createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      callback: widget.errorState?.callback,
      error: widget.errorState?.error,
    );
  }
}
