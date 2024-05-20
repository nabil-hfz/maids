import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maids/core/managers/navigation/app_navigation_arg.dart';
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/managers/navigation/navigation_transition.dart';
import 'package:maids/core/widgets/not_found_page.dart';
import 'package:maids/main.dart';
import 'package:maids/modules/auth/ui/pages/log_in_page.dart';
import 'package:maids/modules/spalsh/ui/pages/splash_page.dart';

final _parentKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static GlobalKey<NavigatorState> get parentKey => _parentKey;

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: _parentKey,
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        parentNavigatorKey: _parentKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          var navArgs = state.extra as BaseNavigationArg?;
          const child = SplashPage();
          return pageBuilder(context, state, child, navArgs: navArgs);
        },
      ),
      GoRoute(
        name: Routes.logInPage,
        path: Routes.logInPage,
        parentNavigatorKey: _parentKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          var navArgs = state.extra as BaseNavigationArg?;
          Widget child = const LoginPage();
          return pageBuilder(context, state, child, navArgs: navArgs);
        },
        // routes: [],
      ),
      // StatefulShellRoute.indexedStack(
      //   builder: (
      //     BuildContext context,
      //     GoRouterState state,
      //     StatefulNavigationShell navigationShell,
      //   ) {
      //     return MainRootPage(
      //       navigationShell: navigationShell,
      //     );
      //   },
      //   branches: <StatefulShellBranch>[
      //     StatefulShellBranch(
      //       routes: <RouteBase>[
      //         // GoRoute(
      //         //   name: Routes.homePage,
      //         //   path: Routes.homePage,
      //         //   builder: (BuildContext context, GoRouterState state) {
      //         //     return const CalendarPage();
      //         //   },
      //         //   routes: <RouteBase>[],
      //         // ),
      //       ],
      //     ),
      //   ],
      // ),
    ],

    // redirect: _guard,
    // refreshListenable: _auth,
    debugLogDiagnostics: !isRelease,
  );

  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundPage();

  static Page pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget child, {
    LocalKey? key,
    BaseNavigationArg? navArgs,
  }) {
    if (navArgs != null) {
      if (navArgs.navigationType == NavigationType.slideVertical) {
        return VerticalSlideTransitionPage(
          key: key ?? state.pageKey,
          child: child,
        );
      }
      if (navArgs.navigationType == NavigationType.slideHorizontalLeft) {
        return HorizontalSlideLeftTransitionPage(
          key: key ?? state.pageKey,
          child: child,
        );
      }
      if (navArgs.navigationType == NavigationType.slideHorizontalRight) {
        return HorizontalSlideRightTransitionPage(
          key: key ?? state.pageKey,
          child: child,
        );
      }
      if (navArgs.navigationType == NavigationType.fadeScale) {
        return FadeScaleTransitionPage(
          key: key ?? state.pageKey,
          child: child,
        );
      }

      if (navArgs.navigationType == NavigationType.fadeThrough) {
        return FadeThroughTransitionPage(
          key: key ?? state.pageKey,
          child: child,
        );
      }
      if (navArgs.navigationType == NavigationType.sharedAxisTransition) {
        return SharedAxisTransitionPage(
          child: child,
          key: key ?? state.pageKey,
          transitionType: SharedAxisTransitionType.scaled,
        );
      }
    }

    return FadeTransitionPage(
      key: key ?? state.pageKey,
      child: child,
    );
  }
}
