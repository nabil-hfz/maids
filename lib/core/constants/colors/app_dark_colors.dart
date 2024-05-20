// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';

class DarkColors implements AppColors {
  const DarkColors();

  ///
  /// Main Colors
  @override
  Color get primaryColor => AppColors.appPrimaryColor;

  @override
  Color get secondaryColor => AppColors.appPrimaryColor.withOpacity(0.2);

  @override
  Color get greyBackground => Colors.black;

  @override
  Color get errorColor => Colors.red;

  @override
  Color get flushBarBackground => Colors.yellow.shade800;

  @override
  Color get flushBarErrorBackground => Colors.red;

  @override
  Color get flushBarSuccessBackground => Colors.lightGreen;

  @override
  Color get pageRoundedCornerBG => Colors.black;

  @override
  Color get stickyHeaderColor => Colors.black;

  @override
  Color get expansionPanelListColor => Colors.black;

  @override
  Color get amberColor => const Color(0xffFFA800);

  @override
  Color get indicatorActiveDotColor => AppColors.appPrimaryColor;

  @override
  Color get indicatorInactiveDotColor => AppColors.grey;

  ///
  /// Scaffold Colors
  @override
  Color get scaffoldBgColor => Colors.black;

  @override
  Color get scaffoldBgClearColor => Colors.black;

  @override
  Color get scaffoldAuthBgColor => Colors.white10;

  ///
  /// Appbar Colors
  @override
  Color get appBarColor => const Color(0xff262525);

  @override
  Color get appBarGreyColor => Colors.black;

  ///
  /// BottomSheet Colors
  @override
  Color get bottomSheetBGColor => Colors.grey.withOpacity(0.1);

  ///
  /// DropDown Colors
  @override
  Color get dropDownBGColor => Colors.grey.withOpacity(0.1);

  ///
  /// Card Colors
  @override
  Color get cardShadow => Colors.white60;

  @override
  Color get signCardInfoColor => Colors.white24;

  @override
  Color get cardBGColor => AppColors.darkCardColor;

  ///
  /// Icon Colors
  @override
  Color get iconColor => Colors.white;

  @override
  Color get iconReversedColor => Colors.black;

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
  Color get textColor => Colors.white;

  @override
  Color get textWhiteColor => Colors.white;

  @override
  Color get textReversedColor => Colors.black;

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
  Color get headerTextFieldColor => Colors.white;

  ///
  /// Text Field Color
  @override
  Color get fillTextFieldColor => Colors.grey.shade900;

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
  Color get dividerColor => Colors.white60;

  @override
  Color get errorBorderColor => Colors.red;

  @override
  Color get dividerPrimaryColor => AppColors.appPrimaryColor;

  @override
  Color get systemDividerColor => Colors.black87;

  ///
  /// Shadows Colors
  @override
  Color get animationShadowBegin => Colors.white24;

  @override
  Color get animationShadowEnd => Colors.white54;

  ///
  /// Buttons Colors
  @override
  Color get bouncingButtonEnabledColor => Colors.grey.shade800;

  @override
  Color get bouncingButtonDisabledColor => Colors.grey.shade800;

  @override
  Color get floatingActionButtonColor => AppColors.appPrimaryColor;

  ///
  /// Dialog Colors
  @override
  Color get dialogBgColor => const Color(0xff262525);

  ///
  /// App Ink Well Colors
  @override
  Color get splashAppInkWellColor => const Color(0xff262525);

  @override
  Color get selectedAppInkWellColor => AppColors.grey.withOpacity(0.2);

  ///
  /// TabBar colors
  @override
  Color get tabBarLabelColor => Colors.white;

  @override
  Color get tabBarUnselectedLabelColor => Colors.white;

  @override
  Color get tabBarIndicatorColor => AppColors.appPrimaryColor;

  ///
  /// Status and Bottom Navigation Bar Colors
  @override
  Color get systemStatusBarColor => Colors.transparent;

  @override
  Color get bottomNavigationBarColor => Colors.black;

  @override
  Color get systemBottomNavigationBarColor => Colors.black;

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
  Color get moreTopBackgroundColor => Colors.white10;

  @override
  Color get moreTopSectionBGColor => AppColors.white.withOpacity(0.17);

  ///
  /// splash color
  @override
  Color get splashAppBarColor => Colors.black;

  ///
  /// signup color
  @override
  Color get authAppBarColor => Colors.black;

  @override
  Color get logoutCancelBtnColor => Colors.white54;

  ///
  /// Details Section
  @override
  Color get scaffoldBgDetailsColor => const Color(0xff232222);

  @override
  Color get componentBgDetailsColor => Colors.black;

  ///
  /// Stepper Colors
  @override
  Color get homeStepperColor => Colors.blueGrey.shade900;

  ///
  /// Refresh Header Color
  @override
  Color get refreshHeaderColor => Colors.grey.shade900;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
