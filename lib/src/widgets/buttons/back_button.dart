import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: () => NavigationUtil.pop(),
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        color: Colors.transparent,
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColors.neutral800,
            ),
            const SizedBox(width: 8),
            DefaultText(
              text: AppLocale.back.getString(context),
              type: DefaultTextType.textBase,
              weight: DefaultTextWeight.medium,
              color: AppColors.neutral800,
            ),
          ],
        ),
      ),
    );
  }
}
