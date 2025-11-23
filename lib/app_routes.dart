import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/app/presentation/screens/base_view.dart';
import 'features/auth/presentation/screens/login_view.dart';
import 'features/dashboard/presentation/screens/dashboard_view.dart';
import 'features/landing/presentation/screens/splash_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        name: "splash",
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/LoginView',
        builder: (BuildContext context, GoRouterState state) {
          return LoginView();
        },
        // redirect: (BuildContext context, GoRouterState state) {
        //   var avm = Provider.of<AuthProvider>(context, listen: false);
        //   // var avm = context.watch<AuthProvider>();
        //   debugPrint(" LoginView ${avm.user?.user?.id}");
        //   if (avm.user?.user?.id != null) {
        //     return '/base';
        //   }
        //   return null;
        // },
      ),
      GoRoute(
        path: "/base",
        name: "base",
        builder: (BuildContext context, GoRouterState state) {
          return const BaseView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: "/dashboard",
            name: "dashboard",
            builder: (BuildContext context, GoRouterState state) {
              return DashboardScreen();
            },
          ),
        ],
      ),
    ],
  );
}
