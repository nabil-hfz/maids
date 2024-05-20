// // Flutter imports:
// // Package imports:
// import 'package:custom_nested_scroll_view/custom_nested_scroll_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:maids/core/bloc/base/states/base_fail_state.dart';
//
// // Project imports:
// import 'package:maids/core/bloc/base/states/base_loading_state.dart';
// import 'package:maids/core/bloc/base/states/base_success_state.dart';
// import 'package:maids/core/constants/app_box_shadow.dart';
// import 'package:maids/core/constants/app_icon_size.dart';
// import 'package:maids/core/constants/constants.dart';
// import 'package:maids/core/constants/extension.dart';
// import 'package:maids/core/di/di.dart';
// import 'package:maids/core/generated_files/assets/assets.gen.dart';
// import 'package:maids/core/managers/analytics/analytics.dart';
// import 'package:maids/core/managers/managers.dart';
// import 'package:maids/core/utils/scrolling_behaviour.dart';
// import 'package:maids/core/utils/string_helper.dart';
// import 'package:maids/core/utils/utils.dart';
// import 'package:maids/core/widgets/base_stateful_app_widget.dart';
// import 'package:maids/core/widgets/bottom_sheet/app_bottom_sheet.dart';
// import 'package:maids/core/widgets/bottom_sheet/colors_bottom_sheet.dart';
// import 'package:maids/core/widgets/common/app_back_icon_widget.dart';
// import 'package:maids/core/widgets/common/app_discount_widget.dart';
// import 'package:maids/core/widgets/common/app_divider.dart';
// import 'package:maids/core/widgets/common/app_map_widget.dart';
// import 'package:maids/core/widgets/common/horizontal_padding.dart';
// import 'package:maids/core/widgets/common/image_slider_indicator_widget.dart';
// import 'package:maids/core/widgets/common/read_more_widget.dart';
// import 'package:salon_app/core/widgets/common/vertical_padding.dart';
// import 'package:salon_app/core/widgets/dialog/confirm_dialog.dart';
// import 'package:salon_app/core/widgets/error/general_error_widget.dart';
// import 'package:salon_app/core/widgets/image/app_image_widget.dart';
// import 'package:salon_app/core/widgets/loader/app_modal_progress_widget.dart';
// import 'package:salon_app/modules/services/domain/blocs/todo_cubit.dart';
// import 'package:salon_app/modules/services/domain/entity/todo_entity.dart';
// import 'package:salon_app/modules/services/ui/args/todo_detail_args.dart';
// import 'package:salon_app/modules/services/ui/args/todo_details_args.dart';
// import 'package:salon_app/modules/services/ui/pages/service_add_edit_page.dart';
// import 'package:salon_app/modules/services/ui/widgets/service_discount_bottom_sheet.dart';
// import 'package:salon_app/modules/services/ui/widgets/todo_item_widget.dart';
//
// class ServiceDetailsPage extends BaseAppStatefulWidget {
//   const ServiceDetailsPage({
//     super.key,
//     this.args,
//     this.serviceId,
//   });
//
//   final String? serviceId;
//   final ServiceDetailsArgs? args;
//
//   @override
//   _ServiceDetailsPageState createBaseState() => _ServiceDetailsPageState();
// }
//
// class _ServiceDetailsPageState extends BaseAppState<ServiceDetailsPage> {
//   // late AppThemeManager _appTheme;
//   late ServiceCubit _cubit;
//   ServiceEntity? service;
//
//   // late final CancelToken _cancelToken;
//
//   @override
//   Future<void> customOpenEventParams([Map<String, dynamic>? customParam]) {
//     return super.customOpenEventParams(analyticsParam.generalParam(params: {
//       AnalyticsConstants.idParams: widget.serviceId,
//     }));
//   }
//
//   @override
//   Future<void> customCloseEventParams([Map<String, dynamic>? customParam]) {
//     return super.customCloseEventParams(analyticsParam.generalParam(params: {
//       AnalyticsConstants.idParams: widget.serviceId,
//     }));
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _cubit = findDep();
//     if (widget.args?.service != null) {
//       service = widget.args!.service;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomNestedScrollView(
//         scrollBehavior: const ConstantScrollBehavior(),
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             // _buildAppbar(),
//             CustomSliverOverlapAbsorber(
//               overscrollType: CustomOverscroll.outer,
//               handle: CustomNestedScrollView.sliverOverlapAbsorberHandleFor(
//                 context,
//               ),
//               sliver: _buildAppbar(innerBoxIsScrolled, context),
//             ),
//             // SliverOverlapAbsorber(
//             //   handle: CustomNestedScrollView.sliverOverlapAbsorberHandleFor(context),
//             //   sliver: _buildAppbar(innerBoxIsScrolled),
//             // ),
//           ];
//         },
//         body: _buildBody(),
//       ),
//     );
//   }
//
//   _buildAppbar(bool innerBoxIsScrolled, BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       stretch: true,
//       expandedHeight: 325.h,
//       actions: [
//         AppIconButton(
//           onPressed: () {
//             _openBottomSheet();
//           },
//           icon: Container(
//             decoration: BoxDecoration(
//               color: appTheme.appColors.iconReversedColor,
//               borderRadius: BorderRadius.circular(AppRadius.radius100),
//             ),
//             padding: const EdgeInsets.all(AppDimens.space8),
//             child: Icon(
//               Icons.more_vert_rounded,
//               size: AppIconSize.size_24,
//               color: appTheme.appColors.iconColor,
//             ),
//           ),
//         ),
//         HorizontalTextPadding.appBarAction(),
//       ],
//       leading: const AppBackIconWidget(),
//       forceElevated: innerBoxIsScrolled,
//       backgroundColor: appTheme.appColors.appBarColor,
//       onStretchTrigger: () async {
//         if (service?._id != null) {
//           _cubit.getService(
//             _id: service!._id,
//             cancelToken: cancelToken,
//           );
//         }
//       },
//       flexibleSpace: FlexibleSpaceBar(
//         stretchModes: const [
//           StretchMode.zoomBackground,
//           StretchMode.fadeTitle,
//           StretchMode.blurBackground,
//         ],
//         // title: const Text('Horizons'),
//         background: DecoratedBox(
//           position: DecorationPosition.foreground,
//           decoration: BoxDecoration(
//             gradient: AppGradient.serviceDetailsAppBarGradient,
//           ),
//           child: ImagesSliderWidget(
//             images: [
//               service?.imageUrl?.toUrl ?? '',
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _buildBody() {
//     return BlocConsumer<ServiceCubit, ServiceState>(
//       bloc: _cubit,
//       listener: (context, state) {
//         if (state.getService is ServiceSuccess) {
//           setState(() {
//             service = (state.getService as ServiceSuccess).service;
//           });
//         }
//         if (state.updateService is ServiceSuccess) {
//           setState(() {
//             service = (state.updateService as ServiceSuccess).service;
//           });
//         }
//         if (state.deleteService is BaseSuccessState) {
//           Navigator.pop(context);
//           AppUtils.showSuccessMessage(
//             context: context,
//             message: translate.service_deleted_successfully,
//           );
//         }
//         if (state.deleteService is BaseFailState) {
//           final error = (state.deleteService as BaseFailState).error;
//           final msg = AppErrorWidget.getErrorMsgByMessageCode(error);
//           AppUtils.showErrorMessage(
//             context: context,
//             message: msg,
//           );
//         }
//       },
//       builder: (context, state) {
//         return SafeArea(
//           child: AppModalProgressHUDWidget(
//             inAsyncCall: state.getService is BaseLoadingState ||
//                 state.deleteService is BaseLoadingState ||
//                 state.updateService is BaseLoadingState,
//             child: Builder(builder: (BuildContext context) {
//               return CustomScrollView(
//                 shrinkWrap: true,
//                 key: const PageStorageKey<String>('1'),
//                 physics: const ClampingScrollPhysics(),
//                 slivers: <Widget>[
//                   CustomSliverOverlapInjector(
//                     overscrollType: CustomOverscroll.outer,
//                     handle:
//                         CustomNestedScrollView.sliverOverlapAbsorberHandleFor(
//                       context,
//                     ),
//                   ),
//                   SliverPadding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: AppDimens.space20,
//                       // vertical: AppDimens.space16,
//                     ),
//                     sliver: SliverList(
//                       delegate: SliverChildListDelegate(
//                         [
//                           _buildServiceNameOfferAndDuration(),
//                           VerticalTextPadding.betweenElementsSection(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }),
//           ),
//         );
//         // return SingleChildScrollView(
//         //     child: _buildServiceNameOfferAndDuration());
//         // return SliverPadding(
//         //   padding: const EdgeInsets.symmetric(
//         //     horizontal: AppDimens.space20,
//         //     vertical: AppDimens.space16,
//         //   ),
//         //   sliver: SliverList(
//         //     delegate: SliverChildListDelegate(
//         //       [
//         //         _buildServiceNameOfferAndDuration(),
//         //       ],
//         //     ),
//         //   ),
//         // );
//       },
//     );
//   }
//
//   Widget _buildServiceNameOfferAndDuration() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         _buildNameAndDiscount(),
//         VerticalTextPadding.with8(),
//         _buildDuration(),
//         VerticalTextPadding.with16(),
//         _buildPrice(),
//         VerticalTextPadding.with8(),
//         AppDivider.withoutHeight(),
//         VerticalTextPadding.with16(),
//         _buildDescription(),
//         VerticalTextPadding.with16(),
//         _buildMapLocation(),
//         VerticalTextPadding.with16(),
//         // _buildSalonInfo(),
//
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.start,
//         //   crossAxisAlignment: CrossAxisAlignment.center,
//         //   children: [
//         //     Expanded(
//         //       child: Column(
//         //         mainAxisAlignment: MainAxisAlignment.center,
//         //         crossAxisAlignment: CrossAxisAlignment.start,
//         //         children: [
//         //           // VerticalTextPadding.with4(),
//         //           // _buildPriceAndDuration(appTheme),
//         //           // VerticalTextPadding.with4(),
//         //           // _buildRatingAndReviewsCount(appTheme),
//         //         ],
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         // _buildColor(cardRadius),
//       ],
//     );
//   }
//
//   _buildNameAndDiscount() {
//     // final hasDiscount =
//     //     (service?.discount != null && (service!.discount?.amount ?? 0) > 0);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Text(
//             service?.todo ?? '',
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: appTextStyle.semiBold16.copyWith(
//               color: appTheme.appColors.textColor,
//             ),
//           ),
//         ),
//         if ((service?.price ?? 0) > 0)
//           AppDiscountWidget(
//             discount: service?.discount,
//             onTap: (service?.discount != null &&
//                     (service?.discount?.amount ?? 0) > 0)
//                 ? null
//                 : _addDiscount,
//           ),
//         HorizontalTextPadding.with8(),
//         _buildColor(),
//       ],
//     );
//   }
//
//   _buildDuration() {
//     final duration = StringHelper.formatDuration(
//       Duration(milliseconds: service?.duration ?? 0),
//     );
//     var isActive = service?.isCompleted ?? false;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         AppImageWidget(
//           path: Assets.icons.hour.path,
//           height: AppIconSize.size_18,
//           width: AppIconSize.size_18,
//           color: appTheme.appColors.iconGreyColor,
//         ),
//         HorizontalTextPadding.with6(),
//         Expanded(
//           child: Text(
//             duration,
//             maxLines: 1,
//             style: appTextStyle.regular12.copyWith(
//               color: appTheme.appColors.textGrey2Color,
//             ),
//           ),
//         ),
//         HorizontalTextPadding.with6(),
//         Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppDimens.space4,
//             vertical: AppDimens.space1,
//           ),
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 0.5,
//               color: appTheme.appColors.borderTextFieldColor,
//             ),
//             borderRadius:
//                 BorderRadius.circular(AppRadius.formFieldBorderRadius),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text.rich(
//                 TextSpan(
//                   text: '${translate.status}: ',
//                   children: [
//                     TextSpan(
//                       text: isActive
//                           ? translate.activated
//                           : translate.deactivated,
//                       style: appTextStyle.mediumItalic10.copyWith(
//                         color: isActive
//                             ? appTheme.appColors.textGreenColor
//                             : appTheme.appColors.textErrorColor,
//                       ),
//                     )
//                   ],
//                 ),
//                 maxLines: 1,
//                 style: appTextStyle.medium10.copyWith(
//                   color: appTheme.appColors.textGrey2Color,
//                 ),
//               ),
//               HorizontalTextPadding.with2(),
//               Icon(
//                 isActive ? Icons.check_circle : Icons.cancel_outlined,
//                 size: AppIconSize.size_12,
//                 color: isActive
//                     ? appTheme.appColors.textGreenColor
//                     : appTheme.appColors.textErrorColor,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildPrice() {
//     final price = service?.price ?? 0;
//     final originalPrice = StringHelper.formatPrice(price);
//     // this.originalPrice = 0.0;
//     // }) : super(key: key);
//     // (originalPrice * discount!.amount) / 100.0
//     // final DiscountEntity? discount;
//     // final double originalPrice;
//     final dis = (service?.discount?.amount ?? 0);
//     // final discount = StringHelper.formatPrice(dis);
//     if (service?.discount == null ||
//         service?.discount?.amount == null ||
//         service?.discount?.amount == 0) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             originalPrice,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: appTextStyle.semiBold.copyWith(
//               color: appTheme.appColors.textActiveColor,
//               fontSize: AppTextSize.size_28,
//             ),
//           ),
//           const Spacer(),
//         ],
//       );
//     }
//     final afterDiscount = (price - ((price * dis) / 100.0)).toStringAsFixed(2);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           afterDiscount,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: appTextStyle.semiBold.copyWith(
//             color: appTheme.appColors.textActiveColor,
//             fontSize: AppTextSize.size_28,
//           ),
//         ),
//         HorizontalTextPadding.with8(),
//         Text(
//           originalPrice,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: appTextStyle.light16.copyWith(
//             color: appTheme.appColors.textGrey2Color,
//             decoration: TextDecoration.lineThrough,
//             decorationColor: appTheme.appColors.textGrey2Color,
//           ),
//         ),
//         const Spacer(),
//         // _buildColor(),
//         //  Flexible(
//         //   child: Text(
//         //     price,
//         //     maxLines: 1,
//         //     style: appTextStyle.light12.copyWith(
//         //       color: appTheme.appColors.textGrey2Color,
//         //     ),
//         //   ),
//         // ),
//       ],
//     );
//   }
//
//   Widget _buildColor() {
//     if (service?.colorCode == null) return Container();
//     return AppColorWidget(color: service!.colorCode);
//   }
//
//   _buildDescription() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Flexible(
//           child: AppReadMoreWidget(
//             text: (service?.description ?? ''),
//             trimLines: 3,
//             style: appTextStyle.regular14.copyWith(
//               color: appTheme.appColors.textGreyColor,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   _buildMapLocation() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "${translate.salon_location} :",
//           style: appTextStyle.semiBold14.copyWith(
//             color: appTheme.appColors.textColor,
//           ),
//         ),
//         VerticalTextPadding.with8(),
//         Container(
//           height: AppDimens.mapHeight.h,
//           width: double.infinity,
//           alignment: Alignment.center,
//           child: const AppMapWidget(),
//         ),
//       ],
//     );
//   }
//
//   void _openBottomSheet() {
//     AppBottomSheet.showAppModalBottomSheet(
//       context,
//       ServiceOptionsBottomSheetWidget(
//         isServiceActive: service?.isCompleted ?? true,
//         onActivation: () {
//           if (service != null) {
//             _cubit.serviceActivation(
//               serviceId: service!._id,
//               service: service!,
//               cancelToken: cancelToken,
//             );
//           }
//         },
//         hasDiscount: service?.discount != null,
//         onDiscount: ((service?.price ?? 0) > 0)
//             ? () async {
//                 return _addDiscount();
//               }
//             : null,
//         onEdit: () {
//           if (service?._id != null) {
//             navigator.pushNamed(
//               Routes.serviceFormPage,
//               pathParameters: {
//                 RoutesQP.action: 'edit',
//                 RoutesQP.serviceId: service!._id,
//               },
//               extra: BaseNavigationArg(
//                 navigationType: NavigationType.fadeScale,
//                 data: ServiceAddEditArgs(
//                   ServiceDetailType.edit,
//                   service: service,
//                 ),
//               ),
//             );
//           } else {
//             AppUtils.showErrorMessage(
//               context: context,
//               message: translate
//                   .this_item_can_not_be_edited_please_try_to_refresh_the_page_and_try_again,
//             );
//           }
//         },
//         onDelete: () {
//           if (service?.hasPackage == true) {
//             AppUtils.showWarningMessage(
//               context: context,
//               title: translate.delete_a_service,
//               message: translate.service_can_not_be_deleted,
//             );
//           } else {
//             AppUtils.appShowDialog(
//               context: context,
//               builder: (context) {
//                 return ConfirmDialog(
//                   desc: translate.are_you_sure_to_continue,
//                   title: translate.delete_service,
//                   confirmAction: () {
//                     if (service?._id != null) {
//                       _cubit.deleteService(_id: service!._id);
//                     }
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future _addDiscount() async {
//     return await AppBottomSheet.showAppModalBottomSheet(
//       context,
//       ServiceDiscountBottomSheet(
//         serviceId: service?._id,
//         discount: service?.discount,
//         onCreate: (DiscountEntity discount) {
//           appPrint('onCreate');
//           _cubit.createDiscount(
//             discount: discount,
//             serviceId: service!._id,
//             cancelToken: cancelToken,
//           );
//         },
//         onUpdate: (DiscountEntity discount) {
//           appPrint('onUpdate');
//           _cubit.updateDiscount(
//             discount: discount,
//             serviceId: service!._id,
//             cancelToken: cancelToken,
//           );
//         },
//         onDelete: (DiscountEntity discount) {
//           _cubit.deleteDiscount(
//             discount: discount,
//             serviceId: service!._id,
//             cancelToken: cancelToken,
//           );
//         },
//       ),
//     );
//   }
//
// // _buildSalonInfo() {
// //   return Column(
// //     mainAxisAlignment: MainAxisAlignment.start,
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //       Text(
// //         "${translate.salon_info} :",
// //         style: appTextStyle.semiBold14.copyWith(
// //           color: appTheme.appColors.textColor,
// //         ),
// //       ),
// //       VerticalTextPadding.with8(),
// //       AppInkWellWidget(
// //         onTap: () {},
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Expanded(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     "Example Salon Name",
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                     style: appTextStyle.medium14.copyWith(
// //                       color: appTheme.appColors.textColor,
// //                     ),
// //                   ),
// //                   VerticalTextPadding.with4(),
// //                   Text(
// //                     "220 Street, Hay Elgamaa, Mansoura 220 Street, Hay Elgamaa, Mansoura 220 Street, Hay Elgamaa, Mansoura",
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                     style: appTextStyle.regular12.copyWith(
// //                       color: appTheme.appColors.textSubTitle,
// //                     ),
// //                   ),
// //                   VerticalTextPadding.with4(),
// //                   Row(
// //                     // crossAxisAlignment: WrapCrossAlignment.center,
// //                     children: [
// //                       AppImageWidget(
// //                         path: Assets.icons.star.path,
// //                         width: AppIconSize.size_12,
// //                         height: AppIconSize.size_12,
// //                       ),
// //                       HorizontalTextPadding.with4(),
// //                       Text(
// //                         "4.5",
// //                         style: appTextStyle.regular12.copyWith(
// //                           color: appTheme.appColors.textColor,
// //                         ),
// //                       ),
// //                       HorizontalTextPadding.with14(),
// //                       AppImageWidget(
// //                         path: Assets.icons.hour.path,
// //                         height: AppIconSize.size_14,
// //                         width: AppIconSize.size_14,
// //                         color: appTheme.appColors.iconActiveColor,
// //                       ),
// //                       HorizontalTextPadding.with4(),
// //                       Expanded(
// //                         child: Text(
// //                           "Open now",
// //                           maxLines: 1,
// //                           style: appTextStyle.light12.copyWith(
// //                             color: appTheme.appColors.textGrey2Color,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   )
// //                 ],
// //               ),
// //             ),
// //             HorizontalTextPadding.with4(),
// //             Card(
// //               elevation: 0,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(2.0),
// //                 child: AppImageWidget(
// //                   borderRadius: AppRadius.cardRadius8,
// //                   path: service?.imageUrl?.toUrl,
// //                   boxFit: BoxFit.cover,
// //                   height: 72,
// //                   width: 72,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     ],
// //   );
// // }
// }
// //AIzaSyDwbhlAEZLuHFSt5E7JrINehEsb94MOGI4
//
// // SliverPersistentHeader(
// //   pinned: true,
// //   delegate: MySliverHeaderDelegate(onActionTap: () {
// //   }),
// // ),
// // SliverPersistentHeader(
// //   delegate: MySliverAppBar(expandedHeight: 200),
// //   pinned: true,
// // ),
// // class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
// //   final double _maxExtent = 160;
// //   final VoidCallback onActionTap;
// //
// //   MySliverHeaderDelegate({
// //     required this.onActionTap,
// //   });
// //
// //   @override
// //   Widget build(
// //       BuildContext context, double shrinkOffset, bool overlapsContent) {
// //     return Container(
// //       color: Colors.red,
// //       child: Stack(
// //         children: [
// //           Align(
// //             alignment: Alignment(
// //                 //little padding
// //                 -(shrinkOffset > _maxExtent - 20
// //                         ? _maxExtent - 20
// //                         : shrinkOffset) /
// //                     _maxExtent,
// //                 0),
// //             child: const Text('Panahon'),
// //           ),
// //
// //           // here provide actions
// //           Positioned(
// //             top: 0,
// //             right: 0,
// //             child: IconButton(
// //               icon: const Icon(Icons.search),
// //               onPressed: onActionTap,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   double get maxExtent => _maxExtent;
// //
// //   @override
// //   double get minExtent => kToolbarHeight;
// //
// //   @override
// //   bool shouldRebuild(covariant MySliverHeaderDelegate oldDelegate) {
// //     return oldDelegate != this;
// //   }
// // }
// //
// // class MyHomePage extends StatelessWidget {
// //   const MyHomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white70,
// //       body: CustomScrollView(
// //         slivers: [
// //           SliverPersistentHeader(
// //             pinned: true,
// //             floating: false,
// //             delegate: SearchHeader(
// //               icon: Icons.terrain,
// //               title: 'Trees',
// //               search: const _Search(),
// //             ),
// //           ),
// //           SliverFillRemaining(
// //             hasScrollBody: true,
// //             child: ListView(
// //               physics: const NeverScrollableScrollPhysics(),
// //               children: [
// //                 const Text('some text'),
// //                 const Placeholder(
// //                   color: Colors.red,
// //                   fallbackHeight: 200,
// //                 ),
// //                 Container(
// //                   color: Colors.blueGrey,
// //                   height: 500,
// //                 )
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class _Search extends StatefulWidget {
// //   const _Search({Key? key}) : super(key: key);
// //
// //   @override
// //   __SearchState createState() => __SearchState();
// // }
// //
// // class __SearchState extends State<_Search> {
// //   late TextEditingController _editingController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _editingController = TextEditingController();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 20, right: 5),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Expanded(
// //             child: TextField(
// //               controller: _editingController,
// //               // textAlignVertical: TextAlignVertical.center,
// //               onChanged: (_) => setState(() {}),
// //               decoration: InputDecoration(
// //                 hintText: 'Search',
// //                 hintStyle: TextStyle(
// //                     color: Theme.of(context).primaryColor.withOpacity(0.5)),
// //                 enabledBorder: InputBorder.none,
// //                 focusedBorder: InputBorder.none,
// //               ),
// //             ),
// //           ),
// //           _editingController.text.trim().isEmpty
// //               ? IconButton(
// //                   icon: Icon(Icons.search,
// //                       color: Theme.of(context).primaryColor.withOpacity(0.5)),
// //                   onPressed: null)
// //               : IconButton(
// //                   highlightColor: Colors.transparent,
// //                   splashColor: Colors.transparent,
// //                   icon: Icon(Icons.clear,
// //                       color: Theme.of(context).primaryColor.withOpacity(0.5)),
// //                   onPressed: () => setState(
// //                     () {
// //                       _editingController.clear();
// //                     },
// //                   ),
// //                 ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class SearchHeader extends SliverPersistentHeaderDelegate {
// //   final double minTopBarHeight = 100;
// //   final double maxTopBarHeight = 200;
// //   final String title;
// //   final IconData icon;
// //   final Widget search;
// //
// //   SearchHeader({
// //     required this.title,
// //     required this.icon,
// //     required this.search,
// //   });
// //
// //   @override
// //   Widget build(
// //     BuildContext context,
// //     double shrinkOffset,
// //     bool overlapsContent,
// //   ) {
// //     var shrinkFactor = math.min(1, shrinkOffset / (maxExtent - minExtent));
// //
// //     var topBar = Positioned(
// //       top: 0,
// //       left: 0,
// //       right: 0,
// //       child: Container(
// //         alignment: Alignment.center,
// //         height: math.max(
// //             maxTopBarHeight * (1 - shrinkFactor * 1.45), minTopBarHeight),
// //         width: 100,
// //         decoration: const BoxDecoration(
// //             color: Colors.green,
// //             borderRadius: BorderRadius.only(
// //               bottomLeft: Radius.circular(36),
// //               bottomRight: Radius.circular(36),
// //             )),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(title,
// //                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
// //                     color: Colors.white, fontWeight: FontWeight.bold)),
// //             const SizedBox(
// //               width: 20,
// //             ),
// //             Icon(
// //               icon,
// //               size: 40,
// //               color: Colors.white,
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //     return SizedBox(
// //       height: math.max(maxExtent - shrinkOffset, minExtent),
// //       child: Stack(
// //         fit: StackFit.loose,
// //         children: [
// //           if (shrinkFactor <= 0.5) topBar,
// //           Align(
// //             alignment: Alignment.bottomCenter,
// //             child: Padding(
// //               padding: const EdgeInsets.only(
// //                 bottom: 10,
// //               ),
// //               child: Container(
// //                 alignment: Alignment.center,
// //                 width: 200,
// //                 height: 50,
// //                 decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                     color: Colors.white,
// //                     boxShadow: [
// //                       BoxShadow(
// //                         offset: const Offset(0, 10),
// //                         blurRadius: 10,
// //                         color: Colors.green.withOpacity(0.23),
// //                       )
// //                     ]),
// //                 child: search,
// //               ),
// //             ),
// //           ),
// //           if (shrinkFactor > 0.5) topBar,
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   double get maxExtent => 230;
// //
// //   @override
// //   double get minExtent => 100;
// //
// //   @override
// //   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// // }
// // class MySliverAppBar extends SliverPersistentHeaderDelegate {
// //   final double expandedHeight;
// //
// //   MySliverAppBar({required this.expandedHeight});
// //
// //   @override
// //   Widget build(
// //       BuildContext context, double shrinkOffset, bool overlapsContent) {
// //     return Stack(
// //       fit: StackFit.expand,
// //       // overflow: Overflow.visible,
// //       clipBehavior: Clip.none,
// //       children: [
// //         Image.network(
// //           "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
// //           fit: BoxFit.cover,
// //         ),
// //         Center(
// //           child: Opacity(
// //             opacity: shrinkOffset / expandedHeight,
// //             child: const Text(
// //               "MySliverAppBar",
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.w700,
// //                 fontSize: 23,
// //               ),
// //             ),
// //           ),
// //         ),
// //         Positioned(
// //           top: expandedHeight / 2 - shrinkOffset,
// //           left: MediaQuery.of(context).size.width / 4,
// //           child: Opacity(
// //             opacity: (1 - shrinkOffset / expandedHeight),
// //             child: Card(
// //               elevation: 10,
// //               child: SizedBox(
// //                 height: expandedHeight,
// //                 width: MediaQuery.of(context).size.width / 2,
// //                 child: const FlutterLogo(),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   @override
// //   double get maxExtent => expandedHeight;
// //
// //   @override
// //   double get minExtent => kToolbarHeight;
// //
// //   @override
// //   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// // }
