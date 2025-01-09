import 'package:flutter/material.dart';
import '../../../domain/models/home/home_frame_model.dart';
import '../../../domain/services/logging_service.dart';
import '../utils/device_info.dart';
import 'hoverable_frame.dart';

class ResponsiveHomeFrameLayout extends StatelessWidget {
  final List<HomeFrameModel> frames;
  final Duration animationDuration;
  final Curve animationCurve;

  const ResponsiveHomeFrameLayout({
    Key? key,
    required this.frames,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeInOutCubic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = DeviceInfo.isMobileFromSize(screenSize);
    
    // Reporta informações do dispositivo
    LoggingService().logDeviceInfo(screenSize);

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
