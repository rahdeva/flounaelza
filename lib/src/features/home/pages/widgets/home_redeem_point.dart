import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class HomeRedeemPoint extends StatelessWidget {
  const HomeRedeemPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: (){
        NavigationUtil.push(AppRoutes.ROYALTY_POINT);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: AppLocale.redeemPoints.getString(context),
                  type: DefaultTextType.textSM,
                  color: AppColors.white,
                  weight: DefaultTextWeight.medium,
                ),
                const SizedBox(height: 4),
                DefaultText(
                  text: AppLocale.homeRedeemPointsPrompt.getString(context),
                  type: DefaultTextType.textSM,
                  color: AppColors.white,
                  weight: DefaultTextWeight.medium,
                ),
              ],
            ),
            SvgPicture.asset(
              SvgAssetConstant.ticketIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.white, 
                BlendMode.srcIn
              ),
            ),
          ],
        ),
      ),
    );
  }
}