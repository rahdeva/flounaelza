import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class DeleteAccountSuccessPage extends StatefulWidget {
  const DeleteAccountSuccessPage({super.key});

  @override
  State<DeleteAccountSuccessPage> createState() => _DeleteAccountSuccessPageState();
}

class _DeleteAccountSuccessPageState extends State<DeleteAccountSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Image.asset(
                    ImageAssetConstant.deleteAccountImage,
                  ),
                  const SizedBox(height: 24),
                  DefaultText(
                    text: AppLocale.accountDeleteAccountSuccessHeader.getString(context),
                    type: DefaultTextType.textMD,
                    color: AppColors.black900,
                    weight: DefaultTextWeight.semiBold,
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 8),
                  DefaultText(
                    text: AppLocale.accountDeleteAccountSuccessSubheader.getString(context),
                    type: DefaultTextType.textSM,
                    color: AppColors.black700,
                    weight: DefaultTextWeight.regular,
                    textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(
                isExpanded: true,
                label: AppLocale.done.getString(context),
                onPressed: (){
                  NavigationUtil.go(AppRoutes.AUTH_LANDING);
                },
              ),
            ),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}