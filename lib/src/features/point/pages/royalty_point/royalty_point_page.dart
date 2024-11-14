import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/point/pages/royalty_point/widgets/coupon_royalty_point_list_builder.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class RoyaltyPointPage extends StatefulWidget {
  const RoyaltyPointPage({super.key});

  @override
  State<RoyaltyPointPage> createState() => _RoyaltyPointPageState();
}

class _RoyaltyPointPageState extends State<RoyaltyPointPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackButtonWidget(),
            Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: DefaultText(
                text: AppLocale.royaltyPoint.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              )
            ),
            Container(
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
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssetConstant.starIcon,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white, 
                          BlendMode.srcIn
                        ),
                      ),
                      const SizedBox(width: 8),
                      DefaultText(
                        text: AppLocale.yourPoint.getString(context),
                        type: DefaultTextType.textBase,
                        color: AppColors.white,
                        weight: DefaultTextWeight.semiBold,
                      ),
                    ],
                  ),
                  DefaultText(
                    text: '103 ${AppLocale.points.getString(context)}',
                    type: DefaultTextType.textBase,
                    color: AppColors.white,
                    weight: DefaultTextWeight.semiBold,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const ListCouponRoyaltyPointBuilder(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}