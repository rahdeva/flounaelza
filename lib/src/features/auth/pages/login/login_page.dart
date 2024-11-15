import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/auth/widgets/auth_header_widget.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/buttons/tertiary_button.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscurePassword = true;
  bool isLoading = false;
  bool isFilled = false;

  _submitIdentity() async {
    NavigationUtil.go(AppRoutes.HOME);
  }

  _checkFilled(){
    setState(() {
      isFilled = _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 72),
              AuthHeaderWidget(
                step: 4,
                stepWithTitle: true,
                stepTitle: AppLocale.authSignInAuthHeader.getString(context),
                title: AppLocale.authPleaseSignIn.getString(context),
              ),
              _buildFormInitialIdentity(),
            ],
          ),
        ),
      ),
    );
  }

  _buildFormInitialIdentity() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16, 
        vertical: 20
      ),
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryInput(
              controller: _emailController,
              label: AppLocale.email.getString(context),
              hintText: AppLocale.email.getString(context),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => FormValidator.validateEmail(
                value: value,
                context: context,
              ),
              onChanged: (p0) {
                _checkFilled();
              },
            ),
            const SizedBox(height: 12),
            PrimaryInput(
              controller: _passwordController,
              label: AppLocale.password.getString(context),
              hintText: AppLocale.password.getString(context),
              obscured: isObscurePassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => FormValidator.validatePassword(
                value: value,
                context: context,
              ),
              onChanged: (p0) {
                _checkFilled();
              },
            ),
            const SizedBox(height: 20),
            TertiaryButton(
              variant: TertiaryButtonVariant.regular,
              label: AppLocale.forgotPassword.getString(context),
              textType: DefaultTextType.textSM,
              textWeight: DefaultTextWeight.medium,
              onPressed: () {
                NavigationUtil.push(AppRoutes.FORGOT_PASSWORD);
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: AppLocale.signIn.getString(context),
                onPressed: (){
                  if (_loginFormKey.currentState!.validate()) {
                    _submitIdentity();
                  }
                },
                isLoading: isLoading,
              ),
            ),
            const SizedBox(height: 16),
          ],
        )
      ),
    );
  }
}