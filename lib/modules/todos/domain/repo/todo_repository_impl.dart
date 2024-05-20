// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:maids/core/managers/network/connection_checker.dart';
import 'package:maids/core/model/base_filter.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/core/repository/base_repository.dart';
import 'package:maids/modules/todos/data/datasource/todo_local_data_source_impl.dart';
import 'package:maids/modules/todos/data/datasource/todo_remote_data_source_impl.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';

import 'todo_repository_i.dart';

@Singleton()
class ImplTodoRepository extends ITodoRepository {
  final ConnectionChecker _connectionChecker;
  final ITodoRemoteDataSource _remoteDataSource;
  final ITodoLocalDataSource _localDataSource;

  ImplTodoRepository(
    this._connectionChecker,
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Result<TodosListEntity>> getTodos({
    required BaseFilter filter,
    CancelToken? cancelToken,
  }) async {
    final result = await _remoteDataSource.getTodos(
      cancelToken: cancelToken,
      filter: filter,
    );
    return BaseRepository.execute(
      remoteResult: result,
    );
  }

  @override
  Future<Result<TodoEntity>> createTodo({
    required TodoEntity todo,
    CancelToken? cancelToken,
  }) async {
    final result = await _remoteDataSource.createTodo(
      cancelToken: cancelToken,
      todo: todo.toModel(),
    );
    return BaseRepository.execute(remoteResult: result);
  }

  @override
  Future<Result<TodoEntity>> deleteTodos({
    required int id,
    CancelToken? cancelToken,
  }) async {
    final result = await _remoteDataSource.deleteTodo(
      cancelToken: cancelToken,
      id: id,
    );
    return BaseRepository.execute(remoteResult: result);
  }

  @override
  Future<Result<TodoEntity>> getTodo({
    required int id,
    CancelToken? cancelToken,
  }) async {
    final result = await _remoteDataSource.getTodo(
      cancelToken: cancelToken,
      id: id,
    );
    return BaseRepository.execute(remoteResult: result);
  }

  @override
  Future<Result<TodoEntity>> updateTodo({
    required TodoEntity todo,
    CancelToken? cancelToken,
  }) async {
    final result = await _remoteDataSource.updateTodo(
      cancelToken: cancelToken,
      todo: todo.toModel(),
    );
    return BaseRepository.execute(remoteResult: result);
  }
}
