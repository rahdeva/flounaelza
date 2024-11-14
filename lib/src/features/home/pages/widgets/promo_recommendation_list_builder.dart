import 'package:flutter/material.dart';
import 'package:flounaelza/src/features/home/pages/widgets/promo_recomendation_item.dart';

class ListPromoRecommendationBuilder extends StatelessWidget {
  const ListPromoRecommendationBuilder({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const PromoRecomendationItem();
      },
    );
  }
}
