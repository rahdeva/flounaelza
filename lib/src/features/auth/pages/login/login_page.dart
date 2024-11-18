import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/app_elevation_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flutter_localization/flutter_localization.dart';

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

  _submitLogin() async {
    NavigationUtil.go(AppRoutes.PRODUCT);
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
              _buildFormLogin(),
            ],
          ),
        ),
      ),
    );
  }

  _buildFormLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16, 
        vertical: 20
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [ AppElevation.elevation4px ]
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
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: AppLocale.signIn.getString(context),
                onPressed: (){
                  if (_loginFormKey.currentState!.validate()) {
                    _submitLogin();
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