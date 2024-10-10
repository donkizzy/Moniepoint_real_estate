import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCountUp extends StatelessWidget {
  final Duration duration;
  final int end;
  final TextStyle style;

  const AnimatedCountUp({
    super.key,
    required this.duration,
    required this.end,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: end),
      duration: duration,
      builder: (context, value, _) {
        return Text(
          value.toString(),
          style: style,
        ).animate().fadeIn();
      },
    );
  }
}