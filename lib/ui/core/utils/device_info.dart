import 'package:flutter/material.dart';

/// Classe responsável por fornecer informações sobre o dispositivo
/// como tipo de tela (mobile/desktop) e dimensões
class DeviceInfo {
  /// Largura máxima considerada como dispositivo mobile
  static const double mobileMaxWidth = 768;

  /// Largura base para cálculos em mobile
  static const double mobileBaseWidth = 320;

  /// Altura base para cálculos em mobile
  static const double mobileBaseHeight = 568;

  /// Largura base para cálculos em desktop
  static const double desktopBaseWidth = 1920;

  /// Altura base para cálculos em desktop
  static const double desktopBaseHeight = 1080;

  /// Verifica se o dispositivo atual é mobile baseado no tamanho da tela
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileMaxWidth;
  }

  /// Verifica se o dispositivo atual é mobile baseado em um tamanho específico
  static bool isMobileFromSize(Size size) {
    return size.width <= mobileMaxWidth;
  }

  /// Obtém as escalas de largura e altura para o dispositivo atual
  static (double widthScale, double heightScale) getScales(Size screenSize) {
    if (isMobileFromSize(screenSize)) {
      return (
        screenSize.width / mobileBaseWidth,
        screenSize.height / mobileBaseHeight
      );
    } else {
      return (
        screenSize.width / desktopBaseWidth,
        screenSize.height / desktopBaseHeight
      );
    }
  }
}
