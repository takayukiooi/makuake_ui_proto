import 'package:flutter/material.dart';

class PopupDialog extends ModalRoute {
  final Widget child;

  PopupDialog({
    required this.child,
  });

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => 'ThanksPopup';

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
