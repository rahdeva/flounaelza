import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/home/pages/widgets/home_list_header.dart';
import 'package:flounaelza/src/features/home/pages/widgets/home_redeem_point.dart';
import 'package:flounaelza/src/features/home/pages/widgets/monthly_promo_list_builder.dart';
import 'package:flounaelza/src/features/home/pages/widgets/promo_recommendation_list_builder.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/menus/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.backgroundColor,
        title: DefaultText(
          text: AppLocale.homeMemberHall.getString(context),
          type: DefaultTextType.text3XL,
          color: AppColors.black900,
          weight: DefaultTextWeight.bold,
        ),
        actions: [
          Pressable(
            onPressed: (){
              NavigationUtil.push(AppRoutes.NOTIFICATION);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                SvgAssetConstant.notifIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.black700,
                  BlendMode.srcIn
                ),
              ),
            ),
          )
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: false,
      bottomNavigationBar: const BottomNavBarWidget(currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const HomeRedeemPoint(),
            const SizedBox(height: 24),
            HomeListHeader(
              title: AppLocale.homePromoRecommendation.getString(context),
              seeAllOnPressed: (){
                NavigationUtil.push(AppRoutes.ALL_RECOMMENDATION_PROMO);
              },
            ),
            const SizedBox(height: 16),
            const ListPromoRecommendationBuilder(),
            const SizedBox(height: 8),
            HomeListHeader(
              title: AppLocale.homeMonthlyPromo.getString(context),
              seeAllOnPressed: (){
                NavigationUtil.push(AppRoutes.ALL_MONTHLY_PROMO);
              },
            ),
            const SizedBox(height: 16),
            const ListMonthlyPromoBuilder(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}