import 'package:maids/modules/todos/domain/entity/todo_entity.dart';
import 'package:maids/modules/todos/ui/pages/todos_list_page.dart';

class TodoDetailsArgs {
  TodoEntity? todo;
  TodoDetailType? type;

  TodoDetailsArgs({this.todo, this.type});
}
