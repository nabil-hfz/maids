// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';

// Package imports:
import 'package:provider/provider.dart';

class RoundedFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String? hintText;
  final String? helperText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final bool isDense;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final Color? borderColor;
  final Color? cursorColor;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final GlobalKey? fieldKey;

  const RoundedFormField({
    super.key,
    this.fieldKey,
    this.validator,
    this.isEnableFocusOnTextField = true,
    this.inputFormat,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.filled = true,
    this.isDense = false,
    this.fillColor,
    this.cursorColor,
    this.textAlign,
    this.maxLines = 1,
    this.minLines,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textAlignVertical = TextAlignVertical.center,
    this.borderColor,
    this.textStyle,
    this.contentPadding,
    this.autofillHints,
    this.maxLength,
    this.buildCounter,
    this.hintStyle,
    this.hintText,
    this.helperText,
    this.borderRadius = AppRadius.formFieldBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    AppThemeManager appThemeManager = Provider.of<AppThemeManager>(context);
    return TextFormField(
      key: fieldKey,
      controller: controller,
      minLines: minLines,
      scrollPhysics: const BouncingScrollPhysics(),
      scrollPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.space2,
      ),
      style: textStyle ??
          appTextStyle.regular14.copyWith(
            color: appThemeManager.appColors.textColor,
            decorationThickness: 0,
            wordSpacing: 1.0,
          ),
      cursorColor: cursorColor ?? appThemeManager.appColors.cursorColor,
      autofillHints: autofillHints,
      textCapitalization: TextCapitalization.sentences,
      cursorWidth: 1.5,
      maxLength: maxLength,
      // minLines: minLines??1,

      buildCounter: buildCounter,
      textAlignVertical: textAlignVertical,
      textAlign: textAlign ?? TextAlign.start,

      decoration: InputDecoration(
        isDense: isDense,
        errorMaxLines: 2,
        errorStyle: appTextStyle.light12.copyWith(
          color: appThemeManager.appColors.textErrorColor,
        ),
        counterStyle: appTextStyle.light12.copyWith(
          color: appThemeManager.appColors.textActiveColor,
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: AppDimens.space16,
              vertical: AppDimens.space12,
            ),
        focusedBorder: generalBoarder(
          themeManager: appThemeManager,
          borderRadius: borderRadius,
          borderColor:
              borderColor ?? appThemeManager.appColors.focusedBorderColor,
        ),
        enabledBorder: generalBoarder(
          themeManager: appThemeManager,
          borderRadius: borderRadius,
          borderColor:
              borderColor ?? appThemeManager.appColors.enabledBorderColor,
        ),
        errorBorder: generalBoarder(
          themeManager: appThemeManager,
          isError: true,
          borderRadius: borderRadius,
          borderColor:
              borderColor ?? appThemeManager.appColors.errorBorderColor,
        ),
        border: generalBoarder(
          themeManager: appThemeManager,
          borderRadius: borderRadius,
          borderColor:
              borderColor ?? appThemeManager.appColors.borderTextFieldColor,
        ),
        focusedErrorBorder: generalBoarder(
          themeManager: appThemeManager,
          isError: true,
          borderRadius: borderRadius,
          borderColor:
              borderColor ?? appThemeManager.appColors.focusedBorderColor,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints ??
            const BoxConstraints(
              minWidth: AppIconSize.size_20,
              minHeight: AppIconSize.size_20,
            ),
        suffixIconConstraints: suffixIconConstraints ??
            const BoxConstraints(
              minWidth: AppIconSize.size_20,
              minHeight: AppIconSize.size_20,
            ),
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ??
            appTextStyle.regular16.copyWith(
              color: appThemeManager.appColors.hintColor,
            ),
        labelStyle: appTextStyle.medium16.copyWith(
          color: appThemeManager.appColors.textColor,
        ),
        filled: filled,
        alignLabelWithHint: true,
        fillColor: fillColor ?? appThemeManager.appColors.fillTextFieldColor,
        helperText: helperText,
      ),
      validator: validator,
      enabled: isEnableFocusOnTextField,
      inputFormatters: inputFormat,
      keyboardType: keyboardType,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap != null ? onTap as void Function()? : () {},
      onFieldSubmitted: onFieldSubmitted ??
          (term) {
            _fieldFocusChange(context, focusNode, nextNode);
          },
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

class RoundedPasswordFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final bool isDense;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final Color? borderColor;
  final Color? cursorColor;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? hintColor;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final GlobalKey? fieldKey;

  const RoundedPasswordFormField({
    super.key,
    this.fieldKey,
    this.validator,
    this.isEnableFocusOnTextField = true,
    this.inputFormat,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.filled = true,
    this.isDense = false,
    this.fillColor,
    this.cursorColor,
    this.textAlign,
    this.maxLines = 1,
    this.minLines,
    this.onFieldSubmitted,
    this.hintColor,
    this.prefixIcon,
    this.autofillHints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textAlignVertical = TextAlignVertical.center,
    this.borderColor,
    this.style,
    this.contentPadding,
    this.maxLength,
    this.buildCounter,
    this.hintStyle,
    required this.hintText,
    this.borderRadius = 0,
  });

  @override
  State<RoundedPasswordFormField> createState() =>
      _RoundedPasswordFormFieldState();
}

class _RoundedPasswordFormFieldState extends State<RoundedPasswordFormField> {
  bool isSecureText = true;

  @override
  Widget build(BuildContext context) {
    AppThemeManager appThemeManager = Provider.of<AppThemeManager>(context);
    return TextFormField(
      controller: widget.controller,
      minLines: widget.minLines,
      key: widget.fieldKey,
      scrollPhysics: const BouncingScrollPhysics(),
      scrollPadding: const EdgeInsets.symmetric(horizontal: AppDimens.space2),
      style: widget.style ??
          appTextStyle.regular14.copyWith(
            color: appThemeManager.appColors.textColor,
            decorationThickness: 0,
            wordSpacing: 1.0,
          ),
      cursorColor: widget.cursorColor ?? appThemeManager.appColors.cursorColor,
      textCapitalization: TextCapitalization.sentences,
      cursorWidth: 1.5,
      autofillHints: widget.autofillHints,
      maxLength: widget.maxLength,
      buildCounter: widget.buildCounter,
      textAlignVertical: widget.textAlignVertical,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        isDense: widget.isDense,
        errorMaxLines: 2,
        errorStyle: appTextStyle.light12.copyWith(
          color: appThemeManager.appColors.textErrorColor,
        ),
        counterStyle: appTextStyle.light12.copyWith(
          color: appThemeManager.appColors.textActiveColor,
        ),
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: AppDimens.space16,
              vertical: AppDimens.space12,
            ),
        focusedBorder: generalBoarder(
          themeManager: appThemeManager,
          borderRadius: widget.borderRadius,
          borderColor: widget.borderColor ??
              appThemeManager.appColors.focusedBorderColor,
        ),
        enabledBorder: generalBoarder(
          themeManager: appThemeManager,
          borderRadius: widget.borderRadius,
          borderColor: widget.borderColor ??
              appThemeManager.appColors.enabledBorderColor,
        ),
        errorBorder: generalBoarder(
          themeManager: appThemeManager,
          isError: true,
          borderRadius: widget.borderRadius,
          borderColor:
              widget.borderColor ?? appThemeManager.appColors.errorBorderColor,
        ),
        border: generalBoarder(
          themeManager: appThemeManager,
          borderRadius: widget.borderRadius,
          borderColor: widget.borderColor ??
              appThemeManager.appColors.borderTextFieldColor,
        ),
        focusedErrorBorder: generalBoarder(
          themeManager: appThemeManager,
          isError: true,
          borderRadius: widget.borderRadius,
          borderColor: widget.borderColor ??
              appThemeManager.appColors.focusedBorderColor,
        ),
        hintText: widget.hintText,
        // labelText: widget.labelText??'',
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: widget.prefixIconConstraints ??
            const BoxConstraints(
              minWidth: AppIconSize.size_20,
              minHeight: AppIconSize.size_20,
            ),
        suffixIconConstraints: widget.suffixIconConstraints ??
            const BoxConstraints(
              minWidth: AppIconSize.size_20,
              minHeight: AppIconSize.size_20,
            ),
        hintStyle: widget.hintStyle ??
            appTextStyle.regular16.copyWith(
              color: appThemeManager.appColors.hintColor,
            ),
        labelStyle: appTextStyle.medium16.copyWith(
          color: appThemeManager.appColors.textColor,
        ),
        filled: widget.filled,
        fillColor:
            widget.fillColor ?? appThemeManager.appColors.fillTextFieldColor,
        suffixIcon: widget.suffixIcon ??
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                if (mounted) {
                  setState(() {
                    isSecureText = !isSecureText;
                  });
                }
              },
              icon: AppImageWidget(
                path: isSecureText
                    ? Assets.icons.visible.path
                    : Assets.icons.invisible.path,
                color: AppColors.grey,
                width: AppIconSize.size_14,
                height: AppIconSize.size_14,
              ),
            ),
      ),
      validator: widget.validator,
      enabled: widget.isEnableFocusOnTextField,
      inputFormatters: widget.inputFormat,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      obscureText: isSecureText,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      onTap: widget.onTap != null ? widget.onTap as void Function()? : () {},
      onFieldSubmitted: widget.onFieldSubmitted ??
          (term) {
            _fieldFocusChange(context, widget.focusNode, widget.nextNode);
          },
    );
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

InputBorder generalBoarder({
  bool isError = false,
  required double borderRadius,
  Color? borderColor,
  required AppThemeManager themeManager,
}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor ?? themeManager.appColors.borderTextFieldColor,
      style: BorderStyle.solid,
      width: isError ? 1.5 : 1,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(AppRadius.formFieldBorderRadius),
    ),
  );
}
