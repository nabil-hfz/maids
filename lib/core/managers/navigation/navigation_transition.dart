import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
        );

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}

class VerticalSlideTransitionPage extends CustomTransitionPage<void> {
  VerticalSlideTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: _offsetTween.chain(_curveTween).animate(animation),
              child: child,
            );
          },
        );

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
  static final Tween<Offset> _offsetTween = Tween(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  );
}

class HorizontalSlideLeftTransitionPage extends CustomTransitionPage<void> {
  HorizontalSlideLeftTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: _leftOffsetTween.chain(_curveTween).animate(animation),
              child: child,
            );
          },
        );

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
  static final Tween<Offset> _leftOffsetTween = Tween(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  );
}

class HorizontalSlideRightTransitionPage extends CustomTransitionPage<void> {
  HorizontalSlideRightTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: _rightOffsetTween.chain(_curveTween).animate(animation),
              child: child,
            );
          },
        );

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
  static final Tween<Offset> _rightOffsetTween = Tween(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  );
}

class FadeScaleTransitionPage extends CustomTransitionPage<void> {
  FadeScaleTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeScaleTransition(
              animation: animation,
              child: child,
              // secondaryAnimation: secondaryAnimation,
            );
          },
        );
}

class FadeThroughTransitionPage extends CustomTransitionPage<void> {
  FadeThroughTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
        );
}

class SharedAxisTransitionPage extends CustomTransitionPage<void> {
  final SharedAxisTransitionType transitionType;

  SharedAxisTransitionPage({
    required LocalKey super.key,
    required super.child,
    required this.transitionType,
  }) : super(
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: transitionType,
              child: child,
            );
          },
        );
}
