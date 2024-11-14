import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';

final GlobalKey _primaryLoaderKey = GlobalKey();

class PrimaryLoader {
  static void showLoader(BuildContext context) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          key: _primaryLoaderKey,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: const [
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          ],
        );
      },
    );
  }

  static void closeLoader(BuildContext context) {
    if (_primaryLoaderKey.currentContext != null) {
      NavigationUtil.pop();
    }
  }
}
