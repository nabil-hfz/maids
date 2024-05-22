import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _SwitchBoxProps { paddingLeft, color, text, rotation }

class CustomSwitch extends StatelessWidget {
  final bool switched;

  final String labelOff;
  final String labelOn;

  const CustomSwitch({
    super.key,
    this.switched = false,
    this.labelOff = 'OFF',
    this.labelOn = 'ON',
  });

  @override
  Widget build(BuildContext context) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    var tween = MovieTween()
      ..scene(duration: 1.seconds)
          .tween(_SwitchBoxProps.paddingLeft, 0.0.tweenTo(60.0))
      ..scene(duration: 1.seconds).tween(
        _SwitchBoxProps.color,
        themeStore.appColors.iconColor.tweenTo(themeStore.appColors.iconColor),
      )
      ..scene(duration: 500.milliseconds).tween(
        _SwitchBoxProps.text,
        ConstantTween(labelOff),
      )
      ..scene(begin: 500.milliseconds, end: 1.seconds).tween(
        _SwitchBoxProps.text,
        ConstantTween(labelOn),
      )
      ..scene(duration: 1.seconds).tween(
        _SwitchBoxProps.rotation,
        (-2 * pi).tweenTo(0.0),
      );

    return CustomAnimationBuilder<Movie>(
      control: switched ? Control.play : Control.playReverse,
      startPosition: switched ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(
    BuildContext context,
    Movie value,
    Widget? child,
  ) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Container(
      decoration: _outerBoxDecoration(value.get(_SwitchBoxProps.color)),
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(AppDimens.space2),
      child: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                left: !isRtl ? value.get(_SwitchBoxProps.paddingLeft) : 0,
                right: isRtl ? value.get(_SwitchBoxProps.paddingLeft) : 0,
              ),
              child: Transform.rotate(
                angle: value.get(_SwitchBoxProps.rotation),
                child: Container(
                  decoration:
                      _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
                  width: 30,
                  child: Center(
                    child: Text(
                      value.get(_SwitchBoxProps.text),
                      style: appTextStyle.light12.copyWith(
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        fontSize: AppTextSize.size_12,
                        color: themeStore.appColors.textReversedColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(Color color) => BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppRadius.radius24),
        ),
        color: color,
      );

  BoxDecoration _outerBoxDecoration(Color color) => BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
          width: 2,
          color: color,
        ),
      );
}
