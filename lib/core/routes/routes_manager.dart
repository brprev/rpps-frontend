import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart/sign_in_page.dart';

class Routes {
  static const String signInRoute = '/';
  static const String manageLaws = '/';
  static const String manageEntities = '/';
}

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInRoute:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );

      case Routes.manageLaws:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );
    }
  }
}
