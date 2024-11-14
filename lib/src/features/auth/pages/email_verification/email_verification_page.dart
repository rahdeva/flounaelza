import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/auth/widgets/auth_floating_action_button.dart';
import 'package:flounaelza/src/features/auth/widgets/auth_header_widget.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _emailVerificationFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'santa@gmail.com');
  final _codeController = TextEditingController();
  bool isLoading = false;
  bool isFilled = false;

  _submitEmailVerification() async {
    NavigationUtil.go(AppRoutes.INITIAL_IDENTITY);
  }

  _checkFilled(){
    setState(() {
      isFilled = _codeController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 72),
              AuthHeaderWidget(
                step: 2,
                title: AppLocale.authVerifyYourEmail.getString(context),
                customSubtitle: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    DefaultText(
                      text: AppLocale.authWeSendCodeToEmail.getString(context),
                      type: DefaultTextType.textSM,
                      color: AppColors.black700,
                    ),
                    DefaultText(
                      text: _emailController.text,
                      type: DefaultTextType.textSM,
                      color: AppColors.black700,
                      weight: DefaultTextWeight.semiBold,
                    ),
                    DefaultText(
                      text: AppLocale.authEnterCodeBelow.getString(context),
                      type: DefaultTextType.textSM,
                      color: AppColors.black700,
                    ),
                  ],
                ),
              ),
              _buildFormEmailVerification(),
            ],
          ),
        ),
      ),
      floatingActionButton: AuthFloatingActionButton(
        isActive: isFilled, 
        onPressed: (){
          if (_emailVerificationFormKey.currentState!.validate()) {
            _submitEmailVerification();
          }
        }
      ),
    );
  }

  _buildFormEmailVerification() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16, 
        vertical: 20
      ),
      child: Form(
        key: _emailVerificationFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryInput(
              controller: _codeController,
              label: AppLocale.authEmailCode.getString(context),
              hintText: AppLocale.authEmailCode.getString(context),
              keyboardType: TextInputType.text,
              validator: (value) => FormValidator.validateRequired(
                value: value,
                context: context,
                label: AppLocale.authEmailCode.getString(context),
              ),
              onChanged: (p0) {
                _checkFilled();
              },
            ),
          ],
        )
      ),
    );
  }
}