import 'package:flutter/material.dart';

class AppColors {
  // Common
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black700 = Color(0xFF3F3F46);
  static const Color black900 = Color(0xFF18181B);
  static const Color grey = Colors.grey;
  static const Color green = Color(0xFF5FA521);
  static const Color bgGradient1 = Color(0xFFFFF4F6);
  static const Color bgSlider = Color.fromARGB(30, 255, 255, 255);
  static const Color bgCalendarIcon = Color(0xFF6790EA);
  
  // Primary Color
  static const Color primaryColor = Color(0xFFF15F36);
  static const Color primarySurfaceColor = Color(0xFFF7A68E);
  static const Color primaryBorderColor = Color(0xFFD94E2B);
  static const Color primaryHoverColor = Color(0xFFE64C1D);
  static const Color primaryPressedColor = Color(0xFFB83B15);

  // Info Color
  static const Color infoColor = Color(0xFF0284FE);
  static const Color infoSurfaceColor = Color(0xFFCCF0FF);
  static const Color infoBorderColor = Color(0xFF67C4FF);
  static const Color infoHoverColor = Color(0xFF024CB7);
  static const Color infoPressedColor = Color(0xFF002679);

  // Success Color
  static const Color successColor = Color(0xFF64B044);
  static const Color successSurfaceColor = Color(0xFFD8F7BB);
  static const Color successBorderColor = Color(0xFFB6E893);
  static const Color successHoverColor = Color(0xFF317D22);
  static const Color successPressedColor = Color(0xFF0E540C);

  // Warning Color
  static const Color warningColor = Color(0xFFFBC143);
  static const Color warningSurfaceColor = Color(0xFFFCEAAA);
  static const Color warningBorderColor = Color(0xFFF8D97F);
  static const Color warningHoverColor = Color(0xFFA77016);
  static const Color warningPressedColor = Color(0xFF6F4008);

  // Error Color
  static const Color errorColor = Color(0xFFF01B4A);
  static const Color errorSurfaceColor = Color(0xFFFCB1AC);
  static const Color errorBorderColor = Color(0xFFF98286);
  static const Color errorHoverColor = Color(0xFFA91755);
  static const Color errorPressedColor = Color(0xFF6F0948);

  // Neutral
  static const Color neutral = Color(0xFFF3F4F6);
  static const Color neutral50 = Color(0xFFF6F6F9);
  static const Color neutral100 = Color(0xFFF9F9F9);
  static const Color neutral200 = Color(0xFFE9EBE8);
  static const Color neutral300 = Color(0xFFDFDFE1);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF949496);
  static const Color neutral600 = Color(0xFF737278);
  static const Color neutral700 = Color(0xFF5D5C62);
  static const Color neutral800 = Color(0xFF413F4C);
  static const Color disabledFill = Color(0xFFFAFAFA);
  static const Color disabledOutline = Color(0xFFF3F4F6);

  // Gradients
  static const Gradient gradient1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primaryColor,
      AppColors.primaryPressedColor
    ],
    stops: [0, 1]
  );
  static const Gradient blueChartGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(180, 62, 161, 254),
      Color.fromARGB(20, 62, 161, 254),
    ],
    stops: [0, 0.8]
  );
  static const Gradient greenChartGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(180, 178, 235, 155),
      Color.fromARGB(60, 231, 255, 211),
    ],
    stops: [0, 0.8]
  );

  // Shadow
  static const List<BoxShadow> searchShadow = [
    BoxShadow(
      color: Color(0x00B3B3B3),
      blurRadius: 8,
      offset: Offset(-25, 14),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x01B3B3B3),
      blurRadius: 7,
      offset: Offset(-16, 9),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x03B3B3B3),
      blurRadius: 6,
      offset: Offset(-9, 5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x05B3B3B3),
      blurRadius: 5,
      offset: Offset(-4, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x06B3B3B3),
      blurRadius: 3,
      offset: Offset(-1, 1),
      spreadRadius: 0,
    ),
  ];
}