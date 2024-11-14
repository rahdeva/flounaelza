import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/utils/size_util.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/state/empty_state_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackButtonWidget(),
            Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: DefaultText(
                text: AppLocale.notification.getString(context),
                type: DefaultTextType.text2LG,
                weight: DefaultTextWeight.semiBold,
                color: AppColors.black900,
              )
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: SizeUtil.getProportionalHeight(height: 0.65),
              alignment: Alignment.center,
              child: EmptyStateWidget(
                title: AppLocale.notificationEmpty.getString(context),
                subTitle: AppLocale.notificationEmptyDesc.getString(context),
                buttonText: AppLocale.notificationCheckNewPromo.getString(context),
                buttonOnPressed: (){
                  NavigationUtil.push(AppRoutes.ALL_MONTHLY_PROMO);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}