import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/loaders/image_load.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class PromoRecomendationItem extends StatelessWidget {
  const PromoRecomendationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: (){
        NavigationUtil.push(AppRoutes.PROMO_DETAIL);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.neutral200 
          ),
        ),
        child: const Column(
          children: [
            AspectRatio(
              aspectRatio: 800 / 451,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: ImageLoad(
                  imageUrl: 'https://plus.unsplash.com/premium_photo-1685287730155-67d1c3740c7b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholderShape: PlaceholderShape.rectangle,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'Penawaran Terbatas! Lengkapi Stationery Kamu Sekarang ',
                    type: DefaultTextType.textBase,
                    color: AppColors.black900,
                    weight: DefaultTextWeight.medium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  DefaultText(
                    text: '11 - 23 October 2024',
                    type: DefaultTextType.textSM,
                    color: AppColors.primaryColor,
                    weight: DefaultTextWeight.semiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}