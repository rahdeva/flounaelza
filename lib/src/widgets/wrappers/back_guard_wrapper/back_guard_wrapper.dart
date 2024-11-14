// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class BackGuardWrapper extends StatefulWidget {
  const BackGuardWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BackGuardWrapper> createState() => _BackGuardWrapperState();
}

class _BackGuardWrapperState extends State<BackGuardWrapper> {
  DateTime? _ctime;

  void _triggerBackGuardPopWarning(bool _) async {
    DateTime now = DateTime.now();
    if (
      _ctime == null ||
      now.difference(_ctime!) > const Duration(seconds: 2)
    ) {
      _ctime = now;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: DefaultText(
            text: AppLocale.pressAgainToExit.getString(context),
            color: AppColors.white,
            weight: DefaultTextWeight.regular,
          ),
          action: SnackBarAction(
            label: AppLocale.pressAgainToExit.getString(context),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else if (now.difference(_ctime!) < const Duration(seconds: 2)) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _triggerBackGuardPopWarning,
      canPop: false,
      child: widget.child,
    );
  }
}
