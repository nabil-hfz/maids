import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/bloc/base/base_cubit.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_init_state.dart';
import 'package:maids/core/bloc/base/states/base_loading_state.dart';
import 'package:maids/core/bloc/base/states/base_state.dart';
import 'package:maids/core/bloc/base/states/base_success_state.dart';
import 'package:maids/core/widgets/general/refresh_wrapper.dart';
import 'package:maids/modules/todos/data/models/todo_filter_model.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';
import 'package:maids/modules/todos/domain/repo/todo_repository_impl.dart';

part 'todo_state.dart';

@singleton
class TodoCubit extends BaseCubit<TodoState> {
  late final ImplTodoRepository _repository;

  final List<TodoEntity> _todos = [];
  late TodoFilterModel _todosFilter;

  TodoCubit(
    this._repository,
  ) : super(TodoState.initialState()) {
    _todosFilter = const TodoFilterModel();
  }

  Future<void> getTodos({
    CancelToken? cancelToken,
    bool isRefresh = false,
    RefreshControllerHandler? controller,
    TodoFilterModel? filter,
  }) async {
    final index = _todosFilter.skip;
    if (filter != null) {
      _todosFilter = filter.copyWith();
    }

    if (isRefresh) {
      emit(state.copyWith(getTodos: const BaseLoadingState()));
      _todosFilter = const TodoFilterModel();
    } else {
      _todosFilter = _todosFilter.copyWith(skip: index);
    }

    final results = await _repository.getTodos(
      cancelToken: cancelToken,
      filter: _todosFilter,
    );

    controller?.handleList(results.data!.items);
    if (results.hasDataOnly) {
      _todosFilter = _todosFilter.copyWith(skip: _todosFilter.skip + 1);
      if (isRefresh) _todos.clear();
      _todos.addAll(results.data!.items);
      emit(state.copyWith(getTodos: TodosSuccess(todos: _todos)));
    } else {
      emit(
        state.copyWith(
          getTodos: BaseFailState(
            results.error,
            callback: () {
              getTodos(
                cancelToken: cancelToken,
                isRefresh: isRefresh,
              );
            },
          ),
        ),
      );
    }
  }

  void getTodo({
    required int id,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) async {
    if (isRefresh) {
      emit(state.copyWith(getTodo: const BaseLoadingState()));
    }
    final result = await _repository.getTodo(
      cancelToken: cancelToken,
      id: id,
    );

    if (result.hasDataOnly) {
      emit(state.copyWith(getTodo: TodoSuccess(todo: result.data!)));
    } else {
      emit(
        state.copyWith(
          getTodo: BaseFailState(
            result.error,
            callback: () {
              getTodo(cancelToken: cancelToken, id: id);
            },
          ),
        ),
      );
    }
  }

  void createTodo({
    required TodoEntity todo,
    CancelToken? cancelToken,
  }) async {
    emit(state.copyWith(createTodo: const BaseLoadingState()));

    final result = await _repository.createTodo(
      todo: todo,
      cancelToken: cancelToken,
    );

    if (result.hasDataOnly) {
      emit(state.copyWith(createTodo: const BaseSuccessState()));
      final resultTodo = result.data!;
      print('resultTodo is $resultTodo');
      _addTodoListLocally(resultTodo);
    } else {
      emit(
        state.copyWith(
          createTodo: BaseFailState(
            result.error,
            callback: () {
              createTodo(todo: todo, cancelToken: cancelToken);
            },
          ),
        ),
      );
    }
    emit(state.copyWith(createTodo: const BaseInitState()));
  }

  void updateTodo({
    required TodoEntity todo,
    CancelToken? cancelToken,
  }) async {
    emit(state.copyWith(updateTodo: BaseLoadingState(data: todo.id)));

    final result = await _repository.updateTodo(
      todo: todo,
      cancelToken: cancelToken,
    );

    if (result.hasDataOnly) {
      emit(state.copyWith(updateTodo: const BaseSuccessState()));
      final resultTodo = result.data!;
      _updateTodoListLocally(resultTodo);
    } else {
      emit(
        state.copyWith(
          updateTodo: BaseFailState(
            result.error,
            callback: () {
              updateTodo(todo: todo, cancelToken: cancelToken);
            },
          ),
        ),
      );
    }
    emit(state.copyWith(updateTodo: const BaseInitState()));
  }

  void deleteTodo({
    required int id,
    CancelToken? cancelToken,
  }) async {
    emit(state.copyWith(deleteTodo: BaseLoadingState(data: id)));

    final result = await _repository.deleteTodos(
      id: id,
      cancelToken: cancelToken,
    );

    if (result.hasDataOnly) {
      emit(state.copyWith(deleteTodo: const BaseSuccessState()));
      _deleteTodoListLocally(id);
    } else {
      emit(
        state.copyWith(
          deleteTodo: BaseFailState(
            result.error,
            callback: () {
              deleteTodo(id: id, cancelToken: cancelToken);
            },
          ),
        ),
      );
    }
    emit(state.copyWith(deleteTodo: const BaseInitState()));
  }

  void _addTodoListLocally(TodoEntity todo) {
    _todos.insert(0, todo);
    emit(state.copyWith(getTodos: TodosSuccess(todos: _todos)));
  }

  void _updateTodoListLocally(TodoEntity todo) {
    final index = _todos.indexWhere((element) => element.id == todo.id);
    _todos[index] = todo;

    emit(state.copyWith(getTodos: TodosSuccess(todos: _todos)));
  }

  void _deleteTodoListLocally(int todoId) {
    _todos.removeWhere((element) => element.id == todoId);

    emit(state.copyWith(getTodos: TodosSuccess(todos: _todos)));
  }
}
