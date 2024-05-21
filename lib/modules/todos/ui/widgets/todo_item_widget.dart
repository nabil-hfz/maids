import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_loading_state.dart';
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/app_radius.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/grayed_out_widget.dart';
import 'package:maids/core/widgets/general/horizontal_padding.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';
import 'package:maids/modules/todos/ui/widgets/todo_popup_menu_button.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    super.key,
    required this.todo,
    this.margin,
    this.hasOptions = true,
  });

  final TodoEntity todo;
  final EdgeInsets? margin;
  final bool hasOptions;

  @override
  Widget build(BuildContext context) {
    AppThemeManager appTheme = context.watch<AppThemeManager>();
    double cardRadius = AppRadius.cardRadius8;
    TodoCubit cubit = findDep();
    return Container(
      decoration: BoxDecoration(
        color: appTheme.appColors.cardBGColor,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          // AppBoxShadow.todoNewShadow,
        ],
      ),
      margin: margin ??
          const EdgeInsets.symmetric(
            horizontal: AppDimens.horizontalPadding20,
            vertical: AppDimens.listItemVertical,
          ),
      child: BlocConsumer<TodoCubit, TodoState>(
        bloc: cubit,
        listenWhen: (oldState, newState) {
          return oldState.deleteTodo != newState.deleteTodo ||
              oldState.updateTodo != newState.updateTodo;
        },
        buildWhen: (oldState, newState) {
          return oldState.deleteTodo != newState.deleteTodo ||
              oldState.updateTodo != newState.updateTodo;
        },
        listener: (context, state) {
          if (state.deleteTodo is BaseFailState) {
            final error = (state.deleteTodo as BaseFailState).error;
            final msg = AppErrorWidget.getErrorMsgByMessageCode(error);
            AppUtils.showErrorMessage(
              context: context,
              message: msg,
            );
          }
          if (state.updateTodo is BaseFailState) {
            final error = (state.updateTodo as BaseFailState).error;
            final msg = AppErrorWidget.getErrorMsgByMessageCode(error);
            AppUtils.showErrorMessage(
              context: context,
              message: msg,
            );
          }
        },
        builder: (context, state) {
          final isDeleting = (state.deleteTodo.isStateLoading &&
              (state.deleteTodo as BaseLoadingState).data == todo.id);
          final isUpdating = (state.updateTodo.isStateLoading &&
              (state.updateTodo as BaseLoadingState).data == todo.id);
          return Stack(
            alignment: Alignment.center,
            children: [
              GrayedOut(
                grayedOut: isDeleting || isUpdating,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppImageWidget(
                              path: Assets.images.splashLogoPng.path,
                              boxFit: BoxFit.cover,
                              height: 64,
                              width: 64,
                            ),
                            HorizontalTextPadding.with12(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildName(appTheme),
                                  VerticalTextPadding.with8(),
                                  _buildStatus(appTheme),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TodoPopupMenuButton(todo: todo),
                    ],
                  ),
                ),
              ),
              if (isDeleting || isUpdating)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLoader(size: AppLoaderSize.tiny),
                    HorizontalTextPadding.with8(),
                    Text(
                      isUpdating ? translate.updating : translate.deleting,
                      style: appTextStyle.semiBold14.copyWith(
                        color: appTheme.appColors.textSubTitle,
                      ),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }

  Widget _buildName(AppThemeManager appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            todo.todo ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle.medium14.copyWith(
              color: appTheme.appColors.textColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatus(AppThemeManager appTheme) {
    String status;
    Color color;
    if (todo.completed ?? false) {
      status = translate.completed;
      color = appTheme.appColors.textGreenColor;
    } else {
      status = translate.in_progress;
      color = appTheme.appColors.primaryColor;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          height: AppIconSize.size_6,
          width: AppIconSize.size_6,
        ),
        HorizontalTextPadding.with4(),
        Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: appTextStyle.medium10.copyWith(
            color: appTheme.appColors.textGreyColor,
          ),
        ),
      ],
    );
  }

// onLongPress(BuildContext context, TodoCubit cubit) {
//   AppBottomSheet.showAppModalBottomSheet(
//     context,
//     TodoOptionsBottomSheetWidget(
//       hasDiscount: todo.discount != null,
//       isTodoActive: todo.isCompleted,
//       onActivation: () {
//         cubit.todoActivation(
//           todoId: todo._id,
//           todo: todo,
//           // cancelToken: _cancelToken,
//         );
//       },
//       onEdit: () {
//         if (todo._id.isNotEmpty) {
//           navigator.pushNamed(
//             Routes.todoFormPage,
//             pathParameters: {
//               RoutesQP.action: 'edit',
//               RoutesQP.todoId: todo._id,
//             },
//             extra: BaseNavigationArg(
//               navigationType: NavigationType.fadeScale,
//               data: TodoAddEditArgs(
//                 TodoDetailType.edit,
//                 todo: todo,
//               ),
//             ),
//           );
//         } else {
//           AppUtils.showErrorMessage(
//             context: context,
//             message: translate
//                 .this_item_can_not_be_edited_please_try_to_refresh_the_page_and_try_again,
//           );
//         }
//       },
//       onDelete: () {
//         if (todo.hasPackage == true) {
//           AppUtils.showWarningMessage(
//             context: context,
//             title: translate.delete_a_todo,
//             message: translate.todo_can_not_be_deleted,
//           );
//           return;
//         }
//         AppUtils.appShowDialog(
//           context: context,
//           builder: (context) => ConfirmDialog(
//             desc: translate.are_you_sure_to_continue,
//             title: translate.delete_todo,
//             confirmAction: () {
//               cubit.deleteTodo(_id: todo._id);
//             },
//           ),
//         );
//       },
//     ),
//   );
// }
}

// class TodoOptionsBottomSheetWidget extends StatelessWidget {
//   const TodoOptionsBottomSheetWidget({
//     Key? key,
//     this.onDiscount,
//     this.onActivation,
//     required this.onEdit,
//     required this.onDelete,
//     this.hasDiscount = false,
//     this.isTodoActive = false,
//     // required this.onAddTodo,
//   }) : super(key: key);
//   final Function()? onDiscount;
//   final Function()? onActivation;
//   final Function() onEdit;
//   final Function() onDelete;
//   final bool hasDiscount;
//   final bool isTodoActive;
//
//   // final Function() onAddTodo;
//
//   @override
//   Widget build(BuildContext context) {
//     AppThemeManager appTheme = context.watch<AppThemeManager>();
//     return BaseBottomSheet(
//       textHeader: translate.actions,
//       childContent: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           buildTile(
//             Assets.icons.delete.path,
//             translate.delete,
//             2,
//             appTheme,
//             context,
//           ),
//           buildTile(
//             Assets.icons.editRequest.path,
//             translate.edit,
//             1,
//             appTheme,
//             context,
//           ),
//           if (onActivation != null)
//             buildTile(
//               Assets.icons.activate.path,
//               isTodoActive
//                   ? translate.deactivate_todo
//                   : translate.activate_todo,
//               4,
//               appTheme,
//               context,
//               AppIconSize.size_40,
//             ),
//           if (onDiscount != null)
//             buildTile(
//               Assets.icons.discount.path,
//               hasDiscount ? translate.edit_discount : translate.add_discount,
//               3,
//               appTheme,
//               context,
//             ),
//
//           // buildTile(
//           //   Assets.icons.addSquare.path,
//           //   translate.add_new_todo,
//           //   3,
//           //   appTheme,
//           // ),
//         ],
//       ),
//     );
//   }
//
//   buildTile(
//     String icon,
//     String title,
//     int option,
//     AppThemeManager appTheme,
//     BuildContext context, [
//     double? appIconSize,
//   ]) {
//     Color color = option == 2
//         ? appTheme.appColors.textErrorColor
//         : appTheme.appColors.textColor;
//     return ListTile(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppRadius.bottomSheetBorderRadius),
//       ),
//       leading: AppImageWidget(
//         path: icon,
//         color: color,
//         width: appIconSize ?? AppIconSize.size_24,
//         height: appIconSize ?? AppIconSize.size_24,
//       ),
//       title: Text(
//         title,
//         style: appTextStyle.regular16.copyWith(
//           color: color,
//         ),
//       ),
//       onTap: () {
//         onNavigate(option, context);
//       },
//     );
//   }
//
//   onNavigate(int option, BuildContext context) {
//     Future.delayed(Duration.zero, () {
//       if (option == 1) onEdit();
//       if (option == 2) onDelete();
//       if (option == 3 && onDiscount != null) onDiscount!();
//       if (option == 4 && onActivation != null) onActivation!();
//       // if (option == 3) onAddTodo();
//     });
//     Navigator.pop(context);
//   }
// }
