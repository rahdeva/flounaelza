import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/features/member/pages/member_menu/member_menu_page.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class TierMemberButtons extends StatelessWidget {
  const TierMemberButtons({
    super.key,
    required this.onTierSelected,
    required this.selectedTier,
  });

  final Function(UserTierMember) onTierSelected;
  final UserTierMember selectedTier;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTierButton(
          context, 
          UserTierMember.c, 
          AppColors.green, 
          "C"
        ),
        Expanded(
          child: Container(
            height: 1, 
            color: AppColors.black900
          ),
        ),
        _buildTierButton(
          context, 
          UserTierMember.b, 
          AppColors.infoColor, 
          "B"
        ),
        Expanded(
          child: Container(
            height: 1, 
            color: AppColors.black900
          ),
        ),
        _buildTierButton(
          context, 
          UserTierMember.a, 
          AppColors.warningColor, 
          "A"
        ),
        Expanded(
          child: Container(
            height: 1, 
            color: AppColors.black900
          ),
        ),
        _buildTierButton(
          context, 
          UserTierMember.s, 
          AppColors.primaryPressedColor, 
          "S"
        ),
      ],
    );
  }

  Widget _buildTierButton(
    BuildContext context, 
    UserTierMember tier, 
    Color color, 
    String label
  ) {
    final bool isSelected = tier == selectedTier;

    return InkWell(
      onTap: () => onTierSelected(tier),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
          ? Border.all(
              color: AppColors.primaryColor, 
              width: 2
            )
          : null,
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: DefaultText(
            text: label,
            type: DefaultTextType.textBase,
            color: AppColors.white,
            weight: DefaultTextWeight.bold,
          ),
        ),
      ),
    );
  }
}
