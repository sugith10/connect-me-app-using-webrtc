import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 900),
    super.settings,
  });

  final WidgetBuilder builder;
  final Duration duration;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => duration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}