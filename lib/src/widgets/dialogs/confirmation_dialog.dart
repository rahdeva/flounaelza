import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/buttons/primary_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key, 
    this.header,
    this.body,
    this.cancelButtonLabel = '',
    this.confirmButtonLabel = '',
    this.onCancelButtonPressed,
    this.onConfirmButtonPressed,
  });

  final Widget? header;
  final Widget? body;
  final String cancelButtonLabel;
  final String confirmButtonLabel;
  final Function()? onCancelButtonPressed;
  final Function()? onConfirmButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: AppColors.white,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      children: [
        if (header != null) header!,
        const SizedBox(height: 24.0),
        if (body != null) body!,
        const SizedBox(height: 48.0),
        Row(
          children: [
            Expanded(
                child: PrimaryButton(
                  key: const ValueKey('confirmation_dialog_cancel_button'),
                  variant: PrimaryButtonVariant.grey,
                  fontWeight: DefaultTextWeight.medium,
                  label: cancelButtonLabel,
                  onPressed: onCancelButtonPressed ?? (){},
                ),
              ),
              const SizedBox(width: 16.0),
            Expanded(
                child: PrimaryButton(
                  key: const ValueKey('confirmation_dialog_confirm_button'),
                  fontWeight: DefaultTextWeight.bold,
                  label: confirmButtonLabel,
                  onPressed: onConfirmButtonPressed ?? (){},
                ),
              ),
          ],
        ),
      ],
    );
  }
}

void openConfirmationDialog(
  BuildContext context, {
  Widget? header,
  Widget? body,
  String cancelButtonLabel = '',
  String confirmButtonLabel = '',
  Function()? onCancelButtonPressed,
  Function()? onConfirmButtonPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return ConfirmationDialog(
        header: header,
        body: body,
        cancelButtonLabel: cancelButtonLabel,
        confirmButtonLabel: confirmButtonLabel,
        onCancelButtonPressed: onCancelButtonPressed,
        onConfirmButtonPressed: onConfirmButtonPressed,
      );
    },
  );
}
