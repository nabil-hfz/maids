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
    }
    // else if (msgError is PasswordNotExistsError) {
    //   msg = translate.err_wrong_password;
    // } else if (msgError is EmailAlreadyExistError) {
    //   msg = translate.err_email_already_in_use;
    // } else if (msgError is PhoneNumberAlreadyExistError) {
    //   msg = translate.err_phone_already_in_use;
    // } else if (msgError is CityNotExistsError) {
    //   msg = translate.err_city_not_existed;
    // } else if (msgError is CustomerTypesRequiredError) {
    //   msg = translate.err_customer_type_required;
    // } else if (msgError is NoCodeWasRegisteredError) {
    //   msg = translate.err_no_code_was_registered;
    // } else if (msgError is CodeMaxCountError) {
    //   msg = translate.err_code_max_count;
    // } else if (msgError is NotValidUserError) {
    //   msg = translate.err_not_valid_user;
    // } else if (msgError is NotValidUserNameOrPasswordError) {
    //   msg = translate.err_not_valid_username_or_password;
    // } else if (msgError is EmailNotConfirmedError) {
    //   msg = translate.err_not_email_confirmed;
    // } else if (msgError is TokenError) {
    //   msg = translate.err_token;
    // } else if (msgError is MaidsNotFoundError) {
    //   msg = translate.err_maids_not_found;
    // } else if (msgError is NotValidCodeError) {
    //   msg = translate.err_the_code_is_not_valid;
    // }
    //
    else if (msgError is ConnectionDioError) {
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
