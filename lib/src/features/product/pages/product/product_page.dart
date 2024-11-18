import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/menus/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.backgroundColor,
        title: DefaultText(
          text: AppLocale.product.getString(context),
          type: DefaultTextType.text3XL,
          color: AppColors.black900,
          weight: DefaultTextWeight.bold,
        ),
        actions: [
          Pressable(
            onPressed: (){},
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
          ],
        ),
      ),
    );
  }
}