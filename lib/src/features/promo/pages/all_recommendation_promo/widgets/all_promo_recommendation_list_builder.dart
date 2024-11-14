import 'package:flutter/material.dart';
import 'package:flounaelza/src/features/promo/pages/all_recommendation_promo/widgets/all_promo_recomendation_item.dart';

class ListAllPromoRecommendationBuilder extends StatelessWidget {
  const ListAllPromoRecommendationBuilder({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const AllPromoRecomendationItem();
      },
    );
  }
}
