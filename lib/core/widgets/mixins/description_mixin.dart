import 'package:flutter/material.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

import 'package:maids/core/constants/app_animation_duration.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/utils/validators/base_validator.dart';
import 'package:maids/core/utils/validators/length_validator.dart';
import 'package:maids/core/utils/validators/required_validator.dart';
import 'package:maids/core/widgets/textfield/header_and_text_editing_field.dart';

mixin DescriptionFormMixin<T extends StatefulWidget> on State<T> {
  final _descriptionKey = const ValueKey<String>('input.description');
  final _descriptionFormKey = GlobalKey<FormFieldState<String>>();
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  FocusNode get descriptionFocusNode => _focusNode;

  Widget buildDescriptionFormMixin({
    FocusNode? nextFocusNode,
    Function(String?)? onSubmitFunction,
    Function(String?)? onChanged,
    TextInputAction? textInputAction,
    bool isEnabled = true,
    bool showLimitMessage = true,
    required String header,
    String? hintText,
    Key? key,
  }) {
    final appTheme = Provider.of<AppThemeManager>(context);
    return HeaderAndTextEditingField(
      header: header,
      hintText: hintText,
      key: _descriptionKey,
      fieldKey: _descriptionFormKey,
      fieldController: _controller,
      nextFocusNode: nextFocusNode,
      focusNode: _focusNode,
      onChanged: onChanged,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required int? maxLength,
        required bool isFocused,
      }) {
        return Text(
          "$currentLength/$maxLength",
          style: appTextStyle.light12.copyWith(
            color: appTheme.appColors.textSubTitle,
          ),
        );
      },
      maxLength: 1500,
      maxLines: 6,
      helperText: showLimitMessage
          ? translate.min_characters_count(
              AppEditTextLength.descriptionLength,
            )
          : null,
      validator: (value) {
        return BaseValidator.validateValue(
          context,
          value,
          [
            RequiredValidator(),
            MinLengthValidator(minLength: AppEditTextLength.descriptionLength),
          ],
          true,
        );
      },
    );
  }

  set setDescriptionText(String description) {
    _controller.text = description;
  }

  String get descriptionValue {
    return _controller.text.trim();
  }

  bool validateDescription() {
    setState(() {});
    return _descriptionFormKey.currentState!.validate();
  }

  @override
  dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
