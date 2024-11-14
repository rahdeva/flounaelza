import 'package:flutter/material.dart';
import 'package:flounaelza/src/features/coupon/pages/my_coupon/widgets/my_coupon_item.dart';

class ListMyCouponBuilder extends StatelessWidget {
  const ListMyCouponBuilder({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const MyCouponItem();
      },
    );
  }
}
