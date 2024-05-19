import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

abstract class BaseAppStatefulWidget extends StatefulWidget {
  const BaseAppStatefulWidget({super.key});

  @override
  BaseAppState createState() => createBaseState();

  BaseAppState createBaseState();
}

abstract class BaseAppState<T extends BaseAppStatefulWidget> extends State<T> {
  late AppThemeManager appTheme;
  late AppLanguageManager languageManager;

  late final CancelToken cancelToken;

  bool? ignoreOpenCloseEvents;

  @override
  void initState() {
    super.initState();

    cancelToken = CancelToken();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppThemeManager>();
    languageManager = Provider.of<AppLanguageManager>(context);
  }

  @override
  void dispose() {
    cancelToken.cancel();
    super.dispose();
  }
}
