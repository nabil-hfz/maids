import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_radius.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    this.title,
    required this.value,
    this.ignore = false,
    this.onChanged,
  });

  final bool value;
  final bool ignore;
  final String? title;
  final Null Function(bool newValue)? onChanged;

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<AppThemeManager>(context);

    return IgnorePointer(
      ignoring: ignore,
      child: Row(
        children: [
          Checkbox(
            // contentPadding: EdgeInsets.zero,
            checkColor: Colors.white,
            activeColor: appTheme.appColors.primaryColor,
            // controlAffinity: ListTileControlAffinity.leading,
            side: BorderSide(
              color: appTheme.appColors.borderTextFieldColor,
              width: .5,
            ),
            // checkColor: appTheme.appColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius4),
            ),
            value: value,
            // title: widget.title != null
            //     ? Text(
            //         widget.title!,
            //       )
            //     : null,
            onChanged: (newValue) {
              if (onChanged != null && newValue != null) onChanged!(newValue);
            },
          ),
          if (title != null)
            Text(
              title!,
              style: appTextStyle.regular14.copyWith(
                color: appTheme.appColors.textColor,
              ),
            ),
        ],
      ),
    );
  }
}
