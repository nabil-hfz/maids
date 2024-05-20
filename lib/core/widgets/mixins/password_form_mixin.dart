import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_animation_duration.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/utils/validators/base_validator.dart';
import 'package:maids/core/utils/validators/length_validator.dart';
import 'package:maids/core/utils/validators/required_validator.dart';
import 'package:maids/core/widgets/textfield/header_and_text_editing_field.dart';

mixin PasswordFormMixin<T extends StatefulWidget> on State<T> {
  final _key = GlobalKey<FormFieldState<String>>();
  final _mController = TextEditingController();
  final FocusNode _mFocusNode = FocusNode();

  FocusNode get getPasswordFocusNode => _mFocusNode;

  Widget buildPasswordFieldMixin({
    Function(String value)? onDataChanged,
    FocusNode? nextFocusNode,
    Function? onSubmitFunction,
    TextInputAction? textInputAction,
    bool ignoring = false,
    String? header,
    String? hintText,
    TextStyle? hintStyle,
    TextStyle? textStyle,
  }) {
    return HeaderAndTextEditingField(
      fieldKey: _key,
      ignoring: ignoring,
      hintStyle: hintStyle,
      textStyle: textStyle,
      header: header ?? translate.password,
      hintText: hintText ?? translate.password,
      autofillHints: const [AutofillHints.password],
      nextFocusNode: nextFocusNode,
      textInputType: TextInputType.text,
      fieldController: _mController,
      focusNode: _mFocusNode,
      obscuring: true,
      onChanged: (value) {
        if (onDataChanged != null && value != null) {
          onDataChanged(value);
        }
      },
      validator: (value) {
        return BaseValidator.validateValue(
          context,
          value,
          [
            RequiredValidator(),
            MinLengthValidator(minLength: AppEditTextLength.passwordMinLength),
          ],
          true,
        );
      },
    );
  }

  set setPasswordText(String password) {
    _mController.text = password;
  }

  String getPasswordValue() {
    return _mController.text.trim();
  }

  bool validatePassword() {
    return _key.currentState?.validate() ?? false;
  }

  @override
  dispose() {
    _mController.dispose();
    _mFocusNode.dispose();
    super.dispose();
  }
}
