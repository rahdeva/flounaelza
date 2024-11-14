import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    this.textType = DefaultTextType.textBase,
    this.textWeight = DefaultTextWeight.regular,
  });

  final String text;
  final DefaultTextType textType;
  final DefaultTextWeight textWeight;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppColors.gradient1.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: DefaultText(
        text: text,
        type: textType,
        weight: textWeight,
      ),
    );
  }
}