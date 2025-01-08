import '../services/logging_service.dart';
import '../providers/navigation_state.dart';

/// Controller responsável por gerenciar interações com imagens
class ImageInteractionController {
  final LoggingService _loggingService = LoggingService();
  final NavigationState _navigationState;

  ImageInteractionController(this._navigationState);

  /// Manipula o evento de clique em uma imagem
  void handleImageClick(String imageName) {
    _loggingService.logImageClick(imageName);
    
    // Tenta navegar para a página correspondente
    final currentPage = _navigationState.currentPageName;
    
    // Navega diretamente usando o nome da página
    _navigationState.navigateToPage(imageName);
    
    // Loga o resultado da navegação
    final success = _navigationState.currentPageName != currentPage;
    _loggingService.logClickNavigation(
      currentPage,
      imageName,
      success
    );
  }

  /// Manipula eventos de hover
  void handleHoverEvent(String imageName, bool isHovering) {
    _loggingService.logHoverEvent(imageName, isHovering);
  }

  /// Manipula eventos de navegação
  void handleNavigation(String pageName, bool isScrollEvent) {
    final method = isScrollEvent ? 'scroll do mouse' : 'gesto de arrasto';
    _loggingService.logNavigation(pageName, method);
  }
}
