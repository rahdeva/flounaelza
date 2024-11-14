import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/account/pages/account_information/widgets/delete_account_final_confirmation_dialog.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/buttons/secondary_button.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class DeleteAccountConfirmationBottomSheet extends StatefulWidget {
  const DeleteAccountConfirmationBottomSheet({super.key});

  @override
  State<DeleteAccountConfirmationBottomSheet> createState() => DeleteAccountConfirmationBottomSheetState();
}

class DeleteAccountConfirmationBottomSheetState extends State<DeleteAccountConfirmationBottomSheet> {
  final _deleteAccountFormKey = GlobalKey<FormState>();
  final _confirmationController = TextEditingController();
  
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
                  text: AppLocale.deleteAccount.getString(context),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24
              ),
              child: Form(
                key: _deleteAccountFormKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    DefaultText(
                      text: AppLocale.accountDeleteAccountHeader.getString(context),
                      type: DefaultTextType.textLG,
                      weight: DefaultTextWeight.semiBold,
                      color: AppColors.black900,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    DefaultText(
                      text: AppLocale.accountDeleteAccountSubheader.getString(context),
                      type: DefaultTextType.textSM,
                      weight: DefaultTextWeight.regular,
                      color: AppColors.black900,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    DefaultText(
                      text: AppLocale.accountDeleteAccountConfirmDesc.getString(context),
                      type: DefaultTextType.textBase,
                      weight: DefaultTextWeight.regular,
                      color: AppColors.neutral600,
                      textAlign: TextAlign.center,
                    ),
                    PrimaryInput(
                      controller: _confirmationController,
                      label: '',
                      hintText: '',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => FormValidator.validateRequired(
                        value: value,
                        context: context,
                        label: ''
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  isExpanded: true,
                  label: AppLocale.accountDeleteAccountConfirmYes.getString(context),
                  onPressed: (){
                    openDeleteAccountFinalConfirmationDialog(
                      context,
                      onConfirmButtonPressed: (){
                        NavigationUtil.push(AppRoutes.DELETE_ACCOUNT_SUCCESS);
                      }
                    );
                  },
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  isExpanded: true,
                  label: AppLocale.cancel.getString(context),
                  onPressed: (){
                    NavigationUtil.pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void openDeleteAccountConfirmationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.72,
        child: const DeleteAccountConfirmationBottomSheet(),
      );
    },
  );
}