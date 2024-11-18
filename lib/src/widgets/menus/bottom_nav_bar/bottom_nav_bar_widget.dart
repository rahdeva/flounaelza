import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/utils/navigation_util.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;

  const BottomNavBarWidget({
    super.key, 
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    final selectedRoute = bottomNavRoutes(context)[index]['routeName'] as String;

    if (NavigationUtil.getCurrentRoute(context) != selectedRoute) {
      NavigationUtil.go(selectedRoute);
    }
  }

  List<Map<String, dynamic>> bottomNavRoutes(BuildContext context) => [
    {
      'index': 0,
      'routeName': AppRoutes.HOME,
      'icon': SvgAssetConstant.homeIcon,
      'label': AppLocale.product.getString(context),
    },
    {
      'index': 1,
      'routeName': AppRoutes.MY_COUPON,
      'icon': SvgAssetConstant.ticketIcon,
      'label': AppLocale.transaction.getString(context),
    },
    {
      'index': 2,
      'routeName': AppRoutes.SCAN,
      'icon': SvgAssetConstant.filterDateIcon,
      'label': AppLocale.action.getString(context),
    },
    {
      'index': 3,
      'routeName': AppRoutes.HISTORY,
      'icon': SvgAssetConstant.historyIcon,
      'label': AppLocale.history.getString(context),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 4,
      shadowColor: AppColors.grey,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bottomNavRoutes(context).map((route) {
          return _buildTabItem(
            context,
            index: route['index'],
            icon: route['icon'],
            label: route['label'],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required int index,
    required String icon,
    required String label,
  }) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(context, index),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isSelected 
                  ? AppColors.primaryColor 
                  : AppColors.neutral500,
                  BlendMode.srcIn
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: DefaultText(
                  text: label,
                  type: DefaultTextType.text3XS,
                  weight: isSelected 
                    ? DefaultTextWeight.semiBold
                    : DefaultTextWeight.medium,
                  color: isSelected 
                    ? AppColors.primaryColor 
                    : AppColors.neutral500,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
