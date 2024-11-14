import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_html/flutter_html.dart';

class TermConditionBottomSheet extends StatefulWidget {
  const TermConditionBottomSheet({super.key});

  @override
  State<TermConditionBottomSheet> createState() => TermConditionBottomSheetState();
}

class TermConditionBottomSheetState extends State<TermConditionBottomSheet> {  
  String termConditionHtmlContent = """
    <h3>1.1 Operator</h3>
    <p>The Nadi Platform is owned and operated by Nadi Pty Ltd ACN 613 747 845 (referred to in these Terms and Conditions as Nadi, We, Us and Our).</p>
    <p>Capitalised terms contained in these Terms and Conditions have the meanings given to them in clause 15 of these Terms and Conditions, unless the context otherwise requires.</p>
    
    <h3>1.2 Incorporation of terms</h3>
    <p>These Terms and Conditions together with Our Privacy Policy or any additional terms and conditions, policies, notices and disclaimers displayed elsewhere on the Nadi Platform (together, the Agreement), constitute a legally binding agreement between you and Nadi, governing your access and use of, including participation in any discussion forums or comments section incorporated on, the Nadi Platform. Please carefully read the Agreement as they contain important information about your legal rights, remedies and obligations.</p>
    
    <h3>1.3 Age affirmation</h3>
    <p>By accessing, browsing or using the Nadi Platform (and or completing or making a Reservation), you affirm that you are at least the age of 18 years old or otherwise have the consent of your legal parent or guardian to access, browse and use (and/or complete or make a Reservation via) the Nadi Platform.</p>
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
                  text: AppLocale.termCondition.getString(context),
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
                    data: termConditionHtmlContent,
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

void openTermConditionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.90,
        child: const TermConditionBottomSheet(),
      );
    },
  );
}