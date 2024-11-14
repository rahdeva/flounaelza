import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/auth/widgets/auth_floating_action_button.dart';
import 'package:flounaelza/src/features/auth/widgets/auth_header_widget.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/utils/validators/form_validator.dart';
import 'package:flounaelza/src/widgets/inputs/primary_input.dart';
import 'package:flutter_localization/flutter_localization.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  bool isLoading = false;
  bool isFilled = false;

  _submitRegister() async {
    NavigationUtil.push(AppRoutes.EMAIL_VERIFICATION);
    // setState(() { isLoading = true; });

    // try {
    //   final response = await AuthServices.postRegister(
    //     email: _emailController.text,
    //     name: _nameController.text,
    //     phone: _phoneController.text,
    //     password: _passwordController.text,
    //     confirmPassword: _confirmPasswordController.text,
    //   );
    //   SnackbarWidget.success(message: response.meta?.message ?? 'Success');
    //   NavigationUtil.go(
    //     AppRoutes.OTP,
    //     extra: {
    //       'email': _emailController.text,
    //       'otpType': 'register',
    //     }
    //   );
    // } on ApiResponseFailed catch (error) {
    //   final message = ApiResponseUtil.extractErrorMessage(error.meta?.message);
    //   SnackbarWidget.error(message: message ?? 'Terjadi kesalahan');
    // } catch (error) {
    //   SnackbarWidget.error(message: 'Terjadi kesalahan');
    // } finally {
    //   setState(() { isLoading = false; });
    // }
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 72),
              AuthHeaderWidget(
                step: 1,
                title: AppLocale.authCreateYourAccount.getString(context),
              ),
              _buildFormRegister(),
            ],
          ),
        ),
      ),
      floatingActionButton: AuthFloatingActionButton(
        isActive: isFilled, 
        onPressed: (){
          if (_registerFormKey.currentState!.validate()) {
            _submitRegister();
          }
        }
      ),
    );
  }

  _buildFormRegister() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16, 
        vertical: 20
      ),
      child: Form(
        key: _registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryInput(
              controller: _emailController,
              label: AppLocale.email.getString(context),
              hintText: AppLocale.email.getString(context),
              keyboardType: TextInputType.text,
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
          ],
        )
      ),
    );
  }
}