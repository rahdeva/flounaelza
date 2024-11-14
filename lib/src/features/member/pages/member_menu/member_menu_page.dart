import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/member/pages/member_menu/widgets/tier_member_buttons.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

enum UserTierMember { c, b, a, s }

class MemberMenuPage extends StatefulWidget {
  const MemberMenuPage({super.key});

  @override
  State<MemberMenuPage> createState() => _MemberMenuPageState();
}

class _MemberMenuPageState extends State<MemberMenuPage> {
  bool isLoading = false;

  UserTierMember userTierMember = UserTierMember.c;

  final Map<UserTierMember, Map<String, dynamic>> memberData = {
    UserTierMember.c: {
      'title': "C Tier Member",
      'description':
          "Tingkatkan terus transaksimu sebelum 01 Januari 2025 untuk mendapatkan hadiah menarik lainnya",
      'benefits': [
        {
          'title': "Poin Loyalti",
          'subtitle': "Dapatkan poin loyalti setiap belanja",
        },
      ],
      'termConditions': [
        "Berlaku hingga 01 Januari 2025",
        "Pada tanggal tersebut Nadi point akan meninjau ulang akumulasi transaksi kamu untuk menentukan level member. Tanggal akan direset otomatis saat kamu naik atau turun level.",
      ],
    },
    UserTierMember.b: {
      'title': "B Tier Member",
      'description':
          "Tingkatkan terus transaksimu sebelum 01 Januari 2025 untuk mendapatkan hadiah menarik lainnya",
      'benefits': [
        {
          'title': "Promosi Seasonal",
          'subtitle': "Diskon rutin selama liburan dan acara khusus",
        },
        {
          'title': "Poin Loyalti",
          'subtitle': "Dapatkan poin loyalti setiap belanja",
        },
      ],
      'termConditions': [
        "Berlaku hingga 01 Januari 2025",
        "Pada tanggal tersebut Nadi point akan meninjau ulang akumulasi transaksi kamu untuk menentukan level member. Tanggal akan direset otomatis saat kamu naik atau turun level.",
      ],
    },
    UserTierMember.a: {
      'title': "A Tier Member",
      'description':
          "Tingkatkan terus transaksimu sebelum 01 Januari 2025 untuk mendapatkan hadiah menarik lainnya",
      'benefits': [
        {
          'title': "Akses Pra-Peluncuran Eksklusif",
          'subtitle':
              "Dapatkan akses awal ke perlengkapan alat tulis baru dan edisi terbatas.",
        },
        {
          'title': "Promosi Seasonal",
          'subtitle': "Diskon rutin selama liburan dan acara khusus",
        },
        {
          'title': "Poin Loyalti",
          'subtitle': "Dapatkan poin loyalti setiap belanja",
        },
      ],
      'termConditions': [
        "Berlaku hingga 01 Januari 2025",
        "Pada tanggal tersebut Nadi point akan meninjau ulang akumulasi transaksi kamu untuk menentukan level member. Tanggal akan direset otomatis saat kamu naik atau turun level.",
      ],
    },
    UserTierMember.s: {
      'title': "S Tier Member",
      'description':
          "Tingkatkan terus transaksimu sebelum 01 Januari 2025 untuk mendapatkan hadiah menarik lainnya",
      'benefits': [
        {
          'title': "Super Diskon Eksklusif",
          'subtitle':
              "Diskon persentase lebih tinggi hingga 80%. Eksklusif untuk anggota level S.",
        },
        {
          'title': "Akses Pra-Peluncuran Eksklusif",
          'subtitle':
              "Dapatkan akses awal ke perlengkapan alat tulis baru dan edisi terbatas.",
        },
        {
          'title': "Promosi Seasonal",
          'subtitle': "Diskon rutin selama liburan dan acara khusus",
        },
        {
          'title': "Poin Loyalti",
          'subtitle': "Dapatkan poin loyalti setiap belanja",
        },
      ],
      'termConditions': [
        "Berlaku hingga 01 Januari 2025",
        "Pada tanggal tersebut Nadi point akan meninjau ulang akumulasi transaksi kamu untuk menentukan level member. Tanggal akan direset otomatis saat kamu naik atau turun level.",
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = memberData[userTierMember]!;

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
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButtonWidget(),
            Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: DefaultText(
                text: AppLocale.member.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              )
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.neutral200 
                ),
                boxShadow: AppColors.searchShadow
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 14,
                        child: Icon(
                          Icons.star_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      DefaultText(
                        text: data['title'],
                        type: DefaultTextType.textLG,
                        weight: DefaultTextWeight.semiBold,
                        color: AppColors.black900,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DefaultText(
                    text: data['description'],
                    type: DefaultTextType.text3XS,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_border_rounded,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 8),
                              DefaultText(
                                text: AppLocale.memberAccumulateTransaction.getString(context),
                                type: DefaultTextType.text3XS,
                                weight: DefaultTextWeight.regular,
                                color: AppColors.black900,
                              ),
                            ],
                          ),
                          const DefaultText(
                            text: '0/0/2.000.000',
                            type: DefaultTextType.text3XS,
                            weight: DefaultTextWeight.semiBold,
                            color: AppColors.black900,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_border_rounded,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 8),
                              DefaultText(
                                text: AppLocale.memberAccumulateTransaction.getString(context),
                                type: DefaultTextType.text3XS,
                                weight: DefaultTextWeight.regular,
                                color: AppColors.black900,
                              ),
                            ],
                          ),
                          const DefaultText(
                            text: '0/15',
                            type: DefaultTextType.text3XS,
                            weight: DefaultTextWeight.semiBold,
                            color: AppColors.black900,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const DefaultText(
                    text: 'Selamat menjadi anggota loyal kami, dapatkan paket diskon eksklusif sebelum 01 Januari 2025.',
                    type: DefaultTextType.text3XS,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.black900,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TierMemberButtons(
                selectedTier: userTierMember,
                onTierSelected: (UserTierMember tier) {
                  setState(() {
                    userTierMember = tier;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    SvgAssetConstant.ticketIcon,
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, 
                      BlendMode.srcIn
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: '${AppLocale.benefit.getString(context)} ${data['title']}',
                        type: DefaultTextType.textBase,
                        color: AppColors.black900,
                        weight: DefaultTextWeight.semiBold,
                      ),
                      const SizedBox(height: 4),
                      DefaultText(
                        text: AppLocale.memberBenefitOnThisMember.getString(context),
                        type: DefaultTextType.text3XS,
                        color: AppColors.black900,
                        weight: DefaultTextWeight.regular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ...data['benefits'].map<Widget>((benefit) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: benefit['title'],
                      type: DefaultTextType.textBase,
                      color: AppColors.white,
                      weight: DefaultTextWeight.semiBold,
                    ),
                    const SizedBox(height: 4),
                    DefaultText(
                      text: benefit['subtitle'],
                      type: DefaultTextType.text3XS,
                      color: AppColors.white,
                      weight: DefaultTextWeight.regular,
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.neutral200 
                ),
                boxShadow: AppColors.searchShadow
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    SvgAssetConstant.infoIcon,
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, 
                      BlendMode.srcIn
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: AppLocale.termCondition.getString(context),
                          type: DefaultTextType.textSM,
                          weight: DefaultTextWeight.semiBold,
                          color: AppColors.black900,
                        ),
                        const SizedBox(height: 4),
                        ...data['termConditions'].map<Widget>((item) {
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
                                  text: item,
                                  type: DefaultTextType.textSM,
                                  weight: DefaultTextWeight.regular,
                                  color: AppColors.black700,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
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
