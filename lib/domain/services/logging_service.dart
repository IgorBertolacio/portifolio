import 'package:flutter/foundation.dart';

/// Serviço responsável por gerenciar logs da aplicação
class LoggingService {
  static final LoggingService _instance = LoggingService._internal();
  
  factory LoggingService() {
    return _instance;
  }
  
  LoggingService._internal();
  
  /// Registra um evento de clique em imagem
  void logImageClick(String imageName) {
    if (kDebugMode) {
      print('🖱️ Clicou em: $imageName');
    }
  }

  /// Registra um evento de hover em imagem
  void logHoverEvent(String imageName, bool isHovering) {
    if (kDebugMode) {
      final action = isHovering ? 'Passou o mouse sobre' : 'Removeu o mouse de';
      print('🖱️ $action: $imageName');
    }
  }

  /// Registra um evento de navegação
  void logNavigation(String pageName, String method) {
    if (kDebugMode) {
      print('🔄 Navegou para: $pageName usando $method');
    }
  }

  /// Registra um evento de redirecionamento por clique
  void logClickNavigation(String fromFrame, String toPage, bool successful) {
    if (kDebugMode) {
      final status = successful ? 'sucesso' : 'falha';
      print('🎯 Redirecionamento por clique:');
      print('   - De: $fromFrame');
      print('   - Para: $toPage');
      print('   - Status: $status');
    }
  }
}
