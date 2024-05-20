import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/constants/app_endpoints.dart';
import 'package:maids/core/managers/network/dio_client.dart';
import 'package:maids/core/model/base_filter.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/modules/todos/data/models/todo_model.dart';

abstract class ITodoRemoteDataSource {
  const ITodoRemoteDataSource();

  Future<Result<TodosListModel>> getTodos({
    required BaseFilter filter,
    CancelToken? cancelToken,
  });

  Future<Result<TodoModel>> getTodo({
    required int id,
    CancelToken? cancelToken,
  });

  Future<Result<TodoModel>> createTodo({
    required TodoModel todo,
    CancelToken? cancelToken,
  });

  Future<Result<TodoModel>> updateTodo({
    required TodoModel todo,
    CancelToken? cancelToken,
  });

  Future<Result<TodoModel>> deleteTodo({
    required int id,
    CancelToken? cancelToken,
  });
}

@Singleton(as: ITodoRemoteDataSource)
class TodoRemoteDataSource implements ITodoRemoteDataSource {
  final DioClient _dioClient;

  TodoRemoteDataSource(this._dioClient) {
    _dioClient.toString();
    // buildList();
  }

  static int index = 0;
  static List<TodoModel> todos = [];

  @override
  Future<Result<TodosListModel>> getTodos({
    required BaseFilter filter,
    CancelToken? cancelToken,
  }) async {
    Map<String, dynamic> queryParameters = {...filter.toJson()};
    return await _dioClient.get<TodosListModel>(
      AppEndpoints.getTodosList,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      converter: (json) {
        print("json is $json");
        return TodosListModel.fromJson(json);
      },
    );
  }

  @override
  Future<Result<TodoModel>> createTodo({
    required TodoModel todo,
    CancelToken? cancelToken,
  }) async {
    Map<String, dynamic> todoData = {...todo.toJson()};

    return await _dioClient.post<TodoModel>(
      AppEndpoints.createTodo,
      data: todoData,
      cancelToken: cancelToken,
      converterDynamic: (todoId) {
        todoData['id'] = todoId;
        return TodoModel.fromJson(todoData);
      },
    );
  }

  @override
  Future<Result<TodoModel>> deleteTodo({
    required int id,
    CancelToken? cancelToken,
  }) async {
    return await _dioClient.delete<TodoModel>(
      AppEndpoints.deleteTodo(id),
      cancelToken: cancelToken,
      converterDynamic: (data) {
        return TodoModel.fromJson(data);
      },
    );
  }

  @override
  Future<Result<TodoModel>> getTodo({
    required int id,
    CancelToken? cancelToken,
  }) async {
    return await _dioClient.get<TodoModel>(
      AppEndpoints.getTodoDetails(id),
      cancelToken: cancelToken,
      converter: (json) {
        return TodoModel.fromJson(json);
      },
    );
  }

  @override
  Future<Result<TodoModel>> updateTodo({
    required TodoModel todo,
    CancelToken? cancelToken,
  }) async {
    Map<String, dynamic> todoData = {...todo.toJson()};

    return await _dioClient.put<TodoModel>(
      "${AppEndpoints.updateTodo}${todo.id}",
      data: todoData,
      cancelToken: cancelToken,
      converterDynamic: (response) {
        return TodoModel.fromJson(todoData);
      },
    );
  }
}
