import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/controllers/image_interaction_controller.dart';
import '../../../domain/providers/navigation_state.dart';

class HoverableFrame extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scale;
  final String frameName;

  const HoverableFrame({
    Key? key,
    required this.child,
    required this.frameName,
    this.duration = const Duration(milliseconds: 100),
    this.scale = 1.10,
  }) : super(key: key);

  @override
  State<HoverableFrame> createState() => _HoverableFrameState();
}

class _HoverableFrameState extends State<HoverableFrame> {
  bool _isHovered = false;
  late ImageInteractionController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final navigationState = Provider.of<NavigationState>(context, listen: false);
    _controller = ImageInteractionController(navigationState);
  }

  void _handleHoverChange(bool isHovering) {
    setState(() => _isHovered = isHovering);
    _controller.handleHoverEvent(widget.frameName, isHovering);
  }

  @override
  Widget build(BuildContext context) {
    // Only enable hover effect on desktop platforms
    return GestureDetector(
      onTap: () => _controller.handleImageClick(widget.frameName),
      child: MouseRegion(
        onEnter: (_) => _handleHoverChange(true),
        onExit: (_) => _handleHoverChange(false),
        child: AnimatedScale(
          scale: _isHovered ? widget.scale : 1.0,
          duration: widget.duration,
          child: widget.child,
        ),
      ),
    );
  }
}