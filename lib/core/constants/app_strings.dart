class AppStrings {
  static const String privacyPolicyUrl = "";
  static const String termsOfUseUrl = "";
  static const String userDataDeletionUrl = "";

  AppStrings._();

  //General
  static const String appName = "Maids";
  static const String appNameDev = "Maids Dev";

  static final listOfLanguages = [
    const AppLanguageMetaData("English", "en", "🇺🇸"),
    const AppLanguageMetaData("العربية", "ar", "🇦🇪"),
  ];

  //
  static const emailAndPassword = 'email_and_password';
  static const socialMedia = 'social_media_email';

  /// Preference Keys
  static const String secureAuthToken = "secure_auth_token";

  static const String prefIsLoggedIn = "pref_is_logged_in";
  static const String prefAuthToken = "pref_auth_token";
  static const String prefAuthMaidsProfile = "pref_auth_maids_profile";
  static const String prefIsDarkMode = "pref_is_dark_mode";
  static const String prefBrightnessStatus = "pref_brightness_status";
  static const String prefThemeMode = "pref_theme_mode";
  static const String prefIsFirstLoad = "pref_is_first_load";
  static const String prefCurrentLanguage = "pref_current_language";
}

class AppLanguageMetaData {
  final String flag;
  final String label;
  final String code;

  const AppLanguageMetaData(
    this.label,
    this.code,
    this.flag,
  );

  @override
  int get hashCode => flag.hashCode ^ label.hashCode ^ code.hashCode;

  @override
  bool operator ==(Object other) {
    return other is AppLanguageMetaData &&
        other.flag == flag &&
        other.label == label &&
        other.code == code;
  }
}
