import 'package:flutter/material.dart';
import 'package:flounaelza/src/features/history/pages/widgets/cuopon_history_item.dart';

class ListCuoponHistoryBuilder extends StatelessWidget {
  const ListCuoponHistoryBuilder({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CuoponHistoryItem();
      },
    );
  }
}
