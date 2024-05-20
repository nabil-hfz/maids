import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:maids/core/model/base_filter.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/modules/todos/data/models/todo_model.dart';

abstract class ITodoLocalDataSource {
  const ITodoLocalDataSource();

  Future<Result<TodosListModel>> getTodos({
    required BaseFilter filter,
  });

  Future<Result<TodoModel>> getTodo({
    required int id,
  });
}

@Singleton(as: ITodoLocalDataSource)
class TodoLocalDataSource implements ITodoLocalDataSource {
  const TodoLocalDataSource(this.db);

  final Isar db;

  @override
  Future<Result<TodosListModel>> getTodos({
    required BaseFilter filter,
  }) async {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<Result<TodoModel>> getTodo({
    required int id,
    CancelToken? cancelToken,
  }) {
    // TODO: implement getTodo
    throw UnimplementedError();
  }
}
