import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/localization/generated/l10n.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

import 'todos/ui/controllers/todos_list_viewmodel.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appName});

  final String appName;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appTheme = findDep<AppThemeManager>();
  final _appLanguageManager = findDep<AppLanguageManager>();

  late String currentDefaultSystemLocale;
  late List<Locale> currentSystemLocales;
  Key materialAppKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _appTheme.initAppListener();
    });
    _appLanguageManager.appName = widget.appName;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => _appLanguageManager),
            ChangeNotifierProvider(create: (_) => _appTheme),
            ChangeNotifierProvider(
                create: (_) => findDep<TodosListViewModel>()),
          ],
          child: Consumer<AppLanguageManager>(
            builder: (context, appLanguage, child) {
              return Consumer<AppThemeManager>(
                builder: (context, appTheme, _) {
                  return MaterialApp.router(
                    routerConfig: navigator.router,
                    builder: (context, widget) => AnnotatedRegion(
                      value: _appTheme.systemUiOverlayStyle,
                      child: widget!,
                    ),
                    locale: appLanguage.appLocal,
                    debugShowCheckedModeBanner: false,
                    title: widget.appName,
                    theme: _appTheme.getLightTheme(context),
                    darkTheme: _appTheme.getDarkTheme(context),
                    themeMode: _appTheme.getThemeMode,
                    localizationsDelegates: const [
                      Translations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: Translations.delegate.supportedLocales,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    final currentDefaultSystemLocale = Platform.localeName.substring(0, 2);

    _appLanguageManager.changeLanguage(currentDefaultSystemLocale);
  }

  @override
  void dispose() {
    _appTheme.disposeManager();
    _appLanguageManager.disposeManager();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
