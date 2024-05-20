import 'package:dio/dio.dart';
import 'package:maids/core/model/base_filter.dart';

import 'package:maids/core/model/result.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';

abstract class ITodoRepository {
  const ITodoRepository();

  Future<Result<TodosListEntity>> getTodos({
    required BaseFilter filter,
    CancelToken? cancelToken,
  });

  Future<Result<TodoEntity>> getTodo({
    required int id,
    CancelToken? cancelToken,
  });

  Future<Result<TodoEntity>> createTodo({
    required TodoEntity todo,
    CancelToken? cancelToken,
  });

  Future<Result<TodoEntity>> updateTodo({
    required TodoEntity todo,
    CancelToken? cancelToken,
  });

  Future<Result<TodoEntity>> deleteTodos({
    required int id,
    CancelToken? cancelToken,
  });
}
