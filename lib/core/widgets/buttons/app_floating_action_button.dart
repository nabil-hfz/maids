import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:uuid/uuid.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
    this.onPressed,
    this.child,
  });

  final Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    AppThemeManager appTheme = context.watch<AppThemeManager>();

    return FloatingActionButton(
      heroTag: ValueKey(const Uuid().v4()),
      onPressed: onPressed,
      child: child ??
          Icon(
            Icons.add,
            color: appTheme.appColors.iconColor,
          ),
      // icon: Icon(Icons.add),
    );
  }
}
