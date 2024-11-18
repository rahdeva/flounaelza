import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flutter/material.dart';

class AppElevation {
  static BoxShadow elevation2px = BoxShadow(
    color: AppColors.black.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );
  static BoxShadow elevation4px = BoxShadow(
    color: AppColors.black.withOpacity(0.10),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 2),
  );
  static BoxShadow elevation4pxBottom = BoxShadow(
    color: AppColors.black.withOpacity(0.04),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 4),
  );
  static BoxShadow elevation4pxUp = BoxShadow(
    color: AppColors.black.withOpacity(0.04),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, -4),
  );
  static BoxShadow elevation7px = BoxShadow(
    color: AppColors.black.withOpacity(0.20),
    spreadRadius: 0,
    blurRadius: 7,
    offset: const Offset(0, 2),
  );
  static BoxShadow elevation7pxBottom = BoxShadow(
    color: AppColors.black.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 7,
    offset: const Offset(0, 4),
  );
  static BoxShadow elevation9px = BoxShadow(
    color: AppColors.black.withOpacity(0.20),
    spreadRadius: 0,
    blurRadius: 11,
    offset: const Offset(0, 2),
  );
}