import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../di/dependency_injection.dart';

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
          builder: (context) {
            return BlocProvider<HomeCubit>(
              create: (_) => sl<HomeCubit>(),
              child: HomeScreen(),
            );
          },
        );
      default:
        return null;
    }
  }
}
