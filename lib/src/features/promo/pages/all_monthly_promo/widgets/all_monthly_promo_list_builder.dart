import 'package:flutter/material.dart';
import 'package:flounaelza/src/features/promo/pages/all_monthly_promo/widgets/all_monthly_promo_item.dart';

class ListAllMonthlyPromoBuilder extends StatelessWidget {
  const ListAllMonthlyPromoBuilder({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const AllMonthlyPromoItem();
      },
    );
  }
}