import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_state.dart';
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/navigation/app_navigation_arg.dart';
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/widgets/buttons/app_floating_action_button.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/base_stateful_app_widget.dart';
import 'package:maids/core/widgets/general/maids_app_bar.dart';
import 'package:maids/core/widgets/general/no_data_found_widget.dart';
import 'package:maids/core/widgets/general/refresh_wrapper.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/ui/args/todo_details_args.dart';
import 'package:maids/modules/todos/ui/widgets/todo_item_widget.dart';
import 'package:maids/modules/todos/ui/widgets/todo_list_loader_widget.dart';
import 'package:rxdart/rxdart.dart';

enum TodoDetailType { add, edit }

class TodosListPage extends BaseAppStatefulWidget {
  const TodosListPage({super.key});

  @override
  _TodosPageState createBaseState() => _TodosPageState();
}

class _TodosPageState extends BaseAppState<TodosListPage> {
  late final TodoCubit _todoBloc = getIt<TodoCubit>();
  final BehaviorSubject<RefreshControllerHandler> _refreshController =
      BehaviorSubject();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MaidsAppBar(
        centerTitle: true,
        title: translate.todos,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: appTheme.appColors.scaffoldBgClearColor,
      floatingActionButton: AppFloatingActionButton(
        onPressed: () {
          navigator.pushNamed(
            Routes.todoAddEditPage,
            pathParameters: {
              RoutesQP.action: TodoDetailType.add.name,
            },
            extra: BaseNavigationArg(
              navigationType: NavigationType.fadeScale,
              data: TodoDetailsArgs(type: TodoDetailType.add),
            ),
          );
        },
      ),
      body: SafeArea(
        child: BlocBuilder<TodoCubit, TodoState>(
          bloc: _todoBloc,
          builder: (context, state) {
            return RefreshWrapper(
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: _onRefresh,
              onLoading: _onLoad,
              physics: const AlwaysScrollableScrollPhysics(),
              onControllerInitiated: (RefreshControllerHandler controller) {
                _refreshController.add(controller);
              },
              child: _buildBody(state.getTodos),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BaseState todosState) {
    if (todosState is BaseFailState) {
      final error = todosState;
      return Padding(
        padding: const EdgeInsets.only(top: AppDimens.space8),
        child: AppErrorWidget(
          errorState: error,
        ),
      );
    }
    if (todosState is TodosSuccess) {
      final todos = todosState.todos;
      if (todos.isNotEmpty) {
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoItemWidget(todo: todos.elementAt(index));
          },
        );
      }
      return NoDataFoundWidget(
        message: translate.no_data_found_please_check_your_internet_connection,
      );
    }
    return const TodoListLoaderWidget();
  }

  Future<void> _onRefresh([RefreshControllerHandler? controller]) {
    return _todoBloc.getTodos(
      cancelToken: cancelToken,
      isRefresh: true,
      controller: controller,
    );
  }

  Future _onLoad([RefreshControllerHandler? controller]) {
    return _todoBloc.getTodos(
      cancelToken: cancelToken,
      controller: controller,
    );
  }
}
