import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/utils/brightness_util.dart';
import 'package:flounaelza/src/utils/size_util.dart';
import 'package:flounaelza/src/widgets/buttons/back_button.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool isLoading = false;
  
  void _increaseBrightness() async {
    try {
      await BrightnessUtil.setBrightness(1.0);
    } catch (e) {
      debugPrint("Permission denied or error: $e");
    }
  }

  void _resetBrightness() async {
    try {
      await BrightnessUtil.setBrightness(0.3);
    } catch (e) {
      debugPrint("Permission denied or error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _increaseBrightness();
  }

  @override
  void dispose() {
    _resetBrightness();
    super.dispose();
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: AppLocale.scanBarcode.getString(context),
                    type: DefaultTextType.text2LG,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 12),
                  DefaultText(
                    text: AppLocale.scanBarcodeDesc.getString(context),
                    type: DefaultTextType.textSM,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.black700,
                  )
                ],
              )
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: AppLocale.info.getString(context),
                    type: DefaultTextType.textSM,
                    weight: DefaultTextWeight.semiBold,
                    color: AppColors.black900,
                  ),
                  const SizedBox(height: 12),
                  const DefaultText(
                    text: 'Dapatkan 1 point untuk setiap Rp 1.000 pembelian',
                    type: DefaultTextType.textSM,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.black700,
                  )
                ],
              )
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}