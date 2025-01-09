import 'package:flutter/material.dart';
import '../../../../data/home/home_frame_data.dart';
import '../../../core/widgets/responsive_frame.dart';

/// Widget principal da tela inicial do portfólio
/// Responsável por exibir todos os frames em um layout responsivo
/// que se adapta automaticamente para diferentes tamanhos de tela
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Utiliza o ResponsiveFrameLayout para organizar os frames
    // Os frames são obtidos através do FrameData.getHomeAllFrames()
    // que retorna uma lista com todos os frames da Home do portfólio
    return ResponsiveHomeFrameLayout(frames: HomeFrameData.getHomeAllFrames());
  }
}
