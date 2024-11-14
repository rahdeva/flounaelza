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

class InitialIdentityPage extends StatefulWidget {
  const InitialIdentityPage({super.key});

  @override
  State<InitialIdentityPage> createState() => _InitialIdentityPageState();
}

class _InitialIdentityPageState extends State<InitialIdentityPage> {
  final _identityFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool isLoading = false;
  bool isFilled = false;

  _submitIdentity() async {
    NavigationUtil.go(AppRoutes.HOME);
  }

  _checkFilled(){
    setState(() {
      isFilled = _firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty;
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
                step: 3,
                stepWithTitle: true,
                stepTitle: AppLocale.authIdentityHeader.getString(context),
                title: AppLocale.authWhatsYourName.getString(context),
              ),
              _buildFormInitialIdentity(),
            ],
          ),
        ),
      ),
      floatingActionButton: AuthFloatingActionButton(
        isActive: isFilled, 
        onPressed: (){
          if (_identityFormKey.currentState!.validate()) {
            _submitIdentity();
          }
        }
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
        key: _identityFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryInput(
              controller: _firstNameController,
              label: AppLocale.firstName.getString(context),
              hintText: AppLocale.firstName.getString(context),
              keyboardType: TextInputType.name,
              validator: (value) => FormValidator.validateRequired(
                value: value,
                context: context,
                label: AppLocale.firstName.getString(context),
              ),
              onChanged: (p0) {
                _checkFilled();
              },
            ),
            const SizedBox(height: 12),
            PrimaryInput(
              controller: _lastNameController,
              label: AppLocale.lastName.getString(context),
              hintText: AppLocale.lastName.getString(context),
              keyboardType: TextInputType.name,
              validator: (value) => FormValidator.validateRequired(
                value: value,
                context: context,
                label: AppLocale.lastName.getString(context),
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