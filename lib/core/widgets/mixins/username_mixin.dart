import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_animation_duration.dart';
import 'package:maids/core/utils/validators/base_validator.dart';
import 'package:maids/core/utils/validators/length_validator.dart';
import 'package:maids/core/utils/validators/required_validator.dart';
import 'package:maids/core/widgets/textfield/header_and_text_editing_field.dart';

mixin UsernameFormMixin<T extends StatefulWidget> on State<T> {
  final _nameKey = const ValueKey<String>('input.name');
  final _nameFormKey = GlobalKey<FormFieldState<String>>();
  final _mController = TextEditingController();
  final FocusNode _mFocusNode = FocusNode();

  FocusNode get nameFocusNode => _mFocusNode;

  Widget buildUsernameFormMixin({
    FocusNode? nextFocusNode,
    Function(String?)? onSubmitFunction,
    Function(String?)? onChanged,
    TextInputAction? textInputAction,
    bool isEnabled = true,
    bool ignoring = false,
    required String header,
    String? hintText,
    TextStyle? hintStyle,
    TextStyle? textStyle,
  }) {
    return HeaderAndTextEditingField(
      key: _nameKey,
      fieldKey: _nameFormKey,
      hintStyle: hintStyle,
      textStyle: textStyle,
      header: header,
      hintText: hintText,
      fieldController: _mController,
      onChanged: onChanged,
      ignoring: ignoring,
      onFieldSubmitted: onSubmitFunction,
      nextFocusNode: nextFocusNode,
      textInputType: TextInputType.name,
      focusNode: _mFocusNode,
      autofillHints: const [AutofillHints.name],
      validator: (value) {
        return BaseValidator.validateValue(
          context,
          value,
          [
            RequiredValidator(),
            MinLengthValidator(minLength: AppEditTextLength.nameLength),
          ],
          true,
        );
      },
    );
  }

  set setUserNameText(String name) {
    _mController.text = name;
  }

  String get usernameValue {
    return _mController.text.trim();
  }

  bool validateUsername() {
    return _nameFormKey.currentState?.validate() ?? false;
  }

  @override
  dispose() {
    _mController.dispose();
    _mFocusNode.dispose();
    super.dispose();
  }
}
