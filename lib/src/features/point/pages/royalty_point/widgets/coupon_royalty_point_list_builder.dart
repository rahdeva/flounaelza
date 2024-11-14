import 'package:flutter/material.dart';
import 'package:flounaelza/src/features/point/pages/royalty_point/widgets/coupon_royalty_point_item.dart';

class ListCouponRoyaltyPointBuilder extends StatelessWidget {
  const ListCouponRoyaltyPointBuilder({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CouponRoyaltyPointItem();
      },
    );
  }
}
