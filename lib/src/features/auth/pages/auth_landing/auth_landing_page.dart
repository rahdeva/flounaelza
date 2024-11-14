import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/buttons/secondary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class AuthLandingPage extends StatelessWidget {
  const AuthLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SvgPicture.asset(
            ImageAssetConstant.onboardingOrnamentImage,
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                DefaultText(
                  text: AppLocale.authWelcomeToNadhiMart.getString(context),
                  type: DefaultTextType.text4XL,
                  color: AppColors.black900,
                  textAlign: TextAlign.start,
                  weight: DefaultTextWeight.bold,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  isExpanded: true,
                  label: AppLocale.signUp.getString(context),
                  variant: PrimaryButtonVariant.primary,
                  onPressed: (){
                    NavigationUtil.push(AppRoutes.REGISTER);
                  },
                ),
                const SizedBox(height: 24),
                SecondaryButton(
                  isExpanded: true,
                  label: AppLocale.signIn.getString(context),
                  variant: SecondaryButtonVariant.regular,
                  onPressed: (){
                    NavigationUtil.push(AppRoutes.LOGIN);
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}