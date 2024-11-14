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
        .validate_email_cant_empty
        .getString(context);
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return AppLocale
        .validate_email_not_valid
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
        .validate_password_cant_empty
        .getString(context);
    }
    if (value.length < 8) {
      return AppLocale
        .validate_password_min_char
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
        .validate_phone_cant_empty
        .getString(context);
    }
    if (value.length < 10) {
      return AppLocale
        .validate_phone_min_char
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
    var requiredChar = AppLocale.validate_required_char.getString(context);
    if (value == null || value.isEmpty) {
      return label + AppLocale
        .validate_required_cant_empty
        .getString(context);
    }
    if (min != null && value.length < min) {
      var requiredMin = AppLocale.validate_required_min.getString(context);
      return '$label $requiredMin $min $requiredChar';
    }
    if (max != null && value.length > max) {
      var requiredMax = AppLocale.validate_required_max.getString(context);
      return '$label $requiredMax $min $requiredChar';
    }
    return null;
  }
}