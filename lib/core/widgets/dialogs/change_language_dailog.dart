import 'package:flutter/material.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/buttons/app_inkwell_widget.dart';
import 'package:maids/core/widgets/dialogs/base_dialog.dart';
import 'package:provider/provider.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    AppLanguageManager appLanguage = Provider.of<AppLanguageManager>(context);
    return BaseDialog(
      withDivider: true,
      title: translate.change_language,
      child: Wrap(
          children: AppStrings.listOfLanguages
              .map(
                (language) => _selectedButton(
                  title: language.label,
                  langCode: language.code,
                  currentValue: appLanguage.appLanguage == language.code,
                  themeStore: themeStore,
                  appLanguage: appLanguage,
                  context: context,
                ),
              )
              .toList()

          // <Widget>[
          //   _selectedButton(
          //     title: AppStrings.arabic,
          //     langCode: AppStrings.langAr,
          //     currentValue: appLanguage.appLanguage == AppStrings.langAr,
          //     themeStore: themeStore,
          //     appLanguage: appLanguage,
          //     context: context,
          //   ),
          //   const VerticalPadding(percentage: 0.02),
          //   _selectedButton(
          //     title: AppStrings.english,
          //     langCode: AppStrings.langEn,
          //     currentValue: appLanguage.appLanguage == AppStrings.langEn,
          //     themeStore: themeStore,
          //     appLanguage: appLanguage,
          //     context: context,
          //   ),
          // ],
          ),
    );
  }

  Widget _selectedButton({
    String? title,
    required String langCode,
    // required String langFlag,
    bool currentValue = false,
    required AppThemeManager themeStore,
    required AppLanguageManager appLanguage,
    required BuildContext context,
  }) {
    Widget? icon;
    Widget? langTitle;
    Color? currentColor;
    if (currentValue) {
      currentColor = themeStore.appColors.selectedAppInkWellColor;
    }
    langTitle = Text(
      title ?? "",
      style: appTextStyle.medium16.copyWith(
        color: currentValue
            ? themeStore.appColors.primaryColor
            : themeStore.appColors.textColor,
        fontWeight: currentValue ? FontWeight.bold : FontWeight.normal,
      ),
    );

    if (currentValue) {
      icon = Icon(
        Icons.check_circle,
        color: themeStore.appColors.primaryColor,
      );
    } else {
      icon = const SizedBox();
    }

    return AppInkWellWidget(
      onTap: () async {
        if (currentValue) {
          Navigator.pop(context);
          return;
        }

        appLanguage.changeLanguage(langCode);

        /// return true so the caller will know that the language has been changed.
        // Navigator.pop(context, true);
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimens.space12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppRadius.radiusSelectedAppInkWell12,
          ),
          color: currentColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            langTitle,
            icon,
          ],
        ),
      ),
    );
  }
}
