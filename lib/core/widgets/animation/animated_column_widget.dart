import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maids/core/constants/constants.dart';

/// Animated list based on two different set of widgets [AnimationLimiter]
/// [AnimationConfiguration.staggeredList] and [Column] widget.
class AnimationColumnWidget extends StatelessWidget {
  final Duration duration;
  final Curve curve;
  final double? verticalOffset;
  final double? horizontalOffset;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget> children;

  const AnimationColumnWidget({
    super.key,
    this.duration = const Duration(
      milliseconds: AppDuration.animatedColumnDuration,
    ),
    this.horizontalOffset = 0.0,
    required this.children,
    this.curve = Curves.ease,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.verticalOffset = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    // return Column(
    //  mainAxisSize: mainAxisSize,
    //         mainAxisAlignment: mainAxisAlignment,
    //         crossAxisAlignment: crossAxisAlignment,
    //         children: children,
    //         );
    return AnimationLimiter(
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: AnimationConfiguration.toStaggeredList(
          duration: duration,
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: horizontalOffset,
            verticalOffset: verticalOffset,
            curve: curve,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}
