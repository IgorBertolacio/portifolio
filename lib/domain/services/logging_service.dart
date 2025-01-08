import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Service responsible for managing application logs
class LoggingService {
  static final LoggingService _instance = LoggingService._internal();
  late final Logger _logger;
  
  factory LoggingService() {
    return _instance;
  }
  
  LoggingService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
      ),
    );
  }

  /// Logs an image click event
  void logImageClick(String imageName) {
    _logger.i('🖱️ Image clicked: $imageName');
  }

  /// Logs an image hover event
  void logHoverEvent(String imageName, bool isHovering) {
    final action = isHovering ? 'Mouse entered' : 'Mouse left';
    _logger.i('🖱️ $action: $imageName');
  }

  /// Logs a navigation event
  void logNavigation(String pageName, String method) {
    _logger.i('🔄 Navigated to: $pageName using $method');
  }

  /// Logs a click navigation event
  void logClickNavigation(String fromFrame, String toPage, bool successful) {
    final status = successful ? 'success' : 'failure';
    _logger.i('''🎯 Click Navigation:
    - From: $fromFrame
    - To: $toPage
    - Status: $status''');
  }

  /// Logs an error with stack trace
  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Logs a warning message
  void logWarning(String message) {
    _logger.w(message);
  }

  /// Logs debug information
  void logDebug(String message) {
    _logger.d(message);
  }
}
