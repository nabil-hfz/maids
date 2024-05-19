// Flutter imports:
import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

class AppHeaderTextWidget extends StatelessWidget {
  const AppHeaderTextWidget({
    super.key,
    required this.header,
    this.textStyle,
    this.headerTextColor,
  });

  final String header;
  final TextStyle? textStyle;
  final Color? headerTextColor;

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(
      context,
      listen: true,
    );
    return Flexible(
      fit: FlexFit.loose,
      child: Text(
        header,
        maxLines: 1,
        style: textStyle ??
            appTextStyle.bold14.copyWith(
              overflow: TextOverflow.ellipsis,
              color:
                  headerTextColor ?? themeStore.appColors.headerTextFieldColor,
            ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
