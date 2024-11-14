import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/loaders/image_load.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class AllMonthlyPromoItem extends StatelessWidget {
  const AllMonthlyPromoItem({
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
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.neutral200 
          ),
        ),
        child: const Row(
          children: [
            SizedBox(
              height: 150,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: ImageLoad(
                  imageUrl: 'https://plus.unsplash.com/premium_photo-1685287730155-67d1c3740c7b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholderShape: PlaceholderShape.rectangle,
                )
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Promo Buku Tulis Super Hemat!',
                      type: DefaultTextType.textBase,
                      color: AppColors.black900,
                      weight: DefaultTextWeight.semiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    DefaultText(
                      text: 'Dapatkan Buku Tulis Berkualitas dengan Harga Terjangkau untuk Tahun Ajaran Baru',
                      type: DefaultTextType.text3XS,
                      color: AppColors.black700,
                      weight: DefaultTextWeight.regular,
                      maxLines: 3,
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
            )
          ],
        ),
      ),
    );
  }
}