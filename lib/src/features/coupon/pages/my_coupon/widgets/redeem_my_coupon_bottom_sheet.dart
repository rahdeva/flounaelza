import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/utils/brightness_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class RedeemMyCouponBottomSheet extends StatefulWidget {
  const RedeemMyCouponBottomSheet({super.key});

  @override
  State<RedeemMyCouponBottomSheet> createState() => _RedeemMyCouponBottomSheetState();
}

class _RedeemMyCouponBottomSheetState extends State<RedeemMyCouponBottomSheet> {
  void _increaseBrightness() async {
    try {
      await BrightnessUtil.setBrightness(1.0);
    } catch (e) {
      debugPrint("Permission denied or error: $e");
    }
  }

  void _resetBrightness() async {
    try {
      await BrightnessUtil.setBrightness(0.3);
    } catch (e) {
      debugPrint("Permission denied or error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _increaseBrightness();
  }

  @override
  void dispose() {
    _resetBrightness();
    super.dispose();
  }

  final List<String> validProduct = [
    "Buku A1",
    "Buku A2",
    "etc",
  ];

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
                  text: AppLocale.useCoupon.getString(context),
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
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.neutral200 
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.network(
                      'https://plus.unsplash.com/premium_photo-1685287730155-67d1c3740c7b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Expanded(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        SvgAssetConstant.backpackIcon,
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          AppColors.neutral800, 
                          BlendMode.srcIn
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DefaultText(
                          text: AppLocale.couponRedeemOnEveryStore.getString(context),
                          type: DefaultTextType.textSM,
                          weight: DefaultTextWeight.regular,
                          color: AppColors.black900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        SvgAssetConstant.infoIcon,
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          AppColors.neutral800, 
                          BlendMode.srcIn
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            DefaultText(
                              text: AppLocale.couponValidFor.getString(context),
                              type: DefaultTextType.textSM,
                              weight: DefaultTextWeight.regular,
                              color: AppColors.black900,
                            ),
                            const SizedBox(height: 4),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: validProduct.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: AppColors.black900,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: DefaultText(
                                        text: validProduct[index],
                                        type: DefaultTextType.textSM,
                                        weight: DefaultTextWeight.regular,
                                        color: AppColors.black700,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.neutral300,
            height: 1,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.neutral200
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImageAssetConstant.barcodePlaceholderImage,
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      SvgAssetConstant.infoIcon,
                      height: 20,
                      width: 20,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        AppColors.neutral800, 
                        BlendMode.srcIn
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DefaultText(
                        text: AppLocale.couponShowBarcodeToCashier.getString(context),
                        type: DefaultTextType.textSM,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void openRedeemMyCouponBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: const RedeemMyCouponBottomSheet(),
      );
    },
  );
}