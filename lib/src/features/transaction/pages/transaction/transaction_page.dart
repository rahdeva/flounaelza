import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/menus/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.backgroundColor,
        title: DefaultText(
          text: AppLocale.transaction.getString(context),
          type: DefaultTextType.text3XL,
          color: AppColors.black900,
          weight: DefaultTextWeight.bold,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: false,
      bottomNavigationBar: const BottomNavBarWidget(currentIndex: 1),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}