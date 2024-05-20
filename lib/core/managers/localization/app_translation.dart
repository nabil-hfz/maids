// Project imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/localization/generated/l10n.dart';

Translations get translate => Translations.of(
      navigator.navigatorKey.currentContext!,
    );

String get appLanguage => findDep<AppLanguageManager>().appLanguage;

enum AppLanguageIndex {
  none,
  @JsonValue(1)
  en,
  @JsonValue(2)
  ar
}
