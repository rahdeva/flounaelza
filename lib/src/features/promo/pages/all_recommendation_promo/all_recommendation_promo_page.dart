import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/promo/pages/all_recommendation_promo/widgets/all_promo_recommendation_list_builder.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class AllRecommendationPromoPage extends StatefulWidget {
  const AllRecommendationPromoPage({super.key});

  @override
  State<AllRecommendationPromoPage> createState() => _AllRecommendationPromoPageState();
}

class _AllRecommendationPromoPageState extends State<AllRecommendationPromoPage> {
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
                text: AppLocale.allRecomendationPromo.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              )
            ),
            const SizedBox(height: 8),
            const ListAllPromoRecommendationBuilder(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}