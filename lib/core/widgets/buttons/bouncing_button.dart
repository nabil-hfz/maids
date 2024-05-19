import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:provider/provider.dart';

const kBouncingButtonHeight = 56.0;

/// General Animated Button. This widget should be tested Nabil.
class BouncingButton extends StatefulWidget {
  final Widget? title;
  final String? text;
  final double? height;
  final Color? textColor;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;

  const BouncingButton({
    super.key,
    this.title,
    this.text,
    this.onPressed,
    this.textColor,
    this.buttonStyle,
    this.height,
  });

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  /// Used to get the current size after the widget is rendered.
  final GlobalKey _key = GlobalKey();

  /// Holds a customized value if any passed by the user.
  late ButtonStyle buttonStyle;

  late AppThemeManager appTheme;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _shadowAnimation;
  late final Animation<Color?> _shadowColorAnimation;

  late final AnimationController _animationController;

  /// Offset value that could be checked when the button is pressed.
  final double _distanceThreshold = 64.0;

  /// Duration passed to the controller and also it's used when the button is
  /// released by doubling the current value for the animation when the
  /// button is released by the user.
  late final Duration _animationDuration;

  /// Checks if the the is a passed [onPressed] function which indicates
  /// current state of this button as well as its color.
  bool get isEnabled => widget.onPressed != null;

  /// Checks current scale animation state to prevent continuous taping
  /// until the current one is finished.
  bool get _isInOrTowardsEnd {
    return _scaleAnimation.status == AnimationStatus.forward ||
        _scaleAnimation.status == AnimationStatus.completed;
  }

  /// Checks multiple states to organizes the animation flow.
  bool get _canNotTap {
    return !isEnabled || _isInOrTowardsEnd || _animationController.isAnimating;
  }

  /// Initializes all required fields upon current settings.
  @override
  void initState() {
    super.initState();
    appTheme = Provider.of<AppThemeManager>(context, listen: false);

    _animationDuration = const Duration(
      milliseconds: AppDuration.bouncingDuration,
    );
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_animationController);

    _shadowAnimation = Tween<double>(
      begin: 24,
      end: 8,
    ).animate(_animationController);
    _shadowColorAnimation = ColorTween(
      begin: appTheme.appColors.animationShadowBegin,
      end: appTheme.appColors.animationShadowEnd,
    ).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    appTheme = Provider.of<AppThemeManager>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    buttonStyle = widget.buttonStyle ??
        ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            appTheme.appColors.primaryColor,
          ),
          textStyle: MaterialStateProperty.all(
            appTextStyle.semiBold16.copyWith(
              color: appTheme.appColors.textReversedColor,
            ),
          ),
        );
    return Center(
      key: _key,
      child: GestureDetector(
        onTapDown: (_) {
          _tapDown();
        },
        onTapUp: (d) {
          _tapUp();
        },
        onTap: () {
          if (_canNotTap) {
            return;
          }

          HapticFeedback.lightImpact();
          final tickerFuture = _animationController.repeat(reverse: true);
          tickerFuture.timeout(
            _animationDuration * 2,
            onTimeout: () {
              _animationController.forward(from: 0);
              _animationController.stop(canceled: true);
            },
          );
        },
        onLongPressEnd: (d) {
          final isInRange = _isPositionInRange(localPosition: d.localPosition);
          if (isInRange) {
            _tapUp();
          }
        },
        onLongPressMoveUpdate: (details) {
          _onHoldButtonUpdated(localPosition: details.localPosition);
        },
        onPanUpdate: (details) {
          _onHoldButtonUpdated(localPosition: details.localPosition);
        },
        onPanEnd: (_) {
          _animationController.reverse();
        },
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: _animatedButton(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _animatedButton() {
    List<BoxShadow>? boxShadow;
    TextStyle? textStyle;

    final enabledBackgroundColor = buttonStyle.backgroundColor
            ?.resolve((<MaterialState>[MaterialState.selected]).toSet()) ??
        appTheme.appColors.bouncingButtonEnabledColor;
    final disabledBackgroundColor =
        appTheme.appColors.bouncingButtonDisabledColor;

    final shape = buttonStyle.shape?.resolve(MaterialState.values.toSet());

    final elevation =
        buttonStyle.elevation?.resolve(MaterialState.values.toSet());
    if (elevation != 0) {
      boxShadow = [
        BoxShadow(
          color: isEnabled
              ? _shadowColorAnimation.value ??
                  appTheme.appColors.animationShadowBegin
              : appTheme.appColors.animationShadowBegin,
          blurRadius: _shadowAnimation.value,
          offset: const Offset(0.0, 5.0),
        ),
      ];
    }
    textStyle = buttonStyle.textStyle?.resolve(MaterialState.values.toSet()) ??
        appTextStyle.bold16.copyWith(
          color: widget.textColor ?? appTheme.appColors.textReversedColor,
        );

    return Container(
      height: widget.height ?? 56,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: isEnabled ? enabledBackgroundColor : disabledBackgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.radius12),
        boxShadow: boxShadow,
        border: Border.all(
          color: shape?.side.color ?? Colors.transparent,
          width: shape?.side.width ?? 0,
        ),
      ),
      child: widget.title ??
          Center(
            child: Text(
              widget.text ?? '',
              style: textStyle,
            ),
          ),
    );
  }

  bool _isPositionInRange({required Offset localPosition}) {
    final rootSize = _key.currentContext?.size;
    if (rootSize == null) return false;
    final dx = localPosition.dx;
    final dy = localPosition.dy;
    final isXInRange = dx > (0 - _distanceThreshold) &&
        dx < (rootSize.width + _distanceThreshold);
    final isYInRange = dy > (0 - _distanceThreshold) &&
        dy < (rootSize.height + _distanceThreshold);
    return isXInRange && isYInRange;
  }

  void _onHoldButtonUpdated({required Offset localPosition}) {
    if (!isEnabled) return;
    final isInRange = _isPositionInRange(localPosition: localPosition);
    if (isInRange) {
      if (_animationController.isDismissed) {
        _animationController.forward();
      }
    } else {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
    }
  }

  void _tapDown() {
    if (!isEnabled) return;
    _animationController.forward();
    HapticFeedback.lightImpact();
  }

  void _tapUp() {
    if (!isEnabled) return;
    HapticFeedback.lightImpact();
    _animationController.reverse();
    widget.onPressed?.call();
  }
}
