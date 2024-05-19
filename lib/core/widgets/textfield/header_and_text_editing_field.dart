import 'package:flutter/material.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/buttons/app_inkwell_widget.dart';
import 'package:maids/core/widgets/general/grayed_out_widget.dart';
import 'package:maids/core/widgets/general/horizontal_padding.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/textfield/app_header_text_widget.dart';

import 'package:provider/provider.dart';

import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/widgets/textfield/rounded_form_field.dart';

/// A StatelessWidget that displays a header followed by a text editing field.
///
/// [HeaderAndTextEditingField] combines a header with a text field to create a
/// reusable UI component. It can be used for regular text fields, password fields,
/// and even supports customization of the hint text, color, and style.
class HeaderAndTextEditingField extends StatelessWidget {
  const HeaderAndTextEditingField({
    super.key,
    this.hintStyle,
    this.hintText,
    this.helperText,
    this.hintColor,
    this.paddingHeaderAndTextBox,
    required this.header,
    this.fieldKey,
    this.fieldController,
    this.focusNode,
    this.nextFocusNode,
    this.prefix,
    this.suffix,
    this.obscuring,
    this.maxLines,
    this.minLines,
    this.validator,
    this.buildCounter,
    this.headerTextColor,
    this.isLight,
    this.onChanged,
    this.maxLength,
    this.onFieldSubmitted,
    this.ignoring = false,
    this.onTap,
    this.child,
    this.textInputType,
    this.textColor,
    this.editingComplete,
    this.textStyle,
    this.prefixIconConstraints,
    this.autofillHints,
    this.isGrayedOut = false,
    this.isOptional = false,
  });
  final GlobalKey? fieldKey;
  final Widget? child;
  final String header;
  final String? helperText;
  final bool? obscuring;
  final bool ignoring;
  final int? minLines;
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final Color? hintColor;
  final Color? headerTextColor;
  final double? paddingHeaderAndTextBox;
  final Widget? suffix;
  final Widget? prefix;
  final Function()? onTap;
  final Color? textColor;
  final TextEditingController? fieldController;
  final FocusNode? focusNode, nextFocusNode;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final VoidCallback? editingComplete;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool? isLight;
  final TextInputType? textInputType;
  final bool isGrayedOut;
  final InputCounterWidgetBuilder? buildCounter;
  final BoxConstraints? prefixIconConstraints;
  final bool isOptional;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore =
        Provider.of<AppThemeManager>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppHeaderTextWidget(
              header: header,
              textStyle: textStyle,
              headerTextColor: headerTextColor,
            ),
            if (isOptional) HorizontalTextPadding.with4(),
            if (isOptional)
              Text(
                '(${translate.optional})',
                style: appTextStyle.light12.copyWith(
                  color: themeStore.appColors.textGreyColor,
                ),
              )
          ],
        ),
        if (paddingHeaderAndTextBox == null)
          VerticalTextPadding.with4()
        else
          SizedBox(height: paddingHeaderAndTextBox!),
        if (child != null) child!,
        if (obscuring == true)
          AppInkWellWidget(
            onTap: onTap,
            child: IgnorePointer(
              ignoring: ignoring,
              child: RoundedPasswordFormField(
                maxLines: 1,
                fieldKey: fieldKey,
                style: textStyle ??
                    appTextStyle.light14.copyWith(
                      color: themeStore.appColors.textColor,
                    ),
                validator: validator,
                autofillHints: autofillHints,
                controller: fieldController,
                focusNode: focusNode,
                textInputAction: nextFocusNode == null
                    ? TextInputAction.done
                    : TextInputAction.next,
                keyboardType: textInputType,
                hintText: hintText,
                hintStyle: hintStyle,
                hintColor: hintColor,
                onFieldSubmitted: (term) {
                  nextFocusNode?.requestFocus();
                  if (onFieldSubmitted != null) onFieldSubmitted!(term);
                },
              ),
            ),
          ),
        if (obscuring != true)
          GrayedOut(
            grayedOut: isGrayedOut,
            child: AppInkWellWidget(
              onTap: onTap,
              child: IgnorePointer(
                ignoring: ignoring,
                child: RoundedFormField(
                  prefixIconConstraints: prefixIconConstraints,
                  fieldKey: fieldKey,
                  maxLines: maxLines ?? 1,
                  minLines: minLines,
                  maxLength: maxLength,
                  helperText: helperText,
                  buildCounter: buildCounter,
                  autofillHints: autofillHints,
                  textStyle: textStyle ??
                      appTextStyle.medium16.copyWith(
                        color: textColor ??
                            themeStore.appColors.headerTextFieldColor,
                      ),
                  controller: fieldController,
                  keyboardType: textInputType,
                  focusNode: focusNode,
                  textInputAction: nextFocusNode == null
                      ? TextInputAction.done
                      : TextInputAction.next,
                  suffixIcon: suffix,
                  prefixIcon: prefix,
                  validator: validator,
                  onChanged: onChanged,

                  // inputDecoration: AppDecorator.inputDecorationNormal(
                  //   hintText: hintText,
                  //   hintColor: hintColor,
                  //   obscuring: obscuring,
                  //   suffixIcon: suffix,
                  //   themeStore: themeStore,
                  // ),
                  onFieldSubmitted: (term) {
                    nextFocusNode?.requestFocus();
                    if (onFieldSubmitted != null) onFieldSubmitted!(term);
                  },
                  hintText: hintText,
                  hintStyle: hintStyle,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
