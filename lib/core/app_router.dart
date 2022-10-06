import 'package:ecommerce/pages/home/home_page.dart';
import 'package:ecommerce/pages/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants/routes/route_name.dart';
import 'constants/routes/route_path.dart';


class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: RoutePath.loginPage,
    routes: <GoRoute>[
      GoRoute(
        path: RoutePath.loginPage,
        name: RouteName.loginPage,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      // GoRoute(
      //   path: AuthenticationPage.routeName,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const AuthenticationPage();
      //   },
      // ),
      GoRoute(
        path: RoutePath.homePage,
        name: RouteName.homePage,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
}
