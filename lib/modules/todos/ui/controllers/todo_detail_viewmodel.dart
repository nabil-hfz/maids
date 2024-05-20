// Dart imports:
// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';
import 'package:maids/modules/todos/ui/pages/todos_list_page.dart';

@Singleton()
class TodoDetailViewModel extends ChangeNotifier {
  TodoDetailViewModel();

  TodoEntity? _itemEditing;
  TodoDetailType _type = TodoDetailType.add;
  bool _isDisposed = false;

  //
  int? _id;
  int? _userId;
  String _todo = '';
  bool _isCompleted = true;

  //

  int? get id => _id;

  int? get userId => _userId;

  String get todo => _todo;

  bool? get isCompleted => _isCompleted;

  bool get isSavingAllowed {
    return _todo.isNotEmpty;
  }

  bool get isAdding => _type == TodoDetailType.add;

  bool get isDisposed => _isDisposed;

  void setDetailType(TodoDetailType type) {
    _type = type;
  }

  void setItemEditing(TodoEntity item) {
    _itemEditing = item;
    _id = _itemEditing?.id;
    _userId = _itemEditing?.userId;

    if (!_isDisposed) notifyListeners();
  }

  void enterTodo(String todo) {
    _todo = todo;
  }

  void enterIsCompleted(bool value) {
    _isCompleted = value;
    if (!_isDisposed) notifyListeners();
  }

  TodoEntity getTodo() {
    late TodoEntity item;
    switch (_type) {
      case TodoDetailType.add:
        item = TodoEntity(
          userId: _userId,
          todo: _todo,
          completed: _isCompleted,
        );
        break;
      case TodoDetailType.edit:
        item = TodoEntity(
          id: id,
          userId: _userId,
          todo: _todo,
          completed: _isCompleted,
          isDeleted: true,
        );

        break;
    }
    return item;
  }

  void reset() {
    _type = TodoDetailType.add;

    _todo = '';
    _isDisposed = false;
    _isCompleted = true;
    _itemEditing = null;
  }

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }
}
