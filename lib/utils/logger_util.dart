import 'package:flutter/foundation.dart';

class AppLogger {

  static final bool _isDebugMode = () {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    return inDebug;
  }();

  static void debug(Object? message) {
    if (_isDebugMode) {
      debugPrint("[DEBUG]: $message");
    }
  }

  static void info(Object? message) {
    if (_isDebugMode) {
      debugPrint("[INFO]: $message");
    }
  }

  static void error(Object? message) {
    debugPrint("[ERROR]: $message");
  }
}
