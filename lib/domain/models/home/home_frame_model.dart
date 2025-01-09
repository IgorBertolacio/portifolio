import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../ui/core/utils/device_info.dart';

/// Modelo que representa um frame na Home do portfólio
/// Contém todas as informações necessárias para renderizar e posicionar
/// um frame tanto em layout desktop quanto mobile
class HomeFrameModel {
  /// Nome identificador do frame
  final String name;

  /// Dimensões para layout desktop
  final double width; // Largura em desktop
  final double height; // Altura em desktop
  final double x; // Posição X em desktop
  final double y; // Posição Y em desktop

  /// Dimensões para layout mobile
  final double mobileWidth; // Largura em mobile
  final double mobileHeight; // Altura em mobile
  final double mobileX; // Posição X em mobile
  final double mobileY; // Posição Y em mobile

  /// Caminhos para os assets
  final String svgPath; // Caminho do arquivo SVG
  final String pngPath; // Caminho do arquivo PNG (fallback)

  /// Instância do SVG pré-carregada
  late final SvgPicture svgPicture;

  /// Construtor que inicializa todas as propriedades do frame
  /// e carrega o SVG automaticamente
  HomeFrameModel({
    required this.name,
    required this.width,
    required this.height,
    required this.x,
    required this.y,
    required this.mobileWidth,
    required this.mobileHeight,
    required this.mobileX,
    required this.mobileY,
    required this.svgPath,
    required this.pngPath,
  }) {
    // Inicializa o SVG com configurações padrão
    svgPicture = SvgPicture.asset(
      svgPath,
      fit: BoxFit.contain,
    );
  }

  /// Calcula o tamanho do frame baseado no tamanho da tela
  /// e se está em modo mobile ou desktop
  /// @param screenSize Tamanho atual da tela
  /// @param isMobile Flag indicando se está em modo mobile
  /// @returns Size Tamanho calculado do frame
  Size getSize(Size screenSize, bool isMobile) {
    final (widthScale, heightScale) = DeviceInfo.getScales(screenSize);

    if (isMobile) {
      return Size(mobileWidth * widthScale, mobileHeight * heightScale);
    } else {
      return Size(width * widthScale, height * heightScale);
    }
  }

  /// Calcula a posição do frame baseado no tamanho da tela
  /// e se está em modo mobile ou desktop
  /// @param screenSize Tamanho atual da tela
  /// @param isMobile Flag indicando se está em modo mobile
  /// @returns Offset Posição calculada do frame
  Offset getPosition(Size screenSize, bool isMobile) {
    final (widthScale, heightScale) = DeviceInfo.getScales(screenSize);

    if (isMobile) {
      return Offset(mobileX * widthScale, mobileY * heightScale);
    } else {
      return Offset(x * widthScale, y * heightScale);
    }
  }
}
