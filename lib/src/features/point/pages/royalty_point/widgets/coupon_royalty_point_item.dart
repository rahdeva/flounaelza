import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/loaders/image_load.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class CouponRoyaltyPointItem extends StatelessWidget {
  const CouponRoyaltyPointItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: (){
        NavigationUtil.push(AppRoutes.COUPON_DETAIL);
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
        child: Row(
          children: [
            const SizedBox(
              height: 120,
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
                padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultText(
                      text: 'Buku 20% Off',
                      type: DefaultTextType.textMD,
                      color: AppColors.black900,
                      weight: DefaultTextWeight.semiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(left: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle
                          ),
                        ),
                        const SizedBox(width: 8),
                        const DefaultText(
                          text: '90 Pcs Tersedia',
                          type: DefaultTextType.textSM,
                          color: AppColors.black700,
                          weight: DefaultTextWeight.regular,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssetConstant.starIcon,
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primaryColor, 
                            BlendMode.srcIn
                          ),
                        ),
                        const SizedBox(width: 4),
                        const DefaultText(
                          text: '30 Point',
                          type: DefaultTextType.textSM,
                          color: AppColors.primaryColor,
                          weight: DefaultTextWeight.semiBold,
                        ),
                      ],
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