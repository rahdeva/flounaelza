import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

enum CouponStatus { success, failed, warning }

class StatusRedeemCouponPage extends StatefulWidget {
  const StatusRedeemCouponPage({super.key});

  @override
  State<StatusRedeemCouponPage> createState() => _StatusRedeemCouponPageState();
}

class _StatusRedeemCouponPageState extends State<StatusRedeemCouponPage> {
  CouponStatus status = CouponStatus.success;

  String get title {
    switch (status) {
      case CouponStatus.success:
        return AppLocale.couponSuccessRedeemTitle.getString(context);
      case CouponStatus.failed:
        return AppLocale.couponErrorRedeemTitle.getString(context);
      case CouponStatus.warning:
        return AppLocale.couponWarningRedeemTitle.getString(context);
    }
  }

  String get subtitle {
    switch (status) {
      case CouponStatus.success:
        return AppLocale.couponSuccessRedeemSubtitle.getString(context);
      case CouponStatus.failed:
        return AppLocale.couponErrorRedeemSubtitle.getString(context);
      case CouponStatus.warning:
        return AppLocale.couponWarningRedeemSubtitle.getString(context);
    }
  }

  void buttonOnPressed() {
    switch (status) {
      case CouponStatus.success:
        NavigationUtil.popUntil(AppRoutes.MY_COUPON);
        break; 
      case CouponStatus.failed:
        NavigationUtil.popUntil(AppRoutes.MY_COUPON);
        break;
      case CouponStatus.warning:
        NavigationUtil.popUntil(AppRoutes.MY_COUPON);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String icon;

    switch (status) {
      case CouponStatus.success:
        icon = SvgAssetConstant.successIcon;
        break;
      case CouponStatus.failed:
        icon = SvgAssetConstant.errorIcon;
        break;
      case CouponStatus.warning:
        icon = SvgAssetConstant.warningIcon;
        break;
    }

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    DefaultText(
                      text: title,
                      type: DefaultTextType.text2XL,
                      color: AppColors.black900,
                      weight: DefaultTextWeight.semiBold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    DefaultText(
                      text: subtitle,
                      type: DefaultTextType.textSM,
                      color: AppColors.black700,
                      weight: DefaultTextWeight.regular,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                isExpanded: true,
                label: AppLocale.done.getString(context),
                onPressed: buttonOnPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
