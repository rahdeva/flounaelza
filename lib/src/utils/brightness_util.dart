import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrightnessUtil {
  static const platform = MethodChannel('com.example.app/brightness');

  static Future<void> setBrightness(double brightness) async {
    try {
      await platform.invokeMethod('setBrightness', {'brightness': brightness});
    } on PlatformException catch (e) {
      debugPrint("Failed to set brightness: '${e.message}'.");
    }
  }
}