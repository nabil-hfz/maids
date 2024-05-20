// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:dio/dio.dart' as _i17;
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
    as _i19;
import '../../modules/auth/domain/blocs/auth_cubit.dart' as _i25;
import '../../modules/auth/domain/repo/auth_repository_i.dart' as _i20;
import '../../modules/auth/domain/repo/auth_repository_impl.dart' as _i21;
import '../../modules/todos/data/datasource/todo_local_data_source_impl.dart'
    as _i13;
import '../../modules/todos/data/datasource/todo_remote_data_source_impl.dart'
    as _i22;
import '../../modules/todos/domain/blocs/todo_cubit.dart' as _i24;
import '../../modules/todos/domain/repo/todo_repository_impl.dart' as _i23;
import '../../modules/todos/ui/controllers/todo_detail_viewmodel.dart' as _i10;
import '../../modules/todos/ui/controllers/todos_list_viewmodel.dart' as _i11;
import '../managers/localization/app_language.dart' as _i15;
import '../managers/navigation/app_navigator.dart' as _i3;
import '../managers/network/connection_checker.dart' as _i12;
import '../managers/network/dio_client.dart' as _i18;
import '../managers/theme/app_them_manager.dart' as _i16;
import '../shared_preferences/hlp_shared_preference.dart' as _i14;
import 'module/local_module.dart' as _i26;
import 'module/network_module.dart' as _i27;

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
  await gh.singletonAsync<_i4.Directory>(
    () async => await localModule.appDocumentsDirectory(),
    instanceName: 'appDocumentsDirectory',
    preResolve: true,
  );
  await gh.factoryAsync<_i5.FlutterSecureStorage>(
    () => localModule.secureStorage(),
    preResolve: true,
  );
  gh.singleton<_i6.IAuthLocalDataSource>(
    () => const _i6.ImplAuthLocalDataSource(),
  );
  await gh.factoryAsync<_i7.InternetConnection>(
    () => localModule.checker(),
    preResolve: true,
  );
  await gh.singletonAsync<_i8.Isar>(
    () async => localModule.database(
      await gh.getIt<_i4.Directory>(
        instanceName: 'appDocumentsDirectory',
      ),
    ),
    preResolve: true,
  );
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => localModule.prefs(),
    preResolve: true,
  );
  gh.singleton<_i10.TodoDetailViewModel>(() => _i10.TodoDetailViewModel());
  gh.singleton<_i11.TodosListViewModel>(() => _i11.TodosListViewModel());
  gh.singleton<_i12.ConnectionChecker>(
    () => _i12.ConnectionCheckerImpl(
      gh<_i7.InternetConnection>(),
    ),
  );
  await gh.singletonAsync<_i13.ITodoLocalDataSource>(
    () async => _i13.TodoLocalDataSource(
      await gh.getIt<_i8.Isar>(),
    ),
  );
  gh.singleton<_i14.SharedPreferenceHelper>(
    () => _i14.SharedPreferenceHelper(
      gh<_i9.SharedPreferences>(),
      gh<_i5.FlutterSecureStorage>(),
    ),
  );
  gh.singleton<_i15.AppLanguageManager>(
    () => _i15.AppLanguageManager(
      gh<_i14.SharedPreferenceHelper>(),
    ),
    dispose: (i) => i.disposeManager(),
  );
  gh.singleton<_i16.AppThemeManager>(
    () => _i16.AppThemeManager(
      gh<_i14.SharedPreferenceHelper>(),
    ),
    dispose: (i) => i.disposeManager(),
  );
  gh.factory<_i17.Dio>(
    () => serviceModule.getDio(
      gh<_i14.SharedPreferenceHelper>(),
    ),
  );
  gh.singleton<_i18.DioClient>(
    () => _i18.DioClient(
      gh<_i17.Dio>(),
    ),
  );
  gh.singleton<_i19.IAuthRemoteDataSource>(
    () => _i19.ImplAuthRemoteDataSource(
      gh<_i18.DioClient>(),
    ),
  );
  gh.singleton<_i20.IAuthRepository>(
    () => _i21.ImplAuthRepository(
      gh<_i19.IAuthRemoteDataSource>(),
      gh<_i14.SharedPreferenceHelper>(),
    ),
  );
  gh.singleton<_i22.ITodoRemoteDataSource>(
    () => _i22.TodoRemoteDataSource(
      gh<_i18.DioClient>(),
    ),
  );
  await gh.singletonAsync<_i23.ImplTodoRepository>(
    () async => _i23.ImplTodoRepository(
      gh<_i12.ConnectionChecker>(),
      gh<_i22.ITodoRemoteDataSource>(),
      await gh.getAsync<_i13.ITodoLocalDataSource>(),
    ),
  );
  await gh.singletonAsync<_i24.TodoCubit>(
    () async => _i24.TodoCubit(
      await gh.getAsync<_i23.ImplTodoRepository>(),
    ),
  );
  gh.singleton<_i25.AuthCubit>(
    () => _i25.AuthCubit(
      gh<_i20.IAuthRepository>(),
    ),
  );
  return getIt;
}

class _$LocalModule extends _i26.LocalModule {}

class _$ServiceModule extends _i27.ServiceModule {}
