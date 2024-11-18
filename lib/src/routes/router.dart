import 'package:flounaelza/src/features/action/pages/action/action_page.dart';
import 'package:flounaelza/src/features/history/pages/history/history_page.dart';
import 'package:flounaelza/src/features/product/pages/product/product_page.dart';
import 'package:flounaelza/src/features/transaction/pages/transaction/transaction_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flounaelza/src/features/auth/pages/login/login_page.dart';
import 'package:flounaelza/src/features/onboarding/pages/splash/splash_page.dart';
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
      path: AppRoutes.PRODUCT,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const ProductPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.TRANSACTION,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const TransactionPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.ACTION,
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context, 
        state: state, 
        child: const ActionPage(),
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
  ],
);