import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:maids/core/model/base_model.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';

part 'todo_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class TodosListModel extends BaseModel<TodosListEntity> {
  final int? total;
  final List<TodoModel>? todos;

  const TodosListModel({
    required this.total,
    required this.todos,
  });

  factory TodosListModel.fromJson(Map<String, dynamic> json) =>
      _$TodosListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodosListModelToJson(this);

  @override
  TodosListEntity toEntity() {
    return TodosListEntity(
      total: total ?? 0,
      items: todos?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

@collection
@JsonSerializable(explicitToJson: true, anyMap: true)
class TodoModel extends BaseModel<TodoEntity> {
  final int? id;
  final String? todo;
  final int? userId;
  final bool? completed;
  final bool? isDeleted;
  final DateTime? deletedOn;

  Id get isarId => fastHash(id ?? 0);

  const TodoModel({
    this.id,
    this.todo,
    this.userId,
    this.completed,
    this.isDeleted,
    this.deletedOn,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  @override
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      todo: todo,
      userId: userId,
      completed: completed,
      isDeleted: isDeleted,
      deletedOn: deletedOn,
    );
  }

  // @override
  // @ignore
  // List<Object?> get props => [
  //       id,
  //       todo,
  //       userId,
  //       completed,
  //       isDeleted,
  //       deletedOn,
  //     ];
}
