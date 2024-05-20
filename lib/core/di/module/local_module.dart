import 'dart:async';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:maids/main.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class LocalModule {
  @Named("appDocumentsDirectory")
  Future<Directory> get appDocumentsDirectory =>
      getApplicationDocumentsDirectory();

  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<FlutterSecureStorage> get secureStorage =>
      Future(() => const FlutterSecureStorage());

  /// A singleton Internet Connection Checker provider.
  ///
  /// Calling it multiple times will return the same instance and awaiting
  /// and registering its resolved value at the end.
  @preResolve
  Future<InternetConnection> get checker =>
      Future.value(InternetConnection.createInstance());

  /// A singleton Isar Database provider.
  ///
  /// Calling it multiple times will return the same instance and awaiting
  /// and registering its resolved value at the end.
  @Singleton()
  Future<Isar> database(
    @Named('appDocumentsDirectory') Directory dir,
  ) async {
    return await Isar.open(
      [],
      directory: dir.path,
      inspector: !isRelease,
    );
  }
}
