import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';

class BasicDialog extends StatelessWidget {
  const BasicDialog({
    super.key,
    this.children,
    this.contentPadding,
  });

  final List<Widget>? children;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: AppColors.white,
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(
        horizontal: 20.0, 
        vertical: 32.0
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0)
        ),
      ),
      children: children,
    );
  }
}

void openBasicDialog(
  BuildContext context, {
  List<Widget>? children,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return BasicDialog(
        children: children,
      );
    },
  );
}
