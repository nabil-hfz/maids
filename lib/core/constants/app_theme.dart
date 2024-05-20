import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'constants.dart';

ThemeData buildLightTheme(AppColors baseColor, BuildContext context) {
  TextTheme textTheme = AppUtils.languagePlatform(
    english: GoogleFonts.ptSansTextTheme(),
    arabic: GoogleFonts.cairoTextTheme(),
  );
  String? fontFamily = AppUtils.languagePlatform(
    english: AppFontFamily.ptSans,
    arabic: AppFontFamily.cairo,
  );
  final iconTheme = MaterialStateProperty.resolveWith<IconThemeData>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return IconThemeData(
          color: baseColor.textActiveColor,
        );
      }
      return IconThemeData(
        color: baseColor.iconGreyColor,
      );
    },
  );

  final labelTextStyle = MaterialStateProperty.resolveWith<TextStyle>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return appTextStyle.medium14.copyWith(
          color: baseColor.textActiveColor,
          fontFamily: fontFamily,
        );
      }
      return appTextStyle.medium14.copyWith(
        color: baseColor.textSubTitle,
        fontFamily: fontFamily,
      );
    },
  );
  final indicatorColor = baseColor.primaryColor.withOpacity(0.3);
  final surfaceTintColor = baseColor.primaryColor.withOpacity(0.3);

  return FlexThemeData.light(
    fontFamily: fontFamily,
    textTheme: textTheme,
    scheme: FlexScheme.material,
    primary: baseColor.primaryColor,
    appBarBackground: baseColor.appBarColor,
    scaffoldBackground: baseColor.scaffoldBgColor,
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: baseColor.primaryColor,
    ),
  ).copyWith(
    navigationBarTheme: NavigationBarThemeData(
      elevation: 4,
      iconTheme: iconTheme,
      indicatorColor: indicatorColor,
      surfaceTintColor: surfaceTintColor,
      labelTextStyle: labelTextStyle,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    navigationRailTheme: NavigationRailThemeData(
      elevation: 4,
      indicatorColor: baseColor.primaryColor.withOpacity(0.3),
      selectedIconTheme: IconThemeData(
        color: baseColor.iconActiveColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: baseColor.iconGreyColor,
      ),
      selectedLabelTextStyle: appTextStyle.semiBold16.copyWith(
        color: baseColor.textActiveColor,
        fontFamily: fontFamily,
      ),
      unselectedLabelTextStyle: appTextStyle.light14.copyWith(
        color: baseColor.textGreyColor,
        fontFamily: fontFamily,
      ),
    ),
    navigationDrawerTheme: NavigationDrawerThemeData(
      elevation: 4,
      iconTheme: iconTheme,
      labelTextStyle: labelTextStyle,
      indicatorColor: indicatorColor,
      surfaceTintColor: surfaceTintColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return baseColor.primaryColor;
        }
        return Colors.grey.shade400;
      }),
      side: BorderSide.none,
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: appTextStyle.semiBold18.copyWith(
        color: baseColor.textColor,
        fontFamily: fontFamily,
      ),
      contentTextStyle: appTextStyle.medium16.copyWith(
        color: baseColor.textColor,
        fontFamily: fontFamily,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: baseColor.floatingActionButtonColor,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: baseColor.tabBarLabelColor,
      unselectedLabelColor: baseColor.tabBarUnselectedLabelColor,
      unselectedLabelStyle: appTextStyle.regular14.copyWith(
        color: baseColor.textGreyColor,
        fontFamily: fontFamily,
      ),
      labelStyle: appTextStyle.bold16.copyWith(
        color: baseColor.textColor,
        fontFamily: fontFamily,
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: AppDimens.tabBarIndicatorHeight,
            color: baseColor.tabBarIndicatorColor,
          ),
        ),
      ),
    ),
  );
}

ThemeData buildDarkTheme(AppColors baseColor, BuildContext context) {
  final iconTheme = MaterialStateProperty.resolveWith<IconThemeData>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return IconThemeData(
          color: baseColor.textActiveColor,
        );
      }
      return IconThemeData(
        color: baseColor.iconGreyColor,
      );
    },
  );

  TextTheme textTheme = AppUtils.languagePlatform(
    english: GoogleFonts.ptSansTextTheme(),
    arabic: GoogleFonts.cairoTextTheme(),
  );
  String? fontFamily = AppUtils.languagePlatform(
    english: AppFontFamily.ptSans,
    arabic: AppFontFamily.cairo,
  );
  final labelTextStyle = MaterialStateProperty.resolveWith<TextStyle>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return appTextStyle.medium14.copyWith(
          color: baseColor.textActiveColor,
          fontFamily: fontFamily,
        );
      }
      return appTextStyle.medium14.copyWith(
        color: baseColor.textSubTitle,
        fontFamily: fontFamily,
      );
    },
  );
  final indicatorColor = baseColor.primaryColor.withOpacity(0.3);
  final surfaceTintColor = baseColor.primaryColor.withOpacity(0.3);

  return FlexThemeData.dark(
    fontFamily: fontFamily,
    textTheme: textTheme,
    scheme: FlexScheme.material,
    primary: baseColor.primaryColor,
    appBarBackground: baseColor.appBarColor,
    scaffoldBackground: baseColor.scaffoldBgColor,
    useMaterial3: false,
    colorScheme: ColorScheme.dark(
      primary: baseColor.primaryColor,
    ),
  ).copyWith(
    navigationBarTheme: NavigationBarThemeData(
      elevation: 4,
      iconTheme: iconTheme,
      indicatorColor: indicatorColor,
      surfaceTintColor: surfaceTintColor,
      labelTextStyle: labelTextStyle,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    ),
    navigationRailTheme: NavigationRailThemeData(
      elevation: 4,
      indicatorColor: baseColor.primaryColor.withOpacity(0.3),
      selectedIconTheme: IconThemeData(
        color: baseColor.iconActiveColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: baseColor.iconGreyColor,
      ),
      selectedLabelTextStyle: appTextStyle.semiBold16.copyWith(
        color: baseColor.textActiveColor,
      ),
      unselectedLabelTextStyle: appTextStyle.light14.copyWith(
        color: baseColor.textGreyColor,
      ),
    ),
    navigationDrawerTheme: NavigationDrawerThemeData(
      elevation: 4,
      iconTheme: iconTheme,
      labelTextStyle: labelTextStyle,
      indicatorColor: indicatorColor,
      surfaceTintColor: surfaceTintColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return baseColor.primaryColor;
        }
        return Colors.grey.shade400;
      }),
      side: BorderSide.none,
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: appTextStyle.semiBold18.copyWith(
        color: baseColor.textColor,
        fontFamily: fontFamily,
      ),
      contentTextStyle: appTextStyle.medium16.copyWith(
        color: baseColor.textColor,
        fontFamily: fontFamily,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: baseColor.floatingActionButtonColor,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: baseColor.tabBarLabelColor,
      unselectedLabelColor: baseColor.tabBarUnselectedLabelColor,
      unselectedLabelStyle: appTextStyle.regular14.copyWith(
        color: baseColor.textGreyColor,
        fontFamily: fontFamily,
      ),
      labelStyle: appTextStyle.bold16.copyWith(
        color: baseColor.textColor,
        fontFamily: fontFamily,
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: AppDimens.tabBarIndicatorHeight,
            color: baseColor.tabBarIndicatorColor,
          ),
        ),
      ),
    ),
  );
}
