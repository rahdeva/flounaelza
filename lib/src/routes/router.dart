import 'package:go_router/go_router.dart';
import 'package:flounaelza/src/features/account/pages/account/account_page.dart';
import 'package:flounaelza/src/features/account/pages/account_information/account_information_page.dart';
import 'package:flounaelza/src/features/account/pages/change_password/change_password_page.dart';
import 'package:flounaelza/src/features/account/pages/forgot_password/forgot_password_page.dart';
import 'package:flounaelza/src/features/account/pages/help/help_page.dart';
import 'package:flounaelza/src/features/auth/pages/login/login_page.dart';
import 'package:flounaelza/src/features/coupon/pages/coupon_detail/coupon_detail_page.dart';
import 'package:flounaelza/src/features/coupon/pages/my_coupon/my_coupon_page.dart';
import 'package:flounaelza/src/features/coupon/pages/status_redeem_coupon/status_redeem_coupon_page.dart';
import 'package:flounaelza/src/features/history/pages/history_page.dart';
import 'package:flounaelza/src/features/home/pages/home_page.dart';
import 'package:flounaelza/src/features/member/pages/member_menu/member_menu_page.dart';
import 'package:flounaelza/src/features/notification/pages/notification_page.dart';
import 'package:flounaelza/src/features/onboarding/pages/splash/splash_page.dart';
import 'package:flounaelza/src/features/promo/pages/all_monthly_promo/all_monthly_promo_page.dart';
import 'package:flounaelza/src/features/promo/pages/all_recommendation_promo/all_recommendation_promo_page.dart';
import 'package:flounaelza/src/features/promo/pages/promo_detail/promo_detail_page.dart';
import 'package:flounaelza/src/features/scan/pages/scan_page.dart';
import 'package:flounaelza/src/routes/app_routes.dart';
import 'package:flounaelza/src/routes/transition.dart';

final router = GoRouter(
  initialLocation: AppRoutes.SPLASH,
  routes: [
    GoRoute(
      path: AppRoutes.SPLASH,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.LOGIN,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.HOME,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.MY_COUPON,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const MyCouponPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.SCAN,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const ScanPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.HISTORY,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const HistoryPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.ACCOUNT,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const AccountPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.ACCOUNT_INFORMATION,
      builder: (context, state) => const AccountInformationPage(),
    ),
    GoRoute(
      path: AppRoutes.CHANGE_PASSWORD,
      builder: (context, state) => const ChangePasswordPage(),
    ),
    GoRoute(
      path: AppRoutes.HELP,
      builder: (context, state) => const HelpPage(),
    ),
    GoRoute(
      path: AppRoutes.FORGOT_PASSWORD,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: AppRoutes.COUPON_DETAIL,
      builder: (context, state) => const CouponDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.STATUS_REDEEM_COUPON,
      builder: (context, state) => const StatusRedeemCouponPage(),
    ),
    GoRoute(
      path: AppRoutes.MEMBER_MENU,
      builder: (context, state) => const MemberMenuPage(),
    ),
    GoRoute(
      path: AppRoutes.PROMO_DETAIL,
      builder: (context, state) => const PromoDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.ALL_RECOMMENDATION_PROMO,
      builder: (context, state) => const AllRecommendationPromoPage(),
    ),
    GoRoute(
      path: AppRoutes.ALL_MONTHLY_PROMO,
      builder: (context, state) => const AllMonthlyPromoPage(),
    ),
    GoRoute(
      path: AppRoutes.NOTIFICATION,
      builder: (context, state) => const NotificationPage(),
    ),
  ],
);