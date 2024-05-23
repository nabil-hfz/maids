import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:maids/core/data_source/base_data_source.dart';
import 'package:maids/core/errors/errors.dart';
import 'package:maids/core/model/base_filter.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/modules/todos/data/models/todo_model.dart';

abstract class ITodoLocalDataSource {
  const ITodoLocalDataSource();

  Future<Result<TodosListModel>> getTodos({
    required BaseFilter filter,
  });

  Future<Result<bool>> saveTodos({
    required Result<TodosListModel> todos,
  });

  Future<Result<bool>> saveTodo({
    required Result<TodoModel> todo,
  });

  Future<Result<bool>> deleteTodo({
    required int id,
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
  Future<Result<bool>> saveTodos({
    required Result<TodosListModel> todos,
  }) async {
    return await transform(() async {
      if (todos.hasDataOnly &&
          todos.data != null &&
          (todos.data!.todos?.isNotEmpty ?? false)) {
        return await db.writeTxn(() async {
          for (var todo in todos.data!.todos!) {
            await db.todoModels.put(todo);
          }
          return true;
        });
      } else {
        return false;
      }
    });
  }

  @override
  Future<Result<TodosListModel>> getTodos({
    required BaseFilter filter,
  }) async {
    final parameters = filter.toJson();

    return await transform(() async {
      var todos = await db.todoModels
          .buildQuery<TodoModel>(
              limit: parameters["limit"], offset: parameters["skip"])
          .findAll();
      return TodosListModel(
        todos: todos,
        total: await db.todoModels.count(),
      );
    });
  }

  @override
  Future<Result<TodoModel>> getTodo({
    required int id,
  }) async {
    return await transform(() async {
      var todo = await db.todoModels.filter().idEqualTo(id).findFirst();
      if (todo == null) {
        throw const NoCacheDataFoundError();
      }
      return todo;
    });
  }

  @override
  Future<Result<bool>> saveTodo({
    required Result<TodoModel> todo,
  }) async {
    return await transform(() async {
      if (todo.hasDataOnly && todo.data != null) {
        await db.writeTxn(() async {
          await db.todoModels.put(todo.data!);
        });
      } else {
        return false;
      }
      return true;
    });
  }

  @override
  Future<Result<bool>> deleteTodo({
    required int id,
  }) async {
    return await transform(() async {
      return await db.writeTxn(() async {
        final res = await db.todoModels.filter().idEqualTo(id).deleteAll();
        return res > 0;
      });
    });
  }
}
