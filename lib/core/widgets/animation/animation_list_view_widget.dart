import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maids/core/constants/constants.dart';

/// Animated list based on two different set of widgets [AnimationLimiter]
/// [AnimationConfiguration.staggeredList] and [ListView] widget.
///
/// Also, this widget can render a divider between items as [ListView.separated]
/// option through [isSeparated] and [separatorBuilder] params.
class AnimatedListViewWidget<T> extends StatelessWidget {
  final Curve curve;
  final int itemPlus;
  final List<T> items;
  final bool shrinkWrap;
  final bool isSeparated;
  final Duration duration;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final double horizontalOffset;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  const AnimatedListViewWidget({
    super.key,
    this.physics,
    this.itemPlus = 0,
    this.shrinkWrap = false,
    this.isSeparated = false,
    this.separatorBuilder,
    this.horizontalOffset = 0.0,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(
      milliseconds: AppDuration.animatedListDuration,
    ),
    required this.items,
    required this.itemBuilder,
    this.curve = Curves.ease,
  });

  @override
  Widget build(BuildContext context) {
    final rtlScale = Directionality.of(context) == TextDirection.rtl ? -1 : 1;
    if (isSeparated) {
      return AnimationLimiter(
        child: ListView.separated(
          separatorBuilder: separatorBuilder!,
          itemCount: items.length + itemPlus,
          scrollDirection: scrollDirection,
          padding: padding,
          physics: physics,
          shrinkWrap: shrinkWrap,
          itemBuilder: (context, index) {
            /// HERE IS THE SHIT ERROR -_-
            return iteBuilder(context, index, rtlScale);
          },
        ),
      );
    }
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: items.length + itemPlus,
        scrollDirection: scrollDirection,
        padding: padding,
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemBuilder: (context, index) {
          /// HERE IS THE SHIT ERROR -_-
          return iteBuilder(context, index, rtlScale);
        },
      ),
    );
  }

  iteBuilder(BuildContext context, int index, int rtlScale) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: duration,
      child: ScaleAnimation(
        curve: curve,
        scale: rtlScale * horizontalOffset,
        child: FadeInAnimation(
          child: itemBuilder(context, index),
        ),
      ),
    );
  }
}
