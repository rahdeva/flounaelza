import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/buttons/secondary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class RedeemPointConfirmationBottomSheet extends StatefulWidget {
  const RedeemPointConfirmationBottomSheet({super.key});

  @override
  State<RedeemPointConfirmationBottomSheet> createState() => _RedeemPointConfirmationBottomSheetState();
}

class _RedeemPointConfirmationBottomSheetState extends State<RedeemPointConfirmationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
            child: Row(
              children: [
                DefaultText(
                  text: AppLocale.redeemPointConfirmation.getString(context),
                  type: DefaultTextType.textMD,
                  weight: DefaultTextWeight.bold,
                  color: AppColors.black900,
                ),
                const Spacer(),
                Pressable(
                  child: SvgPicture.asset(
                    SvgAssetConstant.closeCircleIcon,
                    height: 24.0,
                    width: 24.0,
                    colorFilter: const ColorFilter.mode(
                      AppColors.neutral700,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.neutral300,
            height: 1,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const DefaultText(
                    text: 'Diskon Buku 20%off',
                    type: DefaultTextType.textBase,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      DefaultText(
                        text: '${AppLocale.remainingCoupons.getString(context)} : ',
                        type: DefaultTextType.textSM,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black700,
                      ),
                      DefaultText(
                        text: '90 ${AppLocale.unit.getString(context)}',
                        type: DefaultTextType.textSM,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  DefaultText(
                    text: '30 ${AppLocale.points.getString(context)}',
                    type: DefaultTextType.textSM,
                    weight: DefaultTextWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: AppColors.neutral300,
                    height: 1,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: AppLocale.yourPoints.getString(context),
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                      DefaultText(
                        text: '103 ${AppLocale.points.getString(context)}',
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: AppLocale.pointsUsed.getString(context),
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                      DefaultText(
                        text: '-30 ${AppLocale.points.getString(context)}',
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: AppLocale.remainingPoints.getString(context),
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                      DefaultText(
                        text: '73 ${AppLocale.points.getString(context)}',
                        type: DefaultTextType.textBase,
                        weight: DefaultTextWeight.semiBold,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: AppColors.neutral300,
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SecondaryButton(
                    label: AppLocale.cancel.getString(context),
                    onPressed: (){
                      NavigationUtil.pop();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    label: AppLocale.confirmation.getString(context),
                    onPressed: (){
                      NavigationUtil.push(AppRoutes.SUCCESS_REDEEM_POINT);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void openRedeemPointConfirmationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const RedeemPointConfirmationBottomSheet();
    },
  );
}