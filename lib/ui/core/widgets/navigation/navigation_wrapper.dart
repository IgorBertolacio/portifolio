import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:portifolio/ui/core/widgets/navigation/paralax_page.dart';
import 'package:provider/provider.dart';

import '../../../../domain/providers/navigation_state.dart';
import '../../../features/about_me/screen/about_me_screen.dart';
import '../../../features/achievements/screen/achievements_screen.dart';
import '../../../features/education/screen/education_screen.dart';
import '../../../features/experience/screen/expereience_screen.dart';
import '../../../features/home/screen/home_screen.dart';
import '../../../features/projects/screen/prejects_screen.dart';

/// Widget responsável por gerenciar a navegação entre as telas do portfólio
/// Implementa navegação vertical com efeito parallax e controle de scroll
class NavigationWrapper extends StatefulWidget {
  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

/// Estado do NavigationWrapper que gerencia a animação de transição entre telas
/// e o controle de scroll do usuário
class _NavigationWrapperState extends State<NavigationWrapper>
    with TickerProviderStateMixin {
  // Controle de tempo para evitar scrolls muito rápidos
  DateTime? _lastScrollTime;
  // Controlador para animação de página
  late PageController _pageController;

  // Variáveis para controlar o gesto de arrasto
  double _initialDragPosition = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador de página
    _pageController = PageController();
  }

  @override
  void dispose() {
    // Libera recursos do controlador quando o widget é destruído
    _pageController.dispose();
    super.dispose();
  }

  /// Verifica se é possível realizar um novo scroll
  /// Implementa um debounce de 1 segundo entre scrolls
  /// @returns bool True se pode scrollar, False caso contrário
  bool _canScroll() {
    if (_lastScrollTime == null) return true;
    final now = DateTime.now();
    final difference = now.difference(_lastScrollTime!);
    return difference.inMilliseconds > 1000; // Debounce de 1 segundo
  }

  /// Anima a transição para uma página específica
  /// @param page Índice da página destino
  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
    );
  }

  /// Manipula eventos de scroll do mouse/touchpad e gestos de arrasto
  void _handleNavigation(dynamic event) {
    // Lógica para scroll do mouse
    if (event is PointerScrollEvent && _canScroll()) {
      _lastScrollTime = DateTime.now();
      final provider = context.read<NavigationState>();
      
      // Determina a direção do scroll e navega adequadamente
      if (event.scrollDelta.dy > 0) {
        provider.navigateToNext();
        _animateToPage(provider.currentIndex);
      } else {
        provider.navigateToPrevious();
        _animateToPage(provider.currentIndex);
      }
    }
    // Lógica para gestos de arrasto (mobile)
    else if (event is PointerDownEvent) {
      _initialDragPosition = event.position.dy;
      _isDragging = true;
    }
    else if (event is PointerUpEvent && _isDragging) {
      _isDragging = false;
      final provider = context.read<NavigationState>();
      
      // Calcula a distância do arrasto
      final dragDistance = event.position.dy - _initialDragPosition;
      
      // Define um limite de sensibilidade para o gesto
      const double dragThreshold = 50.0;
      
      if (dragDistance < -dragThreshold) {
        // Arrasto para baixo (negativo) navega para próxima página
        provider.navigateToNext();
        _animateToPage(provider.currentIndex);
      } else if (dragDistance > dragThreshold) {
        // Arrasto para cima (positivo) navega para página anterior
        provider.navigateToPrevious();
        _animateToPage(provider.currentIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      // Detecta eventos de scroll e gestos
      onPointerSignal: _handleNavigation,
      onPointerDown: _handleNavigation,
      onPointerUp: _handleNavigation,
      // Usa Consumer para reagir a mudanças no estado de navegação
      child: Consumer<NavigationState>(
        builder: (context, provider, _) {
          // Lista de todas as telas disponíveis na ordem de navegação
          final screens = [
            HomeScreen(),
            AboutMeScreen(),
            EducationScreen(),
            ExperienceScreen(),
            ProjectScreen(),
            AchievementsScreen(),
          ];

          // PageView vertical com efeito parallax em cada tela
          return PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(), // Desabilita scroll por arrasto
            children: screens
                .map((screen) => ParallaxWidget(child: screen))
                .toList(),
          );
        },
      ),
    );
  }
}
