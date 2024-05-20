// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:dio/dio.dart' as _i14;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i7;
import 'package:isar/isar.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../modules/auth/data/datasource/auth_local_data_source_impl.dart'
    as _i6;
import '../../modules/auth/data/datasource/auth_remote_data_source_impl.dart'
    as _i16;
import '../../modules/auth/domain/blocs/auth_cubit.dart' as _i19;
import '../../modules/auth/domain/repo/auth_repository_i.dart' as _i17;
import '../../modules/auth/domain/repo/auth_repository_impl.dart' as _i18;
import '../managers/localization/app_language.dart' as _i12;
import '../managers/navigation/app_navigator.dart' as _i3;
import '../managers/network/connection_checker.dart' as _i10;
import '../managers/network/dio_client.dart' as _i15;
import '../managers/theme/app_them_manager.dart' as _i13;
import '../shared_preferences/hlp_shared_preference.dart' as _i11;
import 'module/local_module.dart' as _i20;
import 'module/network_module.dart' as _i21;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final localModule = _$LocalModule();
  final serviceModule = _$ServiceModule();
  gh.singleton<_i3.AppNavigator>(() => _i3.AppNavigator());
  gh.factoryAsync<_i4.Directory>(
    () => localModule.appDocumentsDirectory,
    instanceName: 'appDocumentsDirectory',
  );
  await gh.factoryAsync<_i5.FlutterSecureStorage>(
    () => localModule.secureStorage,
    preResolve: true,
  );
  gh.singleton<_i6.IAuthLocalDataSource>(
      () => const _i6.ImplAuthLocalDataSource());
  await gh.factoryAsync<_i7.InternetConnection>(
    () => localModule.checker,
    preResolve: true,
  );
  gh.singletonAsync<_i8.Isar>(() async => localModule.database(
      await gh.getAsync<_i4.Directory>(instanceName: 'appDocumentsDirectory')));
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => localModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i10.ConnectionChecker>(
      () => _i10.ConnectionCheckerImpl(gh<_i7.InternetConnection>()));
  gh.singleton<_i11.SharedPreferenceHelper>(() => _i11.SharedPreferenceHelper(
        gh<_i9.SharedPreferences>(),
        gh<_i5.FlutterSecureStorage>(),
      ));
  gh.singleton<_i12.AppLanguageManager>(
    () => _i12.AppLanguageManager(gh<_i11.SharedPreferenceHelper>()),
    dispose: (i) => i.disposeManager(),
  );
  gh.singleton<_i13.AppThemeManager>(
    () => _i13.AppThemeManager(gh<_i11.SharedPreferenceHelper>()),
    dispose: (i) => i.disposeManager(),
  );
  gh.lazySingletonAsync<_i14.Dio>(
      () => serviceModule.getDio(gh<_i11.SharedPreferenceHelper>()));
  gh.singletonAsync<_i15.DioClient>(
      () async => _i15.DioClient(await gh.getAsync<_i14.Dio>()));
  gh.singletonAsync<_i16.IAuthRemoteDataSource>(() async =>
      _i16.ImplAuthRemoteDataSource(await gh.getAsync<_i15.DioClient>()));
  gh.singletonAsync<_i17.IAuthRepository>(() async => _i18.ImplAuthRepository(
        await gh.getAsync<_i16.IAuthRemoteDataSource>(),
        gh<_i11.SharedPreferenceHelper>(),
      ));
  gh.singletonAsync<_i19.AuthCubit>(
      () async => _i19.AuthCubit(await gh.getAsync<_i17.IAuthRepository>()));
  return getIt;
}

class _$LocalModule extends _i20.LocalModule {}

class _$ServiceModule extends _i21.ServiceModule {}
