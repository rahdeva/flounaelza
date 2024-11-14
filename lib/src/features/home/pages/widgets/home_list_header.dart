import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/tertiary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class HomeListHeader extends StatelessWidget {
  const HomeListHeader({
    super.key, 
    required this.title, 
    required this.seeAllOnPressed,
  });

  final String title;
  final Function() seeAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
            text: title,
            type: DefaultTextType.textMD,
            color: AppColors.black900,
            weight: DefaultTextWeight.semiBold,
          ),
          TertiaryButton(
            label: AppLocale.seeAll.getString(context),
            variant: TertiaryButtonVariant.regular,
            textType: DefaultTextType.textSM,
            textWeight: DefaultTextWeight.semiBold,
            onPressed: seeAllOnPressed,
          ),
        ],
      ),
    );
  }
}