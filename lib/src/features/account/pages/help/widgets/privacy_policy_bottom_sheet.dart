import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyBottomSheet extends StatefulWidget {
  const PrivacyPolicyBottomSheet({super.key});

  @override
  State<PrivacyPolicyBottomSheet> createState() => PrivacyPolicyBottomSheetState();
}

class PrivacyPolicyBottomSheetState extends State<PrivacyPolicyBottomSheet> {  
  String privacyPolicyHtmlContent = """
    <p>At Nadi, we recognise the importance of your privacy and understand your concerns about the security of the Personal Information you provide to us, whether via the Nadi Platform or otherwise.</p>

    <p>We are bound by the Australian Privacy Principles (APP) contained in the Privacy Act (subject to exemptions that are applicable to us under that Act), our general law obligations of confidentiality to you and all other applicable guidelines and codes in Australia.</p>

    <p>This privacy policy (“Policy”) details how Nadi manages Personal Information about you. Please note that your access and use of the Nadi Platform is subject to this Policy and any terms of use of the Nadi Platform. Where this Policy uses a word starting with a capital letter, that term will be defined in the Glossary section or elsewhere in this Policy.</p>

    <p>We may, from time to time, review and update this Policy, including taking account of new or amended laws, new technology and/or changes to our operations and practices. All Personal Information held by us will be governed by the most recently updated Policy. Accordingly, please also regularly check our Policy so that you are aware of these updates and changes. If you have any questions, please contact us at Nadi Pty Ltd or via email at privacy@nadi.com.</p>
  """;

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
                  text: AppLocale.privacyPolicy.getString(context),
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Html(
                    data: privacyPolicyHtmlContent,
                    style: {
                      "h3": Style(
                        fontSize: FontSize(18.0),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Georama",
                      ),
                      "p": Style(
                        fontSize: FontSize(16.0),
                        lineHeight: const LineHeight(1.6),
                        fontFamily: "Georama",
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void openPrivacyPolicyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.90,
        child: const PrivacyPolicyBottomSheet(),
      );
    },
  );
}