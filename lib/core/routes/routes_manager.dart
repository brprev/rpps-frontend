import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page/sign_in_cubit.dart';
import '../../features/auth/presentation/pages/sign_in_page/sign_in_page.dart';
import '../../features/root/presentation/pages/root_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String rootRoute = '/';
  static const String signInRoute = '/sign-in';

  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.signInRoute,
      routes: <RouteBase>[
        GoRoute(
          name: AppRoutes.signInRoute,
          path: AppRoutes.signInRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const SignInPage();
          },
          redirect: (BuildContext context, GoRouterState state) async {
            final cubit = context.read<SignInCubit>();
            final loggedIn = await cubit.getLoginStatus();
            if (loggedIn) return AppRoutes.rootRoute;

            return null;
          },
        ),
        GoRoute(
          name: AppRoutes.rootRoute,
          path: AppRoutes.rootRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const RootPage();
          },
        ),
      ],
    );
  }
}
