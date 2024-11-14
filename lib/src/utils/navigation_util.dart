import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flounaelza/src/routes/router.dart';

class NavigationUtil {
  static String getCurrentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }

  static Future<T?> push<T>(String path, {Object? extra}) {
    return router.push<T>(path, extra: extra);
  }

  static void go(String path, {Object? extra}) {
    router.go(path, extra: extra);
  }

  static void pop({dynamic result}) {
    router.pop(result);
  }

  static void replace(String path, {Object? extra}) {
    router.replace(path, extra: extra);
  }

  static void popUntil(String path) {
    final routerDelegate = router.routerDelegate;
    var routes = routerDelegate.currentConfiguration.routes;
    var route = routerDelegate.currentConfiguration.routes.last;

    while (routerDelegate.canPop()) {
      final cIndex = routes.indexOf(route);

      if (routes.elementAt(cIndex - 1) is ShellRoute) {
        routerDelegate.currentConfiguration.matches.removeLast();
      }

      if (route is GoRoute) {
        if (route.path == path) break;
        if (!routerDelegate.canPop()) break;
        routerDelegate.pop();
      }

      routes = routerDelegate.currentConfiguration.routes;
      route = routes.last;
    }
  }

  static T getExtra<T>(BuildContext context) {
    return GoRouterState.of(context).extra as T;
  }
}
