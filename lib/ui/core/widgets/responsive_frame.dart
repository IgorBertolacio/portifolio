import 'package:flutter/material.dart';
import '../../../domain/models/frame_model.dart';
import 'hoverable_frame.dart';

class ResponsiveFrameLayout extends StatelessWidget {
  final List<FrameModel> frames;
  final Duration animationDuration;
  final Curve animationCurve;

  const ResponsiveFrameLayout({
    Key? key,
    required this.frames,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeInOutCubic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width <= 768;

    return Stack(
      children: frames.map((frame) {
        final size = frame.getSize(screenSize, isMobile);
        final position = frame.getPosition(screenSize, isMobile);

        return AnimatedPositioned(
          duration: animationDuration,
          curve: animationCurve,
          left: position.dx,
          top: position.dy,
          child: AnimatedContainer(
            duration: animationDuration,
            curve: animationCurve,
            width: size.width,
            height: size.height,
            child: HoverableFrame(
              frameName: frame.name,
              child: frame.svgPicture,
            ),
          ),
        );
      }).toList(),
    );
  }
}