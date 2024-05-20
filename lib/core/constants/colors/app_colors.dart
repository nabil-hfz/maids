// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_dark_colors.dart';
import 'app_light_colors.dart';

enum ThemAppMode { dark, light }

abstract class AppColors {
  // var iconRed = red;

  factory AppColors(ThemAppMode type) {
    switch (type) {
      case ThemAppMode.dark:
        return const DarkColors();
      case ThemAppMode.light:
      default:
        return const LightColors();
    }
  }

  ///
  /// General Colors
  ///
  // static const Color appPrimaryColor = Color(0xff1565C0);
  static const Color appPrimaryColor = Color(0xff0C65C2);

  // TO DELETE THIS RED AND AMBER IN FUTURE
  static const Color red = Color(0xffA61F00);
  static const Color green = Colors.green;
  static const Color yellow = Colors.yellow;
  static const Color orange = Colors.orange;
  static const Color amber = Colors.amber;
  static const Color grey = Colors.grey;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static Color darkCardColor = const Color(0xff14172f);

  ///
  /// Main Colors
  late Color primaryColor;
  late Color secondaryColor;
  late Color greyBackground;
  late Color flushBarBackground;
  late Color flushBarSuccessBackground;
  late Color flushBarErrorBackground;
  late Color errorColor;
  late Color pageRoundedCornerBG;
  late Color stickyHeaderColor;
  late Color expansionPanelListColor;
  late Color amberColor;
  late Color indicatorActiveDotColor;
  late Color indicatorInactiveDotColor;

  ///
  /// Refresh Header Color
  late Color refreshHeaderColor;

  ///
  /// Stepper Colors
  late Color homeStepperColor;

  // Colors.blue.shade50,
  ///
  /// Scaffold Colors
  late Color scaffoldBgColor;
  late Color scaffoldAuthBgColor;
  late Color scaffoldBgClearColor;

  ///
  /// Appbar Colors
  late Color appBarColor;
  late Color appBarGreyColor;

  ///
  /// BottomSheet Colors
  late Color bottomSheetBGColor;
  late Color tickBottomSheetColor;

  ///
  /// DropDown Colors
  late Color dropDownBGColor;

  ///
  /// Card Colors
  late Color cardShadow;
  late Color signCardInfoColor;
  late Color cardBGColor;
  late Color numericPadColor;

  ///
  /// Icon Colors
  late Color iconColor;
  late Color iconReversedColor;
  late Color iconActiveColor;
  late Color iconMoreColor;
  late Color iconTopMoreSectionColor;
  late Color iconGreyColor;
  late Color iconRed;

  ///
  /// Radio Colors
  late Color radioColor;

  /// rating
  late Color ratingActiveColor;
  late Color ratingUnActiveColor;

  ///
  /// Text Colors
  late Color textColor;
  late Color textGreyColor;
  late Color textGrey2Color;
  late Color textWhiteColor;
  late Color textReversedColor;
  late Color textActiveColor;
  late Color textGreenColor;
  late Color hintColor;
  late Color textErrorColor;
  late Color textSubTitle;
  late Color headerTextFieldColor;

  ///
  /// Text Field Color
  late Color fillTextFieldColor;
  late Color borderTextFieldColor;
  late Color enabledBorderColor;
  late Color focusedBorderColor;

  // TODO 2 Nabil: I should revise this color...
  late Color enabledBorder;
  late Color borderColor;
  late Color focusedErrorBorderColor;
  late Color cursorColor;

  ///
  /// Border And Divider Colors
  late Color dividerColor;
  late Color errorBorderColor;
  late Color dividerPrimaryColor;
  late Color systemDividerColor;

  ///
  /// Shadows Colors
  late Color animationShadowBegin;
  late Color animationShadowEnd;

  ///
  /// Buttons Colors
  late Color bouncingButtonEnabledColor;
  late Color bouncingButtonDisabledColor;
  late Color floatingActionButtonColor;

  ///
  /// Dialog Colors
  late Color dialogBgColor;

  ///
  /// App Ink Well Colors
  late Color splashAppInkWellColor;
  late Color selectedAppInkWellColor;

  ///
  /// TabBar colors
  late Color tabBarLabelColor;
  late Color tabBarUnselectedLabelColor;
  late Color tabBarIndicatorColor;

  ///
  /// Status and Bottom Navigation Bar Colors
  late Color systemStatusBarColor;
  late Color bottomNavigationBarColor;
  late Color systemBottomNavigationBarColor;

  // late Color selectedAppInkWellColor;

  ///
  /// Loaders & Shimmers Colors
  late Color loaderColor;
  late Color shimmerBaseColor;
  late Color shimmerChildBaseColor;
  late Color shimmerHighlightColor;
  late Color appLoaderColor;

  ///
  /// more color
  late Color moreTopBackgroundColor;
  late Color moreTopSectionBGColor;

  ///
  /// Background Colors
  late Color serviceBgColor;

  ///
  /// splash color
  late Color splashAppBarColor;

  ///
  /// signup color
  late Color authAppBarColor;

  ///
  /// edit profile color
  late Color editProfileCoverBGColor;
  late Color borderProfileImageColor;

  ///
  /// logout cancel color
  late Color logoutCancelBtnColor;

  ///
  /// Details Section
  late Color scaffoldBgDetailsColor;
  late Color componentBgDetailsColor;

  ///
  /// Package Section
  late Color packageBaseGradientStartColor;
  late Color packageBaseGradientEndColor;
  late Color packageCircleGradientStartColor;
  late Color packageCircleGradientEndColor;
  late Color packageCircleBaseColor;
  late Color packageCardBaseColor;
  late Color packageBgImageColor;

  ///
  /// Service Section
  late Color serviceDetailsAppBarGradientStartColor;
  late Color serviceDetailsAppBarGradientEndColor;
}
