// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:maids_app/core/constants/constants.dart';
// import 'package:maids_app/core/managers/managers.dart';
// import 'package:maids_app/core/utils/utils.dart';
// import 'package:maids_app/core/widgets/dialog/base_dialog.dart';
// import 'package:maids_app/core/widgets/image/app_image_widget.dart';
// import 'package:maids_app/core/widgets/widgets.dart';
//
// /// This class is using [BaseDialog] under the hood for best customization.
// ///
// /// See also [ConfirmDialog] and [ChangeLanguageDialog].
// class MessageIconDialog extends StatelessWidget {
//   final double radius;
//   final String? svgIcon;
//   final IconData? icon;
//   final double size;
//   final Color? color;
//   final Color? titleColor;
//   final String title;
//   final String? subTitle;
//
//   const MessageIconDialog({
//     Key? key,
//     this.icon,
//     required this.title,
//     this.subTitle,
//     this.svgIcon,
//     this.radius = 0.0,
//     this.size = 12.0,
//     this.color,
//     this.titleColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AppThemeManager themeManager = Provider.of<AppThemeManager>(context);
//     return BaseDialog(
//       title: '',
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: AppDimens.verticalPadding),
//             child: Visibility(
//               visible: AppUtils.notNullOrEmpty(svgIcon) || icon != null,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (icon != null) Icon(icon, size: size, color: color),
//                   if (svgIcon != null)
//                     AppImageWidget(
//                       path: svgIcon!,
//                       radius: radius,
//                       width: size,
//                       height: size,
//                       color: color,
//                     ),
//                   const VerticalPadding(percentage: 0.02),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: AppDimens.verticalPadding,
//             ),
//             child: Text(
//               title,
//               style: appTextStyle.normalTSBasic.copyWith(
//                 color: titleColor ?? themeManager.appColors.textColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: AppDimens.verticalPadding),
//             child: Visibility(
//               visible: AppUtils.notNullOrEmpty(subTitle),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const VerticalPadding(
//                     percentage: 0.02,
//                   ),
//                   Text(
//                     subTitle ?? "",
//                     style: appTextStyle.smallTSBasic.copyWith(
//                       color: themeManager.appColors.textColor,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
