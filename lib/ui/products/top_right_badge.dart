import 'package:flutter/material.dart';

class TopRightBadge extends StatelessWidget {
  final Widget child;
  final Object data;
  final Color? color;

  const TopRightBadge({
    super.key,
    required this.child,
    required this.data,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color ?? Theme.of(context).colorScheme.secondary,
            ),
            constraints: const BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            child: Text(
              data.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
