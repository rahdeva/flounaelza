import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';

class FormValidator {
  static String? validateEmail({
    String? value,
    required BuildContext context,
    bool isRequired = true
  }) {
    if (!isRequired) {
      return null;
    }
    if ((value == null || value.isEmpty)) {
      return AppLocale
        .validateEmailCantEmpty
        .getString(context);
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return AppLocale
        .validateEmailNotValid
        .getString(context);
    }
    return null;
  }

  static String? validatePassword({
    String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return AppLocale
        .validatePasswordCantEmpty
        .getString(context);
    }
    if (value.length < 8) {
      return AppLocale
        .validatePasswordMinChar
        .getString(context);
    }
    return null;
  }

  static String? validatePhone({
    String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return AppLocale
        .validatePhoneCantEmpty
        .getString(context);
    }
    if (value.length < 10) {
      return AppLocale
        .validatePhoneMinChar
        .getString(context);
    }
    return null;
  }

  static String? validateRequired({
    String? value,
    required String label, 
    required BuildContext context,
    int? min, 
    int? max
  }) {
    var requiredChar = AppLocale.validateRequiredChar.getString(context);
    if (value == null || value.isEmpty) {
      return label + AppLocale
        .validateRequiredCantEmpty
        .getString(context);
    }
    if (min != null && value.length < min) {
      var requiredMin = AppLocale.validateRequiredMin.getString(context);
      return '$label $requiredMin $min $requiredChar';
    }
    if (max != null && value.length > max) {
      var requiredMax = AppLocale.validateRequiredMax.getString(context);
      return '$label $requiredMax $min $requiredChar';
    }
    return null;
  }
}