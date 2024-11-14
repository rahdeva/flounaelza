import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/dialogs/confirmation_dialog.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

void openDeleteAccountFinalConfirmationDialog(
  BuildContext context, {
  required Function() onConfirmButtonPressed,
}) {
  openConfirmationDialog(
    context,
    header: const SizedBox(),
    body: Column(
      children: [
        DefaultText(
          text: AppLocale.accountDeleteAccountFinalConfirmHeader.getString(context),
          type: DefaultTextType.textMD,
          weight: DefaultTextWeight.bold,
          color: AppColors.black900,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12.0),
        DefaultText(
          text: AppLocale.accountDeleteAccountFinalConfirmSubheader.getString(context),
          type: DefaultTextType.textSM,
          color: AppColors.black900,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    cancelButtonLabel: AppLocale.cancel.getString(context),
    confirmButtonLabel: AppLocale.delete.getString(context),
    onCancelButtonPressed: () {
      NavigationUtil.pop();
    },
    onConfirmButtonPressed: onConfirmButtonPressed,
  );
}
