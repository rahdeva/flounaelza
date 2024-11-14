import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';

class AuthFloatingActionButton extends StatelessWidget {
  const AuthFloatingActionButton({
    super.key, 
    required this.isActive, 
    required this.onPressed,
  });

  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 24),
      child: FloatingActionButton(
        backgroundColor: isActive
          ? AppColors.primaryColor
          : AppColors.neutral400,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
        )
      ),
    );
  }
}