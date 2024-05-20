// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';

class LightColors implements AppColors {
  const LightColors();

  ///
  /// Main Colors
  @override
  Color get primaryColor => AppColors.appPrimaryColor;

  @override
  Color get secondaryColor => AppColors.appPrimaryColor.withOpacity(0.3);

  @override
  Color get greyBackground => const Color(0xffF8F8F8);

  @override
  Color get errorColor => Colors.red;

  @override
  Color get flushBarBackground => Colors.yellow.shade800;

  @override
  Color get flushBarErrorBackground => Colors.red;

  @override
  Color get flushBarSuccessBackground => Colors.lightGreen;

  @override
  Color get pageRoundedCornerBG => Colors.white;

  @override
  Color get stickyHeaderColor => Colors.white;

  @override
  Color get expansionPanelListColor => Colors.white10;

  @override
  Color get amberColor => const Color(0xffFFA800);

  @override
  Color get indicatorActiveDotColor => AppColors.appPrimaryColor;

  @override
  Color get indicatorInactiveDotColor => AppColors.grey;

  ///
  /// Scaffold Colors
  @override
  Color get scaffoldBgColor => const Color(0xffF5F5F5);

  @override
  Color get scaffoldBgClearColor => Colors.white;

  @override
  Color get scaffoldAuthBgColor => Colors.white54;

  ///
  /// Appbar Colors
  // @override
  // Color get appBarColor => Colors.white54;
  @override
  Color get appBarColor => AppColors.white;

  @override
  Color get appBarGreyColor => const Color(0xffF5F5F5);

  ///
  /// BottomSheet Colors
  @override
  Color get bottomSheetBGColor => Colors.white;

  ///
  /// DropDown Colors
  @override
  Color get dropDownBGColor => Colors.white.withOpacity(0.4);

  ///
  /// Card Colors
  @override
  Color get cardShadow => Colors.black54;

  @override
  Color get signCardInfoColor => Colors.white;

  @override
  Color get cardBGColor => Colors.white;

  ///
  /// Icon Colors
  @override
  Color get iconColor => Colors.black;

  @override
  Color get iconReversedColor => Colors.white;

  @override
  Color get iconActiveColor => AppColors.appPrimaryColor;

  @override
  Color get iconMoreColor => const Color(0xff6E6E6E);

  @override
  Color get iconTopMoreSectionColor => Colors.white;

  @override
  Color get iconGreyColor => const Color(0xff808080);

  @override
  Color get iconRed => Colors.red;

  ///
  /// Radio Colors
  @override
  Color get radioColor => AppColors.appPrimaryColor;

  ///
  /// Text Colors

  @override
  Color get textColor => Colors.black;

  @override
  Color get textWhiteColor => Colors.white;

  @override
  Color get textReversedColor => Colors.white;

  @override
  Color get textActiveColor => AppColors.appPrimaryColor;

  @override
  Color get textGreenColor => Colors.green;

  @override
  Color get hintColor => const Color(0xff979797);

  @override
  Color get textGreyColor => const Color(0xff6E6E6E);

  @override
  Color get textGrey2Color => const Color(0xff808080);

  @override
  Color get textErrorColor => Colors.red;

  @override
  Color get textSubTitle => const Color(0xff858597);

  @override
  Color get headerTextFieldColor => Colors.black;

  ///
  /// Text Field Color
  @override
  Color get fillTextFieldColor => Colors.grey.shade100;

  @override
  Color get borderTextFieldColor => const Color(0xffD9D9D9);

  @override
  Color get enabledBorderColor => const Color(0xffD9D9D9);

  @override
  Color get focusedBorderColor => const Color(0xffD9D9D9);

  @override
  Color get enabledBorder => const Color(0xffD9D9D9);

  @override
  Color get borderColor => const Color(0xffD9D9D9);

  @override
  Color get focusedErrorBorderColor => const Color(0xffD9D9D9);

  @override
  Color get cursorColor => AppColors.appPrimaryColor;

  ///
  /// Border And Divider Colors
  @override
  Color get dividerColor => Colors.black54;

  @override
  Color get errorBorderColor => Colors.red;

  @override
  Color get dividerPrimaryColor => AppColors.appPrimaryColor;

  @override
  Color get systemDividerColor => Colors.black.withOpacity(0.05);

  ///
  /// Shadows Colors
  @override
  Color get animationShadowBegin => Colors.black26;

  @override
  Color get animationShadowEnd => Colors.black45;

  ///
  /// Buttons Colors
  @override
  Color get bouncingButtonEnabledColor => Colors.black26;

  @override
  Color get bouncingButtonDisabledColor => Colors.black45;

  @override
  Color get floatingActionButtonColor => AppColors.appPrimaryColor;

  ///
  /// Dialog Colors
  @override
  Color get dialogBgColor => const Color(0xffF6F9FA);

  ///
  /// App Ink Well Colors
  @override
  Color get splashAppInkWellColor => AppColors.transparent;

  @override
  Color get selectedAppInkWellColor =>
      AppColors.appPrimaryColor.withOpacity(0.1);

  ///
  /// TabBar colors
  @override
  Color get tabBarLabelColor => Colors.black;

  @override
  Color get tabBarUnselectedLabelColor => Colors.black;

  @override
  Color get tabBarIndicatorColor => AppColors.appPrimaryColor;

  ///
  /// Status and Bottom Navigation Bar Colors
  @override
  Color get systemStatusBarColor => Colors.white;

  @override
  Color get bottomNavigationBarColor => Colors.white;

  @override
  Color get systemBottomNavigationBarColor => Colors.white;

  ///
  /// Loaders & Shimmers Colors
  @override
  Color get loaderColor => AppColors.appPrimaryColor;

  @override
  Color get shimmerBaseColor => Colors.grey[300]!;

  @override
  Color get shimmerChildBaseColor => Colors.grey[300]!;

  @override
  Color get shimmerHighlightColor => Colors.grey[100]!;

  @override
  Color get appLoaderColor => AppColors.appPrimaryColor;

  ///
  /// more color
  @override
  Color get moreTopBackgroundColor => AppColors.appPrimaryColor;

  @override
  Color get moreTopSectionBGColor => AppColors.white.withOpacity(0.17);

  ///
  /// splash color
  @override
  Color get splashAppBarColor => const Color(0xffF5F5F5);

  ///
  /// signup color
  @override
  Color get authAppBarColor => Colors.white;

  ///
  /// logout cancel color
  @override
  Color get logoutCancelBtnColor => Colors.white;

  ///
  /// Details Section
  @override
  Color get scaffoldBgDetailsColor => Colors.grey.shade300;

  @override
  Color get componentBgDetailsColor => const Color(0xffF8F8F8);

  ///
  /// Stepper Colors
  @override
  Color get homeStepperColor => Colors.blue.shade50;

  ///
  /// Refresh Header Color
  @override
  Color get refreshHeaderColor => Colors.grey.shade50;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
