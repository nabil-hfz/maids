class AppEndpoints {
  AppEndpoints._();

  static String baseUrl = "";
  static const String _auth = "auth";

  static const String login = "$_auth/login";
  static const String getProfile = "$_auth/me";
  static const String refresh = "$_auth/refresh";

  // Todos API
  static const String _todo = "todos";

  static const String getTodosList = _todo;

  static const String createTodo = "$_todo/add";

  static String todoDetails(id) => "todos/${id.toString()}";

  static const int receiveTimeout = 15000;

  static const int connectionTimeout = 30000;
}
