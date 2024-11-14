import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class CuoponHistoryItem extends StatelessWidget {
  const CuoponHistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: (){},
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.neutral200 
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: 'MT-26346327',
                type: DefaultTextType.textMD,
                color: AppColors.black900,
                weight: DefaultTextWeight.semiBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  DefaultText(
                    text: 'Oct 12, 2024 15:52',
                    type: DefaultTextType.textSM,
                    color: AppColors.black700,
                    weight: DefaultTextWeight.regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  DefaultText(
                    text: 'BERHASIL',
                    type: DefaultTextType.textSM,
                    color: AppColors.successColor,
                    weight: DefaultTextWeight.semiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 4),
              DefaultText(
                text: '1 Kupon Diskon Buku 20% Off',
                type: DefaultTextType.textSM,
                color: AppColors.black700,
                weight: DefaultTextWeight.regular,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}