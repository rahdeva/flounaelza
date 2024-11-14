import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

enum PrimaryButtonVariant { regular, primary, grey, neutralGrey, gradient }

enum PrimaryButtonSize { extraSmall, small, regular, large }

enum PrimaryButtonFontSize { small, regular, large }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.variant = PrimaryButtonVariant.primary,
    this.buttonSize = PrimaryButtonSize.regular,
    this.fontSize = PrimaryButtonFontSize.regular,
    this.fontWeight = DefaultTextWeight.medium,
    this.onPressed,
    this.isExpanded = false,
    this.isLoading = false,
    this.leftWidget,
    this.rightWidget,
    this.useExtraRightWidgetSpace = true,
    this.border,
    this.customWidget,
  });

  final String label;
  final PrimaryButtonVariant variant;
  final PrimaryButtonSize buttonSize;
  final PrimaryButtonFontSize fontSize;
  final DefaultTextWeight fontWeight;
  final VoidCallback? onPressed;
  final bool isExpanded;
  final bool isLoading;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final bool useExtraRightWidgetSpace;
  final BoxBorder? border;
  final Widget? customWidget;

  EdgeInsetsGeometry _getPadding() {
    switch (buttonSize) {
      case PrimaryButtonSize.extraSmall:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case PrimaryButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case PrimaryButtonSize.regular:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case PrimaryButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 35, vertical: 17.5);
    }
  }

  _getBackgroundColor() {
    switch (variant) {
      case PrimaryButtonVariant.regular:
        return AppColors.white;
      case PrimaryButtonVariant.primary:
        return onPressed == null
            ? AppColors.neutral300
            : AppColors.primaryColor;
      case PrimaryButtonVariant.neutralGrey:
        return AppColors.neutral;
      case PrimaryButtonVariant.grey:
        return AppColors.neutral50;
      case PrimaryButtonVariant.gradient:
        return Colors.transparent;
    }
  }

  _getRippleColor() {
    switch (variant) {
      case PrimaryButtonVariant.regular:
        return AppColors.white;
      case PrimaryButtonVariant.primary:
        return onPressed == null
            ? AppColors.primarySurfaceColor
            : AppColors.primaryBorderColor;
      case PrimaryButtonVariant.neutralGrey:
      case PrimaryButtonVariant.grey:
        return AppColors.white;
      case PrimaryButtonVariant.gradient:
        return Colors.transparent;
    }
  }

  _getTextColor() {
    if (onPressed == null) {
      return AppColors.white;
    }

    switch (variant) {
      case PrimaryButtonVariant.regular:
        return AppColors.neutral400;
      case PrimaryButtonVariant.primary:
        return AppColors.white;
      case PrimaryButtonVariant.neutralGrey:
        return AppColors.neutral800;
      case PrimaryButtonVariant.grey:
        return AppColors.neutral400;
      case PrimaryButtonVariant.gradient:
        return AppColors.white;
    }
  }

  _getTextType() {
    switch (fontSize) {
      case PrimaryButtonFontSize.small:
        return DefaultTextType.textSM;
      case PrimaryButtonFontSize.regular:
        return DefaultTextType.textBase;
      case PrimaryButtonFontSize.large:
        return DefaultTextType.textMD;
    }
  }

  _buildText() {
    return DefaultText(
      text: label,
      color: _getTextColor(),
      type: _getTextType(),
      weight: fontWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: variant == PrimaryButtonVariant.gradient
            ? AppColors.gradient1
            : null,
          border: border
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(0),
            shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
            overlayColor: WidgetStateProperty.all<Color>(_getRippleColor()),
            backgroundColor: WidgetStateProperty.all<Color>(_getBackgroundColor()),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(_getPadding()),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                )
              : customWidget ?? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leftWidget != null) ...[
                      leftWidget!,
                      const SizedBox(width: 8)
                    ],
                    _buildText(),
                    if (rightWidget != null) ...[
                      rightWidget!,
                      if (useExtraRightWidgetSpace) ...[const SizedBox(width: 8)],
                    ],
                  ],
                )
        ),
      ),
    );
  }
}
