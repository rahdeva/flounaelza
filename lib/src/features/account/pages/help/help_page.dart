import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/account/pages/help/widgets/privacy_policy_bottom_sheet.dart';
import 'package:flounaelza/src/features/account/pages/help/widgets/term_condition_bottom_sheet.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackButtonWidget(),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DefaultText(
                      text: AppLocale.help.getString(context),
                      type: DefaultTextType.text2LG,
                      weight: DefaultTextWeight.semiBold,
                      color: AppColors.black900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildHelpItem(
              label: AppLocale.termCondition.getString(context),
              onTap: (){
                openTermConditionBottomSheet(context);
              }
            ),
            const SizedBox(height: 24),
            _buildHelpItem(
              label: AppLocale.privacyPolicy.getString(context),
              onTap: (){
                openPrivacyPolicyBottomSheet(context);
              }
            ),
          ],
        ),
      ),
    );
  }

  _buildHelpItem({
    required label,
    required Function() onTap,
  }) {
    return Pressable(
      onPressed: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(
              text: label,
              type: DefaultTextType.textBase,
              weight: DefaultTextWeight.semiBold,
              color: AppColors.black900,
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: AppColors.black900,
            )
          ],
        ),
      ),
    );
  }
}