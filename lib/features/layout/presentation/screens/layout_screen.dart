import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/screens/home_screen.dart';
import 'package:pet_finder_app/features/layout/presentation/widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => sl<HomeCubit>()),
        BlocProvider<FavoriteCubit>(create: (_) => sl<FavoriteCubit>()),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: const [HomeScreen(), FavoriteScreen(), PetsScreen()],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pets'), centerTitle: true),
      body: const Center(child: Text('Pets Screen')),
    );
  }
}
