import 'package:flutter_test/flutter_test.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';

void main() {
  group('TodoEntity', () {
    test('supports value comparisons', () {
      expect(
        TodoEntity(
          id: 1,
          todo: 'Test Todo',
          userId: 1,
          completed: true,
          isDeleted: false,
          deletedOn: DateTime(2023, 5, 22),
        ),
        TodoEntity(
          id: 1,
          todo: 'Test Todo',
          userId: 1,
          completed: true,
          isDeleted: false,
          deletedOn: DateTime(2023, 5, 22),
        ),
      );
    });

    test('copyWith creates a copy with updated values', () {
      final todo = TodoEntity(
        id: 1,
        todo: 'Test Todo',
        userId: 1,
        completed: true,
        isDeleted: false,
        deletedOn: DateTime(2023, 5, 22),
      );

      final updatedTodo = todo.copyWith(
        todo: 'Updated Todo',
        completed: false,
      );

      expect(updatedTodo.todo, 'Updated Todo');
      expect(updatedTodo.completed, false);
      expect(updatedTodo.id, 1); // unchanged
      expect(updatedTodo.userId, 1); // unchanged
      expect(updatedTodo.isDeleted, false); // unchanged
      expect(updatedTodo.deletedOn, DateTime(2023, 5, 22)); // unchanged
    });

    test('toModel converts entity to model', () {
      final todo = TodoEntity(
        id: 1,
        todo: 'Test Todo',
        userId: 1,
        completed: true,
        isDeleted: false,
        deletedOn: DateTime(2023, 5, 22),
      );

      final model = todo.toModel();

      expect(model.id, 1);
      expect(model.todo, 'Test Todo');
      expect(model.userId, 1);
      expect(model.completed, true);
      expect(model.isDeleted, false);
      expect(model.deletedOn, DateTime(2023, 5, 22));
    });

    test('toString returns correct string representation', () {
      final todo = TodoEntity(
        id: 1,
        todo: 'Test Todo',
        userId: 1,
        completed: true,
        isDeleted: false,
        deletedOn: DateTime(2023, 5, 22),
      );

      expect(
        todo.toString(),
        'TodoEntity(1, 1, Test Todo, true, false, 2023-05-22 00:00:00.000)',
      );
    });
  });
}
