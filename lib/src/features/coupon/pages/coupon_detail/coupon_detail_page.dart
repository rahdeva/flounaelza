import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/coupon/pages/coupon_detail/widgets/redeem_point_confirmation_bottom_sheet.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/buttons/secondary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class CouponDetailPage extends StatefulWidget {
  const CouponDetailPage({super.key});

  @override
  State<CouponDetailPage> createState() => _CouponDetailPageState();
}

class _CouponDetailPageState extends State<CouponDetailPage> {
  bool isLoading = false;

  final List<String> termsAndConditions = [
    "Promo hanya berlaku untuk produk alat tulis yang berlabel promo. Produk lain mungkin tidak termasuk dalam penawaran ini.",
    "Setiap pelanggan hanya dapat menggunakan satu kode promo per transaksi.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackButtonWidget(),
            Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: DefaultText(
                text: AppLocale.cuoponDetail.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              )
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://plus.unsplash.com/premium_photo-1685287730155-67d1c3740c7b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  DefaultText(
                    text: AppLocale.couponDesc.getString(context),
                    type: DefaultTextType.textMD,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DefaultText(
                        text: AppLocale.couponRedemptionPeriod.getString(context),
                        type: DefaultTextType.textSM,
                        weight: DefaultTextWeight.regular,
                        color: AppColors.black900,
                      ),
                      const DefaultText(
                        text: '11 - 23 October 2024',
                        type: DefaultTextType.textSM,
                        weight: DefaultTextWeight.semiBold,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const DefaultText(
                    text: 'Persiapkan tahun ajaran baru Anda dengan penuh gaya dan hemat! Gunakan kupon ini untuk mendapatkan 30% diskon khusus pada semua perlengkapan sekolah. Dari buku tulis, pulpen, hingga tas sekolah, semua tersedia dengan harga spesial hanya untuk Anda.',
                    type: DefaultTextType.textSM,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.black700,
                  ),
                  const SizedBox(height: 24),
                  DefaultText(
                    text: AppLocale.termCondition.getString(context),
                    type: DefaultTextType.textMD,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: termsAndConditions.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: AppColors.neutral500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: DefaultText(
                              text: termsAndConditions[index],
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
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        shadowColor: AppColors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const DefaultText(
                  text: '130',
                  type: DefaultTextType.textBase,
                  weight: DefaultTextWeight.semiBold,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(width: 8),
                DefaultText(
                  text: AppLocale.royaltyPoint.getString(context),
                  type: DefaultTextType.textBase,
                  weight: DefaultTextWeight.regular,
                  color: AppColors.black700,
                ),
              ],
            ),
            SecondaryButton(
              label: AppLocale.redeemPoints.getString(context),
              onPressed: (){
                openRedeemPointConfirmationBottomSheet(context);
              },
            )
          ],
        ),
      ),
    );
  }
}