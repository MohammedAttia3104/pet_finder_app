import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/routing/routes.dart';

import '../../features/home/presentation/screens/home_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => BlocProvider(
      //       create: (context) => sl<LoginCubit>(),
      //       child: LoginScreen(),
      //     ),
      //   );
      case Routes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomeScreen(),
        );
      default:
        return null;
    }
  }
}
