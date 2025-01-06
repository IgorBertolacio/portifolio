import 'package:flutter/cupertino.dart';

class SVGResponsiveHandler {
  static Size calculateSVGSize(BuildContext context, double originalWidth, double originalHeight) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate aspect ratio of original SVG
    final aspectRatio = originalWidth / originalHeight;

    // Calculate maximum possible width and height while maintaining aspect ratio
    double width = screenWidth;
    double height = width / aspectRatio;

    // If height is too large, scale based on height instead
    if (height > screenHeight) {
      height = screenHeight;
      width = height * aspectRatio;
    }

    return Size(width, height);
  }

  static Matrix4 calculateTransform(BuildContext context, double originalWidth, double originalHeight) {
    final size = calculateSVGSize(context, originalWidth, originalHeight);
    final scaleX = size.width / originalWidth;
    final scaleY = size.height / originalHeight;

    return Matrix4.identity()
      ..scale(scaleX, scaleY);
  }
}