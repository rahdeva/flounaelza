import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key, 
    required this.step, 
    this.stepWithTitle = false, 
    this.stepTitle, 
    required this.title, 
    this.subtitle,
    this.customSubtitle,
  });

  final int step;
  final bool stepWithTitle;
  final String? stepTitle;
  final String title;
  final String? subtitle;
  final Widget? customSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            ImageAssetConstant.logoImageTextImage,
            width: 85,
            filterQuality: FilterQuality.low,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.primaryColor
                    ),
                  ),
                  const SizedBox(width: 8),
                  if(stepWithTitle) ...[
                    DefaultText(
                      text: stepTitle!,
                      type: DefaultTextType.text3XS,
                      weight: DefaultTextWeight.regular,
                      color: AppColors.black700,
                    ),
                  ] else ... [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: step > 1
                        ? AppColors.primaryColor
                        : AppColors.neutral400 
                      ),
                    ),
                  ]
                ],
              ),
              const SizedBox(height: 8),
              DefaultText(
                text: title,
                type: DefaultTextType.text3XL,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              ),
              if(subtitle != null && subtitle != '') ...[
                const SizedBox(height: 12),
                DefaultText(
                  text: subtitle!,
                  type: DefaultTextType.textSM,
                  color: AppColors.black700,
                ),
              ],
              if(customSubtitle != null) ...[
                const SizedBox(height: 12),
                customSubtitle!
              ]
            ],
          ),
        ),
      ],
    );
  }
}