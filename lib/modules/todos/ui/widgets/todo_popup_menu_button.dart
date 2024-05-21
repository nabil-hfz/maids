import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/navigation/app_navigation_arg.dart';
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/utils/logger.dart';
import 'package:maids/core/widgets/dialogs/confirm_dialog.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';
import 'package:maids/modules/todos/ui/args/todo_details_args.dart';
import 'package:maids/modules/todos/ui/pages/todos_list_page.dart';

enum TodoActions { complete, edit, delete }

class TodoPopupMenuButton extends StatelessWidget {
  const TodoPopupMenuButton({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    AppThemeManager appTheme = context.watch<AppThemeManager>();
    return PopupMenuButton<TodoActions>(
      onSelected: (value) => _onSelected(value, context),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<TodoActions>>[
        _buildMenuItem(
          title: translate.edit,
          action: TodoActions.edit,
          appTheme: appTheme,
        ),
        if (!(todo.completed ?? false))
          _buildMenuItem(
            title: translate.complete,
            action: TodoActions.complete,
            appTheme: appTheme,
          ),
        _buildMenuItem(
          title: translate.delete,
          action: TodoActions.delete,
          appTheme: appTheme,
        ),
      ],
    );
  }

  _buildMenuItem({
    required String title,
    required TodoActions action,
    required AppThemeManager appTheme,
  }) {
    return PopupMenuItem<TodoActions>(
      value: action,
      child: Text(
        title,
        style: appTextStyle.medium14.copyWith(
          color: appTheme.appColors.textColor,
        ),
      ),
    );
  }

  void _onSelected(TodoActions value, BuildContext context) {
    switch (value) {
      case TodoActions.edit:
        _onEdit(context);
        break;

      case TodoActions.complete:
        _onComplete(context);
        break;
      case TodoActions.delete:
      default:
        _onDelete(context);
        break;
    }
  }

  void _onEdit(BuildContext context) {
    Logger.debug(todo);
    navigator.pushNamed(
      Routes.todoAddEditPage,
      pathParameters: {
        RoutesQP.action: TodoDetailType.edit.name,
      },
      extra: BaseNavigationArg(
        navigationType: AppUtils.languagePlatform(
          arabic: NavigationType.slideHorizontalRight,
          english: NavigationType.slideHorizontalLeft,
        ),
        data: TodoDetailsArgs(todo: todo, type: TodoDetailType.edit),
      ),
    );
  }

  void _onComplete(BuildContext context) {
    TodoCubit cubit = findDep();
    final completedTodo = todo.copyWith(completed: true);
    cubit.updateTodo(todo: completedTodo);
  }

  void _onDelete(context) async {
    _showDialog(
      context: context,
      title: translate.delete_todo,
      onPressed: () {
        TodoCubit cubit = findDep();
        cubit.deleteTodo(id: todo.id ?? -1);
      },
    );
  }

  void _showDialog({
    required BuildContext context,
    required String title,
    required Null Function() onPressed,
  }) {
    AppUtils.appShowDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialog(
        desc: translate.are_you_sure_to_continue,
        title: title,
        confirmAction: onPressed,
      ),
    );
  }
}
