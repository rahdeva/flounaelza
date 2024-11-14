import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/account/pages/account_information/widgets/delete_account_confirmation_bottom_sheet.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/buttons/tertiary_button.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flounaelza/src/widgets/pickers/image_picker_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({super.key});

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  final _changeProfileFormKey = GlobalKey<FormState>();
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  bool isLoading = false;
  File? _selectedAvatarImage;

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
            _buildFormChangeProfile(),
          ],
        ),
      ),
    );
  }

  _buildFormChangeProfile() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Form(
        key: _changeProfileFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: DefaultText(
                text: AppLocale.accountInfo.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              ),
            ),
            const SizedBox(height: 40),
            ImagePickerWidget(
              selectedImage: _selectedAvatarImage,
              variant: ImagePickerVariant.avatar,
              onImageSelected: (File? image) {
                setState(() { _selectedAvatarImage = image; });
              },
              onDeleteImage: () {
                setState(() { _selectedAvatarImage = null; });
              },
            ),
            const SizedBox(height: 40),
            PrimaryInput(
              controller: _firstNameTextController,
              label: AppLocale.firstName.getString(context),
              hintText: AppLocale.firstName.getString(context),
              keyboardType: TextInputType.text,
              validator: (value) => FormValidator.validateRequired(
                label: AppLocale.firstName.getString(context),
                value: value,
                context: context,
              ),
            ),
            const SizedBox(height: 12),
            PrimaryInput(
              controller: _lastNameTextController,
              label: AppLocale.lastName.getString(context),
              hintText: AppLocale.lastName.getString(context),
              keyboardType: TextInputType.text,
              validator: (value) => FormValidator.validateRequired(
                label: AppLocale.lastName.getString(context),
                value: value,
                context: context,
              ),
            ),
            const SizedBox(height: 12),
            PrimaryInput(
              disabled: true,
              controller: _emailTextController,
              label: AppLocale.email.getString(context),
              hintText: AppLocale.email.getString(context),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => FormValidator.validateEmail(
                value: value,
                context: context,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: AppLocale.save.getString(context),
                onPressed: (){
                  if (_changeProfileFormKey.currentState!.validate()) {
                  }
                },
                isLoading: isLoading,
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: TertiaryButton(
                variant: TertiaryButtonVariant.neutral,
                label: AppLocale.accountDeleteAccount.getString(context),
                textType: DefaultTextType.textBase,
                textWeight: DefaultTextWeight.bold,
                onPressed: () {
                  openDeleteAccountConfirmationBottomSheet(context);
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}