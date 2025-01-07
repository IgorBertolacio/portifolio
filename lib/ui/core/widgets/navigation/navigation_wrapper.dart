import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/providers/navigation_state.dart';
import '../../../../domain/controllers/image_interaction_controller.dart';
import '../../../features/about_me/screen/about_me_screen.dart';
import '../../../features/achievements/screen/achievements_screen.dart';
import '../../../features/education/screen/education_screen.dart';
import '../../../features/experience/screen/expereience_screen.dart';
import '../../../features/home/screen/home_screen.dart';
import '../../../features/projects/screen/prejects_screen.dart';
import 'paralax_page.dart';

/// Widget responsável por gerenciar a navegação entre as telas do portfólio
/// Implementa navegação vertical com efeito parallax e controle de scroll
class NavigationWrapper extends StatefulWidget {
  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  DateTime? _lastScrollTime;
  late PageController _pageController;
  double _initialDragPosition = 0;
  bool _isDragging = false;
  late ImageInteractionController _controller;
  late NavigationState _navigationState;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navigationState = Provider.of<NavigationState>(context, listen: true);
    _controller = ImageInteractionController(_navigationState);
    _navigationState.addListener(_handleNavigationChange);
  }

  @override
  void dispose() {
    _navigationState.removeListener(_handleNavigationChange);
    _pageController.dispose();
    super.dispose();
  }

  void _handleNavigationChange() {
    _animateToPage(_navigationState.currentIndex);
  }

  bool _canScroll() {
    if (_lastScrollTime == null) return true;
    final now = DateTime.now();
    final difference = now.difference(_lastScrollTime!);
    return difference.inMilliseconds > 1000;
  }

  void _animateToPage(int page) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _handleNavigation(dynamic event) {
    if (event is PointerScrollEvent && _canScroll()) {
      _lastScrollTime = DateTime.now();
      
      if (event.scrollDelta.dy > 0) {
        _navigationState.navigateToNext();
        _controller.handleNavigation(_navigationState.currentPageName, true);
      } else {
        _navigationState.navigateToPrevious();
        _controller.handleNavigation(_navigationState.currentPageName, true);
      }
    }
    else if (event is PointerDownEvent) {
      _initialDragPosition = event.position.dy;
      _isDragging = true;
    }
    else if (event is PointerUpEvent && _isDragging) {
      _isDragging = false;
      
      final dragDistance = event.position.dy - _initialDragPosition;
      const double dragThreshold = 50.0;
      
      if (dragDistance < -dragThreshold) {
        _navigationState.navigateToNext();
        _controller.handleNavigation(_navigationState.currentPageName, false);
      } else if (dragDistance > dragThreshold) {
        _navigationState.navigateToPrevious();
        _controller.handleNavigation(_navigationState.currentPageName, false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _handleNavigation,
      onPointerDown: _handleNavigation,
      onPointerUp: _handleNavigation,
      child: Consumer<NavigationState>(
        builder: (context, provider, _) {
          final screens = [
            HomeScreen(),
            AboutMeScreen(),
            EducationScreen(),
            ExperienceScreen(),
            ProjectScreen(),
            AchievementsScreen(),
          ];

          return PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: screens
                .map((screen) => ParallaxWidget(child: screen))
                .toList(),
          );
        },
      ),
    );
  }
}
