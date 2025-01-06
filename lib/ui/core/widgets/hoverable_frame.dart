import 'package:flutter/material.dart';

class HoverableFrame extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scale;

  const HoverableFrame({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 100),
    this.scale = 1.10,
  }) : super(key: key);

  @override
  State<HoverableFrame> createState() => _HoverableFrameState();
}

class _HoverableFrameState extends State<HoverableFrame> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Only enable hover effect on desktop platforms
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scale : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}