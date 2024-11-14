import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DefaultTextType {
  textXS,
  text2XS,
  text3XS,
  textSM,
  textBase,
  textMD,
  textLG,
  text2LG,
  textXL,
  text2XL,
  text3XL,
  text4XL,
}

enum DefaultTextWeight {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

class DefaultText extends StatelessWidget {
  const DefaultText({
    super.key,
    required this.text,
    this.type = DefaultTextType.textBase,
    this.weight = DefaultTextWeight.regular,
    this.color = Colors.white,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });

  final String text;
  final DefaultTextType type;
  final DefaultTextWeight weight;
  final Color color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;

  _getFontSize() {
    switch (type) {
      case DefaultTextType.textXS:
        return 8.0;
      case DefaultTextType.text2XS:
        return 10.0;
      case DefaultTextType.text3XS:
        return 12.0;
      case DefaultTextType.textSM:
        return 14.0;
      case DefaultTextType.textBase:
        return 16.0;
      case DefaultTextType.textMD:
        return 18.0;
      case DefaultTextType.textLG:
        return 20.0;
      case DefaultTextType.text2LG:
        return 22.0;
      case DefaultTextType.textXL:
        return 24.0;
      case DefaultTextType.text2XL:
        return 28.0;
      case DefaultTextType.text3XL:
        return 32.0;
      case DefaultTextType.text4XL:
        return 40.0;
    }
  }

  _getFontWeight() {
    switch (weight) {
      case DefaultTextWeight.light:
        return FontWeight.w300;
      case DefaultTextWeight.regular:
        return FontWeight.w400;
      case DefaultTextWeight.medium:
        return FontWeight.w500;
      case DefaultTextWeight.semiBold:
        return FontWeight.w600;
      case DefaultTextWeight.bold:
        return FontWeight.w700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.georama(
        textStyle: TextStyle(
          decoration: decoration,
          decorationColor: decorationColor,
          decorationThickness: decorationThickness,
        ),
        fontSize: _getFontSize(),
        fontWeight: _getFontWeight(),
        color: color,
      ),
    );
  }
}
