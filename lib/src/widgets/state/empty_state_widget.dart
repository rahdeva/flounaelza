import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key, 
    required this.title, 
    required this.subTitle, 
    this.buttonText, 
    this.buttonOnPressed
  });

  final String title;
  final String subTitle;
  final String? buttonText;
  final Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            ImageAssetConstant.emptyStateImage,
          ),
          DefaultText(
            text: title,
            type: DefaultTextType.textMD,
            color: AppColors.black900,
            weight: DefaultTextWeight.semiBold,
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 8),
          DefaultText(
            text: subTitle,
            type: DefaultTextType.textSM,
            color: AppColors.black700,
            weight: DefaultTextWeight.regular,
            textAlign: TextAlign.center
          ),
          if((buttonText != null && buttonText != '') && buttonOnPressed != null)...[
            const SizedBox(height: 24),
            PrimaryButton(
              label: buttonText!,
              onPressed: buttonOnPressed,
            )
          ]
        ],
      ),
    );
  }
}