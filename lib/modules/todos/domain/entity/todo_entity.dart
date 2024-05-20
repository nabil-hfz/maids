// Project imports:
import 'package:isar/isar.dart';
import 'package:maids/core/entity/base_entity.dart';
import 'package:maids/modules/todos/data/models/todo_model.dart';

class TodosListEntity extends BaseEntity {
  final int total;
  final List<TodoEntity> items;

  const TodosListEntity({
    required this.total,
    required this.items,
  });

  TodosListModel toModel() {
    return TodosListModel(
      total: total,
      todos: items.map((e) => e.toModel()).toList(),
    );
  }

  @override
  List<Object?> get props => [total, items];

  @override
  String toString() {
    return '$TodosListEntity(${props.join(', ')})';
  }
}

class TodoEntity extends BaseEntity {
  final int? id;
  final String? todo;
  final int? userId;
  final bool? completed;
  final bool? isDeleted;
  final DateTime? deletedOn;

  const TodoEntity({
    this.id,
    this.todo,
    this.userId,
    this.completed,
    this.isDeleted,
    this.deletedOn,
  });

  TodoModel toModel() {
    return TodoModel(
      id: id,
      todo: todo,
      userId: userId,
      completed: completed,
      isDeleted: isDeleted,
      deletedOn: deletedOn,
    );
  }

  @override
  List<Object?> get props => [
        id,
        todo,
        userId,
        completed,
        isDeleted,
        deletedOn,
      ];

  @override
  String toString() {
    return '$TodoEntity(${props.join(', ')})';
  }
}
