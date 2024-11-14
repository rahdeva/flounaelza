import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _changePasswordFormKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  bool isObscureCurrentPassword = true;
  bool isObscureNewPassword = true;
  bool isObscureConfirmNewPassword = true;
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
            _buildFormChangePassword(),
          ],
        ),
      ),
    );
  }

  _buildFormChangePassword() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Form(
        key: _changePasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: DefaultText(
                text: AppLocale.accountChangePassword.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              ),
            ),
            const SizedBox(height: 40),
            PrimaryInput(
              controller: _currentPasswordController,
              label: AppLocale.currentPassword.getString(context),
              hintText: AppLocale.currentPassword.getString(context),
              obscured: isObscureCurrentPassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => FormValidator.validatePassword(
                value: value,
                context: context,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.neutral200,
              height: 1,
            ),
            const SizedBox(height: 12),
            PrimaryInput(
              controller: _newPasswordController,
              label: AppLocale.newPassword.getString(context),
              hintText: AppLocale.newPassword.getString(context),
              obscured: isObscureNewPassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => FormValidator.validatePassword(
                value: value,
                context: context,
              ),
            ),
            const SizedBox(height: 12),
            PrimaryInput(
              controller: _confirmNewPasswordController,
              label: AppLocale.confirmNewPassword.getString(context),
              hintText: AppLocale.confirmNewPassword.getString(context),
              obscured: isObscureConfirmNewPassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => FormValidator.validatePassword(
                value: value,
                context: context,
              ),
            ),
            const SizedBox(height: 42),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: AppLocale.save.getString(context),
                onPressed: (){
                  if (_changePasswordFormKey.currentState!.validate()) {
                  }
                },
                isLoading: isLoading,
              ),
            ),
          ],
        )
      ),
    );
  }
}