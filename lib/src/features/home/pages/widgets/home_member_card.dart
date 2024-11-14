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

class HomeMemberCard extends StatelessWidget {
  const HomeMemberCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: (){
        NavigationUtil.push(AppRoutes.MEMBER_MENU);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageAssetConstant.bgCardImage,
            )
          )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImageAssetConstant.logoWhiteImage,
                  width: 40,
                  height: 40,
                  filterQuality: FilterQuality.high,
                ),
                DefaultText(
                  text: AppLocale.activeMember.getString(context),
                  type: DefaultTextType.textSM,
                  color: AppColors.white,
                  weight: DefaultTextWeight.medium,
                ),
              ],
            ),
            const SizedBox(height: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  text: "Julian Dennis",
                  type: DefaultTextType.textLG,
                  color: AppColors.white,
                  weight: DefaultTextWeight.semiBold,
                ),
                const SizedBox(height: 12),
                const Divider(
                  color: AppColors.white,
                  height: 1,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssetConstant.polygonIcon,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white, 
                            BlendMode.srcIn
                          ),
                        ),
                        const SizedBox(width: 8),
                        DefaultText(
                          text: "${AppLocale.member.getString(context)} C",
                          type: DefaultTextType.textSM,
                          color: AppColors.white,
                          weight: DefaultTextWeight.medium,
                        ),
                      ],
                    ),
                    DefaultText(
                      text: "0 ${AppLocale.nadhiPoint.getString(context)}",
                      type: DefaultTextType.textSM,
                      color: AppColors.white,
                      weight: DefaultTextWeight.bold,
                    ),
                  ],
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}