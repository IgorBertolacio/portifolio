import 'package:flutter/foundation.dart';

/// Gerenciador de estado para navegação entre frames do portfólio
/// Utiliza ChangeNotifier para notificar os widgets quando há mudanças
/// no estado da navegação
class NavigationState extends ChangeNotifier {
  int _currentIndex = 0;
  final List<String> _pageNames = [
    'Home',
    'About Me',
    'Education',
    'Experience',
    'Projects',
    'Achievements'
  ];

  /// Obtém o índice da seção atual
  int get currentIndex => _currentIndex;

  /// Obtém o nome da página atual
  String get currentPageName => _pageNames[_currentIndex];

  /// Obtém o índice da página pelo nome
  int getIndexByName(String name) {
    return _pageNames.indexWhere(
      (pageName) => pageName.toLowerCase() == name.toLowerCase()
    );
  }

  /// Navega para uma página específica pelo índice
  void navigateToIndex(int index) {
    if (index >= 0 && index < _pageNames.length && index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Navega para uma página específica pelo nome
  void navigateToPage(String pageName) {
    final index = _pageNames.indexWhere(
      (page) => page.replaceAll(' ', '').toLowerCase() == pageName.replaceAll(' ', '').toLowerCase()
    );
    if (index != -1) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Navega para a próxima seção
  /// Só avança se não estiver na última seção
  void navigateToNext() {
    if (_currentIndex < _pageNames.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  /// Navega para a seção anterior
  /// Só retrocede se não estiver na primeira seção
  void navigateToPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }
}