import 'package:flutter/material.dart';

class Pressable extends StatelessWidget {
  const Pressable({
    super.key,
    this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: child,
    );
  }
}
