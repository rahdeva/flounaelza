import 'dart:ui';
import 'package:flutter/material.dart';

class SizeUtil {
  static final FlutterView _view = WidgetsBinding.instance.platformDispatcher.views.first;

  // Dimensions in logical pixels (dp)
  static final Size _size = _view.physicalSize / _view.devicePixelRatio;

  static double getScreenHeight() {
    return _size.height;
  }

  static double getScreenWidth() {
    return _size.width;
  }

  static double getProportionalHeight({required double height}) {
    return _size.height * height;
  }

  static double getProportionalWidth({required double width}) {
    return _size.width * width;
  }

  /// Returns the height of the status bar
  static EdgeInsetsGeometry getPaddingViewInsetsBottom({required BuildContext context}){
    return EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);
  }
}
