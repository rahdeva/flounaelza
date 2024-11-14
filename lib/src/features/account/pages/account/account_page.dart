import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/account/pages/account/widgets/setting_menu_item.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/buttons/tertiary_button.dart';
import 'package:flounaelza/src/widgets/loaders/image_load.dart';
import 'package:flounaelza/src/widgets/menus/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _profileImage = 'https://api.rintisan.co.id/storage/user/images/8r2AE0KKTrm8M92XdZvWw5JU1pNqT4UTsGUR5U20.png';
  String _appVersion = '';
  final String _name = 'Julian Dennis';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }
  
  _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  _logout(){
    NavigationUtil.go(AppRoutes.AUTH_LANDING);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.backgroundColor,
        title: DefaultText(
          text: AppLocale.account.getString(context),
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
      bottomNavigationBar: const BottomNavBarWidget(currentIndex: 4),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserProfileHeader(context),
              const SizedBox(height: 24),
              const Divider(
                color: AppColors.neutral300,
                height: 1,
              ),
              const SizedBox(height: 24),
              _buildSettingMenu(context),
              const SizedBox(height: 24),
              TertiaryButton(
                variant: TertiaryButtonVariant.regular,
                label: AppLocale.logout.getString(context),
                textType: DefaultTextType.textBase,
                textWeight: DefaultTextWeight.bold,
                textDecoration: TextDecoration.underline,
                onPressed: () {
                  _logout();
                },
              ),
              const SizedBox(height: 24),
              _buildAppVersion()
            ],
          ),
        ),
      ),
    );
  }

  _buildUserProfileHeader(BuildContext context) {
    return Pressable(
      onPressed: (){
        NavigationUtil.push(AppRoutes.ACCOUNT_INFORMATION);
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 32,
              child: ImageLoad(
                imageUrl: _profileImage,
                fit: BoxFit.cover,
                placeholderShape: PlaceholderShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: _name,
                  type: DefaultTextType.textMD,
                  weight: DefaultTextWeight.semiBold,
                  color: AppColors.black900,
                ),
                const SizedBox(height: 4),
                DefaultText(
                  text: AppLocale.accountInfo.getString(context),
                  type: DefaultTextType.textBase,
                  weight: DefaultTextWeight.regular,
                  color: AppColors.neutral500,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: AppColors.neutral800,
            ),
          ],
        ),
      ),
    );
  }

  _buildSettingMenu(BuildContext context) {
    return Column(
      children: [
        SettingMenuItem(
          icon: SvgAssetConstant.keyIcon,
          title: AppLocale.password.getString(context),
          subTitle: AppLocale.changePasswordAnytime.getString(context),
          onTap: () {
            NavigationUtil.push(AppRoutes.CHANGE_PASSWORD);
          }
        ),
        const SizedBox(height: 24),
        SettingMenuItem(
          icon: SvgAssetConstant.helpIcon,
          title: AppLocale.help.getString(context),
          subTitle: AppLocale.accountTermAndPrivacy.getString(context),
          onTap: () {
            NavigationUtil.push(AppRoutes.HELP);
          }
        ),
        const SizedBox(height: 24),
        const Divider(
          height: 1, 
          color: AppColors.neutral300
        ),
      ],
    );
  }

  _buildAppVersion() {
    return DefaultText(
      text: '${AppLocale.version.getString(context)} v$_appVersion',
      color: AppColors.neutral700,
      type: DefaultTextType.textSM,
      weight: DefaultTextWeight.medium,
    );
  }
}