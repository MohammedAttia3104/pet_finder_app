import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/screens/breed_details_screen.dart';
import 'package:pet_finder_app/features/layout/presentation/screens/layout_screen.dart';
import 'package:pet_finder_app/features/layout/presentation/screens/on_boarding_screen.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OnBoardingScreen(),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => LayoutScreen(),
        );
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
      case Routes.favoritesScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return BlocProvider<FavoriteCubit>(
              create: (_) => sl<FavoriteCubit>(),
              child: FavoriteScreen(),
            );
          },
        );
      case Routes.breedDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final breedId = args?['breedId'] ?? '';

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<HomeCubit>()),
              BlocProvider.value(value: sl<FavoriteCubit>()),
            ],
            child: BreedDetailsScreen(breedId: breedId),
          ),
        );
      default:
        return null;
    }
  }
}
