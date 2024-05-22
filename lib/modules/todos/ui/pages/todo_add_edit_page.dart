import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_loading_state.dart';
import 'package:maids/core/bloc/base/states/base_success_state.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/widgets/buttons/bouncing_button.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/base_stateful_app_widget.dart';
import 'package:maids/core/widgets/general/maids_app_bar.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';
import 'package:maids/core/widgets/mixins/description_mixin.dart';
import 'package:maids/modules/auth/domain/blocs/auth_cubit.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/ui/args/todo_details_args.dart';
import 'package:maids/modules/todos/ui/controllers/todo_detail_viewmodel.dart';
import 'package:maids/modules/todos/ui/pages/todos_list_page.dart';
import 'package:provider/provider.dart';

class TodoAddEditPage extends BaseAppStatefulWidget {
  const TodoAddEditPage({
    super.key,
    required this.args,
    this.todoId,
  });

  final String? todoId;
  final TodoDetailsArgs? args;

  @override
  _TodoAddEditPageState createBaseState() => _TodoAddEditPageState();
}

class _TodoAddEditPageState extends BaseAppState<TodoAddEditPage>
    with DescriptionFormMixin {
  late final TodoCubit _cubit;
  late TodoDetailViewModel _detailViewModel;
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _cubit = findDep<TodoCubit>();

    _detailViewModel = Provider.of<TodoDetailViewModel>(
      context,
      listen: false,
    );
    _detailViewModel.reset();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authCubit = findDep<AuthCubit>();
      final profile = authCubit.profileEntity;
      _detailViewModel.enterUserId(profile?.id);
      if (widget.args != null) {
        var type = widget.args?.type;
        var todo = widget.args?.todo;

        switch (type) {
          case TodoDetailType.edit:
            _detailViewModel.setDetailType(TodoDetailType.edit);
            _detailViewModel.setItemEditing(todo!);
            if (todo.todo != null) {
              _detailViewModel.enterTodo(todo.todo!);
              setDescriptionText = todo.todo!;
            }
            if (todo.completed ?? false) {
              _detailViewModel.enterIsCompleted(todo.completed!);
            }

            break;
          case TodoDetailType.add:
          default:
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    _detailViewModel = Provider.of<TodoDetailViewModel>(
      context,
      listen: true,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = MaidsAppBar(
      title: _detailViewModel.isAdding
          ? translate.add_new_todo
          : translate.edit_todo,
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: appTheme.appColors.scaffoldBgDetailsColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: BlocConsumer<TodoCubit, TodoState>(
            bloc: _cubit,
            listenWhen: (oldState, newState) =>
                oldState.createTodo != newState.createTodo ||
                oldState.updateTodo != newState.updateTodo,
            buildWhen: (oldState, newState) =>
                oldState.createTodo != newState.createTodo ||
                oldState.updateTodo != newState.updateTodo,
            listener: (ctx, state) {
              if (state.createTodo is BaseSuccessState ||
                  (state.updateTodo is BaseSuccessState)) {
                Navigator.of(context).pop();
                final msg = (_detailViewModel.isAdding)
                    ? translate.added_successfully
                    : translate.updated_successfully;
                AppUtils.showSuccessMessage(message: msg, context: context);
              }

              if (state.createTodo is BaseFailState) {
                final error = (state.createTodo as BaseFailState).error;
                final msg = AppErrorWidget.getErrorMsgByMessageCode(error);
                AppUtils.showErrorMessage(context: context, message: msg);
              }
              if (state.updateTodo is BaseFailState) {
                final error = (state.updateTodo as BaseFailState).error;
                final msg = AppErrorWidget.getErrorMsgByMessageCode(error);
                AppUtils.showErrorMessage(context: context, message: msg);
              }
            },
            builder: (context, state) {
              final isLoading = (state.createTodo is BaseLoadingState) ||
                  (state.updateTodo is BaseLoadingState);
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWidget([
                            _buildDescription(),
                            VerticalTextPadding.with16(),
                            if (!_detailViewModel.isAdding &&
                                _detailViewModel.id > 150)
                              Text(
                                'This will not be edited on the server and if you do update it will give you an error.',
                                style: appTextStyle.medium14.copyWith(
                                  color: appTheme.appColors.textErrorColor,
                                ),
                              ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  _buildActionButton(isLoading),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool _validate() {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });
    return _formKey.currentState!.validate();
  }

  void _saveItem() {
    AppUtils.unFocus(context);
    if (_validate()) {
      final todo = _detailViewModel.getTodo();

      if (_detailViewModel.isAdding) {
        _cubit.createTodo(
          todo: todo,
          cancelToken: cancelToken,
        );
      } else {
        _cubit.updateTodo(
          todo: todo,
          cancelToken: cancelToken,
        );
      }
    }
  }

  Widget _buildDescription() {
    return buildDescriptionFormMixin(
      hintText: translate.description,
      header: translate.todo,
      onChanged: (value) {
        if (value != null) {
          _detailViewModel.enterTodo(value);
        }
      },
    );
  }

  Widget wrapWidget(List<Widget> child, {EdgeInsets? padding}) {
    return Container(
      color: appTheme.appColors.componentBgDetailsColor,
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: AppDimens.verticalPadding16,
            horizontal: AppDimens.horizontalPadding20,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: child,
      ),
    );
  }

  Widget _buildActionButton(bool isLoading) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.verticalPadding16,
        horizontal: AppDimens.horizontalPadding20,
      ),
      child: Selector<TodoDetailViewModel, bool>(
        selector: (_, vm) => vm.isSavingAllowed,
        builder: (_, isSaving, __) {
          return Row(
            children: [
              Expanded(
                child: BouncingButton(
                  buttonStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      appTheme.appColors.primaryColor,
                    ),
                    textStyle: MaterialStateProperty.all(
                      appTextStyle.semiBold16.copyWith(
                        color: appTheme.appColors.textReversedColor,
                      ),
                    ),
                  ),
                  key: const ValueKey('button.save'),
                  title: isLoading
                      ? AppLoader(
                          size: AppLoaderSize.tiny,
                          iconColor: appTheme.appColors.iconReversedColor,
                        )
                      : null,
                  onPressed: isLoading ? null : _saveItem,
                  text: _detailViewModel.isAdding
                      ? translate.add
                      : translate.update,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
