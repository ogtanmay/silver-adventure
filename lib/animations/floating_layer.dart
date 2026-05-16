import 'package:flutter/material.dart';

class FloatingLayer extends StatefulWidget {
  const FloatingLayer({super.key, required this.child});

  final Widget child;

  @override
  State<FloatingLayer> createState() => _FloatingLayerState();
}

class _FloatingLayerState extends State<FloatingLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      lowerBound: -0.02,
      upperBound: 0.02,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, _controller.value * 120),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
