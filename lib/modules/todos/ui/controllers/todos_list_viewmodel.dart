import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/modules/todos/data/models/todo_filter_model.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';

@Singleton()
class TodosListViewModel extends ChangeNotifier {
  TodosListViewModel();

  TodoFilterModel _todoFilterModel = const TodoFilterModel();
  bool _isDisposed = false;

  final List<TodoEntity> _todos = [];

  set setInitialTodoList(List<TodoEntity> value) => _todos.addAll(value);

  List<TodoEntity> get todos => _todos;

  bool get isDisposed => _isDisposed;

  TodoFilterModel get todoFilterModel => _todoFilterModel;

  void addTodo(TodoEntity todo) {
    _checkIfTheyAreDifferentTypeAndClearThen(todo);
    _todos.add(todo);
    if (!_isDisposed) notifyListeners();
  }

  void removeTodo(int id) {
    _todos.removeWhere((todo) => todo.id == id);
    if (!_isDisposed) notifyListeners();
  }

  bool isTodoSelected(int id) {
    var value = _todos.indexWhere((todo) => todo.id == id);
    return value != -1;
  }

  void reset() {
    _todoFilterModel = const TodoFilterModel();
    _todos.clear();
    _isDisposed = false;
  }

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }

  void _checkIfTheyAreDifferentTypeAndClearThen(TodoEntity todo) {
    if (_todos.isNotEmpty) {
      // final res =
      //     _todos.any((element) => element.customerType != todo.customerType);
      // if (res) {
      //   _todos.clear();
      // }
    }
  }
}
