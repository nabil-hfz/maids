part of 'todo_cubit.dart';

class TodoState {
  const TodoState({
    required this.getTodos,
    required this.getTodo,
    required this.createTodo,
    required this.updateTodo,
    required this.deleteTodo,
  });

  final BaseState getTodos;
  final BaseState getTodo;
  final BaseState createTodo;
  final BaseState updateTodo;
  final BaseState deleteTodo;

  factory TodoState.initialState() => const TodoState(
        getTodos: BaseInitState(),
        getTodo: BaseInitState(),
        createTodo: BaseInitState(),
        updateTodo: BaseInitState(),
        deleteTodo: BaseInitState(),
      );

  TodoState copyWith({
    BaseState? getTodos,
    BaseState? getTodo,
    BaseState? createTodo,
    BaseState? updateTodo,
    BaseState? deleteTodo,
  }) {
    return TodoState(
      getTodos: getTodos ?? this.getTodos,
      getTodo: getTodo ?? this.getTodo,
      createTodo: createTodo ?? this.createTodo,
      updateTodo: updateTodo ?? this.updateTodo,
      deleteTodo: deleteTodo ?? this.deleteTodo,
    );
  }

  @override
  String toString() {
    return '$TodoState('
        'getTodos: $getTodos, '
        'getTodo: $getTodo'
        'createTodo: $createTodo'
        'createTodo: $createTodo'
        'updateTodo: $updateTodo'
        'deleteTodo: $deleteTodo'
        ')';
  }
}

class TodosSuccess extends BaseSuccessState {
  final List<TodoEntity> todos;

  const TodosSuccess({required this.todos});

  @override
  List<Object> get props => [todos];

  @override
  String toString() => '$TodosSuccess(todos: $todos)';
}

class TodoSuccess extends BaseSuccessState {
  final TodoEntity todo;

  const TodoSuccess({required this.todo});

  @override
  List<Object> get props => [todo];

  @override
  String toString() => '$TodoSuccess(todo: $todo)';
}
