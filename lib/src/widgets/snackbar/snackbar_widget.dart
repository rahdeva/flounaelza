import 'package:flutter/material.dart';
import 'package:flounaelza/src/app.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';

class SnackbarWidget {    
  static success({String? message, Duration? duration}) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 2),
        content: Text(
          message ?? 'Berhasil',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.green,
        margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        
      ),
    );
  }

  static error({String? message, Duration? duration}) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message ?? 'Gagal',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.errorColor,
        margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
