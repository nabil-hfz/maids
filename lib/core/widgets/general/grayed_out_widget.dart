// Flutter imports:
import 'package:flutter/material.dart';

class GrayedOut extends StatelessWidget {
  final Widget child;
  final bool grayedOut;
  final double opacity;

  const GrayedOut({
    required this.child,
    super.key,
    this.grayedOut = true,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return grayedOut ? Opacity(opacity: opacity, child: child) : child;
  }
}
