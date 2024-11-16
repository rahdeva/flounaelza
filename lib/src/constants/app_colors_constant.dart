import 'package:flutter/material.dart';

class AppColors {
  // Common
  static const Color backgroundColor = Color(0xFFF8F8F8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black700 = Color(0xFF3F3F46);
  static const Color black900 = Color(0xFF18181B);
  static const Color grey = Colors.grey;
  static const Color green = Color(0xFF5FA521);
  
  // Primary Color
  static const Color primaryColor = Color(0xFFBEADFA);
  static const Color primarySurfaceColor = Color(0xFFD4C7FB);
  static const Color primaryBorderColor = Color(0xFF9F8EDB);
  static const Color primaryHoverColor = Color(0xFFC5B8FB);
  static const Color primaryPressedColor = Color(0xFF8F77D4);

  // Secondary Color
  static const Color secondaryColor = Color(0xFFF7C8E0);
  static const Color secondarySurfaceColor = Color(0xFFF9D2E6);
  static const Color secondaryBorderColor = Color(0xFFEAB1C8);
  static const Color secondaryHoverColor = Color(0xFFF4BDD8);
  static const Color secondaryPressedColor = Color(0xFFD896AF);

  // Tertiary Color
  static const Color tertiaryColor = Color(0xFF2EA4C4);
  static const Color tertiarySurfaceColor = Color(0xFF4EB5D2);
  static const Color tertiaryBorderColor = Color(0xFF2591AD);
  static const Color tertiaryHoverColor = Color(0xFF3AA0BD);
  static const Color tertiaryPressedColor = Color(0xFF1F8198);

  // Info Color
  static const Color infoColor = Color(0xFFBBE9FF);
  static const Color infoSurfaceColor = Color(0xFFD1F1FF);
  static const Color infoBorderColor = Color(0xFF92DFFF);
  static const Color infoHoverColor = Color(0xFFA8E7FF);
  static const Color infoPressedColor = Color(0xFF6BCFFF);

  // Success Color
  static const Color successColor = Color(0xFF95D2B3);
  static const Color successSurfaceColor = Color(0xFFB8E4CB);
  static const Color successBorderColor = Color(0xFF7CBC9A);
  static const Color successHoverColor = Color(0xFFA2DCC1);
  static const Color successPressedColor = Color(0xFF6AA986);

  // Warning Color
  static const Color warningColor = Color(0xFFF6F7C4);
  static const Color warningSurfaceColor = Color(0xFFFAF9D6);
  static const Color warningBorderColor = Color(0xFFF2ED9E);
  static const Color warningHoverColor = Color(0xFFF8F3B0);
  static const Color warningPressedColor = Color(0xFFDAD86A);

  // Error Color
  static const Color errorColor = Color(0xFFFD8A8A);
  static const Color errorSurfaceColor = Color(0xFFF7A6A6);
  static const Color errorBorderColor = Color(0xFFEC7B7B);
  static const Color errorHoverColor = Color(0xFFB83B5C);
  static const Color errorPressedColor = Color(0xFF9A1D44);

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

  // textColour
  static const textColour00 = Color(0xFFFFFFFF);
  static const textColour10 = Color(0xFFE7E7E7);
  static const textColour20 = Color(0xFFCFCFCF);
  static const textColour30 = Color(0xFFB6B6B6);
  static const textColour40 = Color(0xFF9E9E9E);
  static const textColour50 = Color(0xFF868686);
  static const textColour60 = Color(0xFF6E6E6E);
  static const textColour70 = Color(0xFF565656);
  static const textColour80 = Color(0xFF3D3D3D);
  static const textColour90 = Color(0xFF252525);
  static const textColour100 = Color(0xFF0D0D0D);

  // Others
  static const edition1 = Color(0xFF8A76BB);
  static const edition2 = Color(0xFFA16799);
  static const edition3 = Color(0xFFA34F4F);
  static const edition4 = Color(0xFFB1845B);
  static const edition5 = Color(0xFFC8A190);
  static const edition6 = Color(0xFFC3C3C3);
  static const editionBG1 = Color(0xFFEBE4FF);
  static const editionBG2 = Color(0xFFFDC6CE);
  static const editionBG3 = Color(0xFFFF8D90);
  static const editionBG4 = Color(0xFFFBC66F);
  static const editionBG5 = Color(0xFFFCC2A9);
  static const editionBG6 = Color(0xFFF8F8F7);

  // Gradients
  static const gradientBG1 = Color(0xFF6096B4);
  static const gradientBG2 = Color(0xFF93BFCF);
  static const gradientBG3 = Color(0xFF7286D3);
  static const gradientBG4 = Color(0xFF8EA7E9);
  static const gradientBG5 = Color(0xFF5C8984);
  static const gradientBG6 = Color(0xFF7ED7C1);
  static const gradientBG7 = Color(0xFFBB9AB1);
  static const gradientBG8 = Color(0xFFF3D0D7);
  static const gradientBG9 = Color(0xFFE9B384);
  static const gradientBG10 = Color(0xFFFFEBD8);
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