import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

enum TertiaryButtonVariant { regular, danger, link , gradient, neutral}

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = TertiaryButtonVariant.regular,
    this.textType = DefaultTextType.textBase,
    this.textWeight = DefaultTextWeight.regular,
    this.textDecoration,
  });

  final String label;
  final VoidCallback? onPressed;
  final TertiaryButtonVariant variant;
  final DefaultTextType textType;
  final DefaultTextWeight textWeight;
  final TextDecoration? textDecoration;

  _getTextColor() {
    if (onPressed == null) {
      return AppColors.neutral50;
    }

    switch (variant) {
      case TertiaryButtonVariant.regular:
        return AppColors.primaryColor;
      case TertiaryButtonVariant.danger:
        return AppColors.errorColor;
      case TertiaryButtonVariant.link:
        return AppColors.infoColor;
      case TertiaryButtonVariant.gradient:
        return AppColors.gradient1;
      case TertiaryButtonVariant.neutral:
        return AppColors.neutral500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: variant == TertiaryButtonVariant.gradient
      ? ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.gradient1.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: DefaultText(
            text: label,
            type: textType,
            weight: textWeight,
            decoration: textDecoration,
            decorationColor: textDecoration != null 
              ? _getTextColor() 
              : null,
          ),
        )
      : DefaultText(
          text: label,
          color: _getTextColor(),
          type: textType,
          weight: textWeight,
          decoration: textDecoration,
          decorationColor: textDecoration != null 
            ? _getTextColor() 
            : null,
        ),
    );
  }
}
