import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_animation_duration.dart';
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/constants/app_radius.dart';
import 'package:maids/core/constants/app_text_style.dart';
import 'package:maids/core/constants/colors/app_colors.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/widgets/general/app_divider.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:provider/provider.dart';

class BaseDialog extends StatefulWidget {
  const BaseDialog({
    super.key,
    required this.title,
    required this.child,
    this.withDivider = false,
  });
  final Widget child;
  final String title;
  final bool withDivider;

  @override
  State<StatefulWidget> createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog>
    with SingleTickerProviderStateMixin {
  late AppThemeManager _appTheme;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: AppDuration.dialogAnimationDuration,
      ),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appTheme = Provider.of<AppThemeManager>(context);
  }

  @override
  Widget build(BuildContext context) {
    const width = AppDimens.dialogWidth;
    return Center(
      child: Material(
        color: AppColors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: width,
            margin: const EdgeInsets.all(AppDimens.space32),
            padding: const EdgeInsets.all(AppDimens.space20),
            decoration: ShapeDecoration(
              color: _appTheme.appColors.dialogBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.radius24),
              ),
            ),
            child: Wrap(
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    widget.title,
                    style: appTextStyle.bold18.copyWith(
                      color: _appTheme.appColors.primaryColor,
                    ),
                  ),
                ),
                if (widget.withDivider) const VerticalPadding(percentage: 0.02),
                if (widget.withDivider)
                  AppDivider(color: _appTheme.appColors.dividerPrimaryColor),
                const VerticalPadding(percentage: 0.02),
                widget.child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
