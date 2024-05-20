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
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/widgets/buttons/app_inkwell_widget.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/grayed_out_widget.dart';
import 'package:maids/core/widgets/general/horizontal_padding.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';
import 'package:maids/modules/todos/domain/blocs/todo_cubit.dart';
import 'package:maids/modules/todos/domain/entity/todo_entity.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    Key? key,
    required this.todo,
    this.margin,
    this.hasOptions = true,
  }) : super(key: key);
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
          return oldState.deleteTodo != newState.deleteTodo;
        },
        buildWhen: (oldState, newState) {
          return oldState.deleteTodo != newState.deleteTodo;
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
        },
        builder: (context, state) {
          final isDeleting = (state.deleteTodo is BaseLoadingState &&
              (state.deleteTodo as BaseLoadingState).data == todo.id);
          return Stack(
            alignment: Alignment.center,
            children: [
              GrayedOut(
                grayedOut: isDeleting,
                child: AppInkWellWidget(
                  onTap: () {
                    // navigator.pushNamed(
                    //   Routes.todoDetailsPathPage,
                    //   pathParameters: {RoutesQP.todoId: todo._id},
                    //   extra: BaseNavigationArg(
                    //     navigationType: NavigationType.fade,
                    //     data: TodoDetailsArgs(todo: todo),
                    //   ),
                    // );
                  },
                  // onLongPress:
                  //     hasOptions ? () => onLongPress(context, cubit) : null,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                AppDimens.cardInnerPadding8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppImageWidget(
                                  borderRadius: AppRadius.cardRadius8,
                                  path: Assets.images.splashLogoPng.path,
                                  boxFit: BoxFit.cover,
                                  height: 72,
                                  width: 72,
                                ),
                                HorizontalTextPadding.with12(),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildNameAndDiscount(appTheme),
                                      VerticalTextPadding.with8(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isDeleting)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLoader(size: AppLoaderSize.tiny),
                    HorizontalTextPadding.with8(),
                    Text(
                      translate.deleting,
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

  Widget _buildNameAndDiscount(AppThemeManager appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            todo.todo ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle.medium14.copyWith(
              color: appTheme.appColors.textColor,
            ),
          ),
        ),
        // HorizontalTextPadding.with8(),
        // if (todo.discount != null && (todo.discount?.amount ?? 0) > 0)
        //   AppDiscountWidget(discount: todo.discount!),
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
