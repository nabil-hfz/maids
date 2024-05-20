import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/managers/navigation/app_navigator.dart';

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
