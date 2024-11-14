import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/buttons/secondary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class SuccessRedeemPointPage extends StatefulWidget {
  const SuccessRedeemPointPage({super.key});

  @override
  State<SuccessRedeemPointPage> createState() => _SuccessRedeemPointPageState();
}

class _SuccessRedeemPointPageState extends State<SuccessRedeemPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgAssetConstant.successIcon,
              ),
              const SizedBox(height: 16),
              DefaultText(
                text: AppLocale.pointSuccessRedeem.getString(context),
                type: DefaultTextType.textXL,
                color: AppColors.black900,
                weight: DefaultTextWeight.semiBold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  SvgPicture.asset(
                    SvgAssetConstant.ticketIcon,
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      AppColors.neutral800, 
                      BlendMode.srcIn
                    ),
                  ),
                  const SizedBox(width: 8),
                  const DefaultText(
                    text: 'Diskon Buku 20% off',
                    type: DefaultTextType.textBase,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.black900,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssetConstant.starIcon,
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor, 
                          BlendMode.srcIn
                        ),
                      ),
                      const SizedBox(width: 8),
                      DefaultText(
                        text: AppLocale.pointsToUse.getString(context),
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                    ],
                  ),
                  DefaultText(
                    text: '-30 ${AppLocale.points.getString(context)}',
                    type: DefaultTextType.textBase,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SecondaryButton(
                isExpanded: true,
                label: AppLocale.myCoupon.getString(context),
                onPressed: (){
                  NavigationUtil.go(AppRoutes.MY_COUPON);
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                isExpanded: true,
                label: AppLocale.done.getString(context),
                onPressed: (){
                  NavigationUtil.go(AppRoutes.HOME);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}