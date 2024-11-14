import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class PromoDetailPage extends StatefulWidget {
  const PromoDetailPage({super.key});

  @override
  State<PromoDetailPage> createState() => _PromoDetailPageState();
}

class _PromoDetailPageState extends State<PromoDetailPage> {
  bool isLoading = false;

  final List<String> promoPoints = [
    "Dapatkan 1 poin untuk setiap Rp10.000 yang dibelanjakan.",
    "Daftar sebagai anggota di toko kami melalui website atau aplikasi untuk mengakses promo eksklusif ini.",
    "Promo ini berlaku untuk semua produk alat tulis yang tertera dalam katalog promo kami.",
  ];
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
                text: AppLocale.promoDetail.getString(context),
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
                  const SizedBox(height: 16),
                  const DefaultText(
                    text: 'Penawaran Terbatas! Lengkapi Stationery Kamu Sekarang',
                    type: DefaultTextType.textMD,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssetConstant.calendarIcon,
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor, 
                          BlendMode.srcIn
                        ),
                      ),
                      const SizedBox(width: 8),
                      const DefaultText(
                        text: '11 - 23 October 2024',
                        type: DefaultTextType.textSM,
                        weight: DefaultTextWeight.semiBold,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  DefaultText(
                    text: AppLocale.promoDetailMechanism.getString(context),
                    type: DefaultTextType.textMD,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: promoPoints.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: '${index + 1}. ',
                            type: DefaultTextType.textSM,
                            weight: DefaultTextWeight.regular,
                            color: AppColors.black700,
                          ),
                          Expanded(
                            child: DefaultText(
                              text: promoPoints[index],
                              type: DefaultTextType.textSM,
                              weight: DefaultTextWeight.regular,
                              color: AppColors.black700,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  DefaultText(
                    text: AppLocale.promoDetailTermCondition.getString(context),
                    type: DefaultTextType.textMD,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: promoPoints.length,
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
                              text: promoPoints[index],
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
    );
  }
}