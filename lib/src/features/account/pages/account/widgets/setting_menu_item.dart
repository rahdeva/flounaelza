import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class SettingMenuItem extends StatelessWidget {
  const SettingMenuItem({
    super.key, 
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap, 
  });

  final String icon;
  final String title;
  final String subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        AppColors.neutral800, 
                        BlendMode.srcIn
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: title,
                          color: AppColors.black900,
                          type: DefaultTextType.textBase,
                          weight: DefaultTextWeight.bold,
                        ),
                        DefaultText(
                          text: subTitle,
                          color: AppColors.neutral500,
                          type: DefaultTextType.textSM,
                          weight: DefaultTextWeight.medium,
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.neutral700,
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
