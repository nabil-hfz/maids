class Routes {
  Routes._();

  static const String splash = '/';
  static const String introductionPage = '/introduction';

  /// Auth Pages
  static const String logInPage = '/login';

  /// main pages
  static const String _todos = '/todos';
  static const String todosPage = _todos;
  static const String todoAddEditPage = ':${RoutesQP.action}';
  static const String morePage = '/more';
}

class RoutesQP {
  static const String action = 'action';
  static const String id = 'id';
}
