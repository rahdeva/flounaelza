import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/features/coupon/pages/my_coupon/widgets/redeem_my_coupon_bottom_sheet.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/loaders/image_load.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class MyCouponItem extends StatelessWidget {
  const MyCouponItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: (){
        openRedeemMyCouponBottomSheet(context);
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
                padding: EdgeInsets.fromLTRB(24, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Buku 20% Off',
                      type: DefaultTextType.textMD,
                      color: AppColors.black900,
                      weight: DefaultTextWeight.semiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    DefaultText(
                      text: 'Berlaku Hingga 23 October 2024',
                      type: DefaultTextType.textSM,
                      color: AppColors.black700,
                      weight: DefaultTextWeight.regular,
                      maxLines: 3,
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