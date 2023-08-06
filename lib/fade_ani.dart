import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAni extends StatelessWidget {
  final Widget child;
  final double delay;
  FadeAni({
    super.key,
    required this.child,
    required this.delay,
  });

  final tween = MovieTween()
    ..tween('opacity', Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 80))
    ..tween('y', Tween(begin: 40.0, end: 0.0),
        duration: const Duration(milliseconds: 150), curve: Curves.easeOut);

  // var tween1 = MovieTween()
  //   ..scene(duration: const Duration(milliseconds: 700))
  //       .tween('width', Tween<double>(begin: 0.0, end: 100.0))
  //       .tween('height', Tween<double>(begin: 300.0, end: 200.0));

  // final tween2 = MovieTween()
  //   ..scene().tween("opacity", Tween(begin: 0, end: 1.0));

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
            offset: Offset(0, value.get("y")), child: child),
      ),
    );
  }
}
