import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/navigation/app_navigator.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/modules/auth/domain/blocs/auth_cubit.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/ui/controllers/todo_detail_viewmodel.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => init(getIt);

Dep findDep<Dep extends Object>({String? instanceName}) {
  if (instanceName?.isNotEmpty ?? false) getIt<Dep>(instanceName: instanceName);
  return getIt<Dep>();
}

AppNavigator get navigator {
  return findDep<AppNavigator>();
}

void disposeAllControllers() {
  findDep<TodoDetailViewModel>().dispose();
}

void closeAllBlocs() {
  findDep<AuthCubit>().close();
  findDep<TodoCubit>().close();
}

void closeDb() async {
  await findDep<Isar>().close();
}

void disposeAllManagers() {
  findDep<AppLanguageManager>().dispose();
  findDep<AppThemeManager>().dispose();
}
