// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:dio/dio.dart' as _i16;
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
    as _i18;
import '../../modules/auth/domain/blocs/auth_cubit.dart' as _i24;
import '../../modules/auth/domain/repo/auth_repository_i.dart' as _i19;
import '../../modules/auth/domain/repo/auth_repository_impl.dart' as _i20;
import '../../modules/todos/data/datasource/todo_local_data_source_impl.dart'
    as _i12;
import '../../modules/todos/data/datasource/todo_remote_data_source_impl.dart'
    as _i21;
import '../../modules/todos/domain/blocs/todo_cubit.dart' as _i23;
import '../../modules/todos/domain/repo/todo_repository_impl.dart' as _i22;
import '../../modules/todos/ui/controllers/todo_detail_viewmodel.dart' as _i10;
import '../managers/localization/app_language.dart' as _i14;
import '../managers/navigation/app_navigator.dart' as _i3;
import '../managers/network/connection_checker.dart' as _i11;
import '../managers/network/dio_client.dart' as _i17;
import '../managers/theme/app_them_manager.dart' as _i15;
import '../shared_preferences/shared_preference_helper.dart' as _i13;
import 'module/local_module.dart' as _i25;
import 'module/network_module.dart' as _i26;

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
  await gh.factoryAsync<_i4.Directory>(
    () => localModule.appDocumentsDirectory(),
    instanceName: 'appDocumentsDirectory',
    preResolve: true,
  );
  await gh.factoryAsync<_i5.FlutterSecureStorage>(
    () => localModule.secureStorage(),
    preResolve: true,
  );
  gh.singleton<_i6.IAuthLocalDataSource>(
      () => const _i6.ImplAuthLocalDataSource());
  await gh.factoryAsync<_i7.InternetConnection>(
    () => localModule.checker(),
    preResolve: true,
  );
  await gh.factoryAsync<_i8.Isar>(
    () => localModule
        .database(gh<_i4.Directory>(instanceName: 'appDocumentsDirectory')),
    preResolve: true,
  );
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => localModule.prefs(),
    preResolve: true,
  );
  gh.singleton<_i10.TodoDetailViewModel>(() => _i10.TodoDetailViewModel());
  gh.singleton<_i11.ConnectionChecker>(
      () => _i11.ConnectionCheckerImpl(gh<_i7.InternetConnection>()));
  gh.singleton<_i12.ITodoLocalDataSource>(
      () => _i12.TodoLocalDataSource(gh<_i8.Isar>()));
  gh.singleton<_i13.SharedPreferenceHelper>(() => _i13.SharedPreferenceHelper(
        gh<_i9.SharedPreferences>(),
        gh<_i5.FlutterSecureStorage>(),
      ));
  gh.singleton<_i14.AppLanguageManager>(
    () => _i14.AppLanguageManager(gh<_i13.SharedPreferenceHelper>()),
    dispose: (i) => i.disposeManager(),
  );
  gh.singleton<_i15.AppThemeManager>(
    () => _i15.AppThemeManager(gh<_i13.SharedPreferenceHelper>()),
    dispose: (i) => i.disposeManager(),
  );
  gh.factory<_i16.Dio>(
      () => serviceModule.getDio(gh<_i13.SharedPreferenceHelper>()));
  gh.singleton<_i17.DioClient>(() => _i17.DioClient(gh<_i16.Dio>()));
  gh.singleton<_i18.IAuthRemoteDataSource>(
      () => _i18.ImplAuthRemoteDataSource(gh<_i17.DioClient>()));
  gh.singleton<_i19.IAuthRepository>(() => _i20.ImplAuthRepository(
        gh<_i18.IAuthRemoteDataSource>(),
        gh<_i13.SharedPreferenceHelper>(),
        gh<_i8.Isar>(),
      ));
  gh.singleton<_i21.ITodoRemoteDataSource>(
      () => _i21.TodoRemoteDataSource(gh<_i17.DioClient>()));
  gh.singleton<_i22.ImplTodoRepository>(() => _i22.ImplTodoRepository(
        gh<_i11.ConnectionChecker>(),
        gh<_i21.ITodoRemoteDataSource>(),
        gh<_i12.ITodoLocalDataSource>(),
      ));
  gh.singleton<_i23.TodoCubit>(
      () => _i23.TodoCubit(gh<_i22.ImplTodoRepository>()));
  gh.singleton<_i24.AuthCubit>(
      () => _i24.AuthCubit(gh<_i19.IAuthRepository>()));
  return getIt;
}

class _$LocalModule extends _i25.LocalModule {}

class _$ServiceModule extends _i26.ServiceModule {}
