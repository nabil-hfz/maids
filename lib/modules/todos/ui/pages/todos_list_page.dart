import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_state.dart';
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/widgets/buttons/app_floating_action_button.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/base_stateful_app_widget.dart';
import 'package:maids/core/widgets/general/maids_app_bar.dart';
import 'package:maids/core/widgets/general/refresh_wrapper.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/ui/controllers/todos_list_viewmodel.dart';
import 'package:maids/modules/todos/ui/widgets/todo_item_widget.dart';
import 'package:maids/modules/todos/ui/widgets/todo_list_loader_widget.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

enum TodoDetailType { add, edit }

class TodosListPage extends BaseAppStatefulWidget {
  const TodosListPage({super.key});

  @override
  _TodosPageState createBaseState() => _TodosPageState();
}

class _TodosPageState extends BaseAppState<TodosListPage> {
  late final TodoCubit _todoBloc = getIt<TodoCubit>();
  late TodosListViewModel _todosListViewModel;
  final BehaviorSubject<RefreshControllerHandler> _refreshController =
      BehaviorSubject();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _todosListViewModel = Provider.of<TodosListViewModel>(
        context,
        listen: false,
      );
    });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _todosListViewModel.reset();
    // });
  }

  @override
  Widget build(BuildContext context) {
    _todosListViewModel = Provider.of<TodosListViewModel>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: MaidsAppBar(
        centerTitle: true,
        title: translate.todos,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: appTheme.appColors.scaffoldBgClearColor,
      floatingActionButton: AppFloatingActionButton(
        onPressed: () {
          // navigator.pushNamed(
          //   Routes.todoAddPage,
          //   pathParameters: {
          //     RoutesQP.action: 'add',
          //   },
          //   extra: BaseNavigationArg(
          //     navigationType: NavigationType.sharedAxisTransition,
          //     data: TodoAddEditArgs(TodoDetailType.add),
          //   ),
          // );
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
    print('todosState is $todosState');
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
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItemWidget(todo: todos.elementAt(index));
        },
      );
    }
    return const TodoListLoaderWidget();
  }

  Future<void> _onRefresh([RefreshControllerHandler? controller]) {
    return _todoBloc.getTodos(
      cancelToken: cancelToken,
      isRefresh: true,
      controller: controller,
      filter: _todosListViewModel.todoFilterModel,
    );
  }

  Future _onLoad([RefreshControllerHandler? controller]) {
    return _todoBloc.getTodos(
      cancelToken: cancelToken,
      controller: controller,
      filter: _todosListViewModel.todoFilterModel,
    );
  }
}
