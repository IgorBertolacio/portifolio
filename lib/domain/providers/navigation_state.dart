import 'package:flutter/cupertino.dart';

/// Gerenciador de estado para navegação entre frames do portfólio
/// Utiliza ChangeNotifier para notificar os widgets quando há mudanças
/// no estado da navegação
class NavigationState extends ChangeNotifier {
  // Índice da seção atual (0-5)
  // 0: About Me, 1: Achievements, 2: Contact
  // 3: Education, 4: Experience, 5: Projects
  int _currentIndex = 0;
  
  /// Getter para obter o índice atual
  int get currentIndex => _currentIndex;

  /// Navega para a próxima seção
  /// Só avança se não estiver na última seção (índice 5)
  /// Notifica os ouvintes após a mudança
  void navigateToNext() {
    if (_currentIndex < 5) {
      _currentIndex++;
      notifyListeners();  // Notifica widgets que dependem deste estado
    }
  }

  /// Navega para a seção anterior
  /// Só retrocede se não estiver na primeira seção (índice 0)
  /// Notifica os ouvintes após a mudança
  void navigateToPrevious() {
    if (currentIndex > 0) {
      _currentIndex--;
      notifyListeners();  // Notifica widgets que dependem deste estado
    }
  }
}