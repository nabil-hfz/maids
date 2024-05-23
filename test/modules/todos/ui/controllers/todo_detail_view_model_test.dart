import 'package:flutter_test/flutter_test.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';
import 'package:maids/modules/todos/ui/controllers/todo_detail_viewmodel.dart';
import 'package:maids/modules/todos/ui/pages/todos_list_page.dart';

void main() {
  group('TodoDetailViewModel', () {
    late TodoDetailViewModel viewModel;

    setUp(() {
      viewModel = TodoDetailViewModel();
    });

    test('initial values are correct', () {
      expect(viewModel.todo, '');
      expect(viewModel.isCompleted, false);
      expect(viewModel.isSavingAllowed, false);
      expect(viewModel.isAdding, true);
      expect(viewModel.isDisposed, false);
    });

    test('enterTodo updates todo', () {
      viewModel.enterTodo('Write unit tests');
      expect(viewModel.todo, 'Write unit tests');
      expect(viewModel.isSavingAllowed, true);
    });

    test('enterUserId updates userId', () {
      viewModel.enterUserId(123);
      expect(viewModel.userId, 123);
    });

    test('enterIsCompleted updates isCompleted', () {
      viewModel.enterIsCompleted(true);
      expect(viewModel.isCompleted, true);
    });

    test('setDetailType updates type', () {
      viewModel.setDetailType(TodoDetailType.edit);
      expect(viewModel.isAdding, false);
    });

    test('setItemEditing updates item and notifies listeners', () {
      const item = TodoEntity(
        id: 1,
        userId: 123,
        todo: 'Write unit tests',
        completed: false,
      );

      bool notified = false;
      viewModel.addListener(() {
        notified = true;
      });

      viewModel.setItemEditing(item);
      expect(viewModel.userId, 123);
      expect(notified, true);
    });

    test('getTodo returns correct entity for adding', () {
      viewModel.enterTodo('Write unit tests');
      viewModel.enterUserId(123);
      viewModel.enterIsCompleted(true);

      final todo = viewModel.getTodo();
      expect(todo.id, null);
      expect(todo.todo, 'Write unit tests');
      expect(todo.userId, 123);
      expect(todo.completed, true);
    });

    test('getTodo returns correct entity for editing', () {
      const item = TodoEntity(
        id: 1,
        userId: 123,
        todo: 'Write unit tests',
        completed: false,
      );
      viewModel.setDetailType(TodoDetailType.edit);
      viewModel.setItemEditing(item);

      viewModel.enterTodo('Write more unit tests');
      viewModel.enterIsCompleted(true);

      final todo = viewModel.getTodo();
      expect(todo.id, 1);
      expect(todo.todo, 'Write more unit tests');
      expect(todo.userId, 123);
      expect(todo.completed, true);
    });

    test('reset resets to initial values', () {
      viewModel.enterTodo('Write unit tests');
      viewModel.enterIsCompleted(true);
      viewModel.reset();
      expect(viewModel.todo, '');
      expect(viewModel.isCompleted, false);
      expect(viewModel.isAdding, true);
    });

    test('dispose sets isDisposed to true', () {
      viewModel.dispose();
      expect(viewModel.isDisposed, true);
    });
  });
}
