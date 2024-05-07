import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    required this.size,
    this.color,
    this.child,
  }) : super(key: key);

  final double size;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
