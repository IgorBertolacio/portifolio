import 'package:flutter/material.dart';

class PortifolioColors {
  static const Color startColor = Color.fromRGBO(191, 183, 176, 1.0); // #BFB7B0
  static const Color middleColor = Color.fromRGBO(242, 242, 242, 1.0); // #F2F2F2
  static const Color endColor = Color.fromRGBO(191, 183, 176, 1.0); // #BFB7B0

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.0, 0.54, 1.0],
    colors: [
      startColor,
      middleColor,
      endColor,
    ],
  );
}