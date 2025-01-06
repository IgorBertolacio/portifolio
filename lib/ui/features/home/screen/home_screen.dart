import 'package:flutter/material.dart';
import '../../../../data/frame_data.dart';  // Importa os dados dos frames
import '../../../core/widgets/responsive_frame.dart';  // Widget responsivo para os frames

/// Widget principal da tela inicial do portfólio
/// Responsável por exibir todos os frames em um layout responsivo
/// que se adapta automaticamente para diferentes tamanhos de tela
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Utiliza o ResponsiveFrameLayout para organizar os frames
    // Os frames são obtidos através do FrameData.getAllFrames()
    // que retorna uma lista com todos os frames do portfólio
    return ResponsiveFrameLayout(frames: FrameData.getAllFrames());
  }
}