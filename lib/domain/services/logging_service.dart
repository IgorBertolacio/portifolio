import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import '../../ui/core/utils/device_info.dart';

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

  /// Reporta informações sobre o tipo de dispositivo e suas dimensões
  void logDeviceInfo(Size screenSize) {
    final bool isMobile = DeviceInfo.isMobileFromSize(screenSize);
    final deviceType = isMobile ? 'Mobile' : 'Desktop';
    final baseWidth = isMobile ? DeviceInfo.mobileBaseWidth : DeviceInfo.desktopBaseWidth;
    final baseHeight = isMobile ? DeviceInfo.mobileBaseHeight : DeviceInfo.desktopBaseHeight;
    
    _logger.i('''📱 Device Info:
    - Type: $deviceType
    - Screen: ${screenSize.width.toStringAsFixed(2)}x${screenSize.height.toStringAsFixed(2)}
    - Base Resolution: ${baseWidth}x${baseHeight}
    - Scale Factor: ${(screenSize.width / baseWidth).toStringAsFixed(2)}x${(screenSize.height / baseHeight).toStringAsFixed(2)}
    - Orientation: ${screenSize.height > screenSize.width ? 'Portrait' : 'Landscape'}
    - Aspect Ratio: ${(screenSize.width / screenSize.height).toStringAsFixed(2)}''');
  }

  /// Reporta informações sobre o tipo de dispositivo usando BuildContext
  void logDeviceInfoFromContext(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    logDeviceInfo(screenSize);
  }
}
