class AppEndpoints {
  AppEndpoints._();

  static String baseUrl = "https://dummyjson.com/";
  static const String _auth = "auth";

  static const String login = "$_auth/login";
  static const String getProfile = "$_auth/me";
  static const String refresh = "$_auth/refresh";

  // Todos API
  static const String _todo = "todos";

  static const String getAllTodos = _todo;

  static String getTodoDetails(String id) => "$_todo/$id";
  static const String addTodo = "$_todo/add";

  static String editTodo(String id) => "$_todo/$id";

  static String deleteTodo(String id) => "$_todo/$id";

  static const int receiveTimeout = 15000;

  static const int connectionTimeout = 30000;
}