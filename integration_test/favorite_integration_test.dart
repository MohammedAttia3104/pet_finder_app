import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:pet_finder_app/pet_finder_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> clearFavorites(WidgetTester tester) async {
    final favTab = find.byKey(const Key('bottom_nav_favorites'));
    if (favTab.evaluate().isEmpty) {
      return;
    }
    await tester.tap(favTab);
    await tester.pumpAndSettle();

    var deleteBtn = find.byKey(const Key('favorite_grid_delete_button'));
    int safety = 10;
    while (deleteBtn.evaluate().isNotEmpty && safety-- > 0) {
      await tester.tap(deleteBtn.first);
      await tester.pumpAndSettle();
      deleteBtn = find.byKey(const Key('favorite_grid_delete_button'));
    }

    final emptyStateFinder = find.text('No favorites yet');
    if (emptyStateFinder.evaluate().isNotEmpty) {
      expect(emptyStateFinder, findsWidgets);
    }

    final homeTab = find.byKey(const Key('bottom_nav_home'));
    if (homeTab.evaluate().isNotEmpty) {
      await tester.tap(homeTab);
      await tester.pumpAndSettle();
    }
  }

  group('Favorite Feature - Integration Tests', () {
    setUpAll(() async {
      await setupGetIt();
    });

    testWidgets('Load favorites screen and verify empty state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, __) => MaterialApp(
            home: BlocProvider<FavoriteCubit>(
              create: (_) => sl<FavoriteCubit>(),
              child: const FavoriteScreen(),
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(FavoriteScreen), findsOneWidget);
    });

    testWidgets('Add favorite from home then visible in favorites tab', (
      tester,
    ) async {
      await tester.pumpWidget(const PetFinderApp());
      await tester.pumpAndSettle();

      await clearFavorites(tester);

      await tester.pump(const Duration(seconds: 2));

      final favoriteSvgFinder = find.byKey(const Key('favorite_key'));
      expect(favoriteSvgFinder, findsWidgets);

      await tester.tap(favoriteSvgFinder.first);
      await tester.pumpAndSettle();

      final favTab = find.byKey(const Key('bottom_nav_favorites'));
      expect(favTab, findsOneWidget);
      await tester.tap(favTab);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('favorite_grid_delete_button')),
        findsWidgets,
      );
      expect(find.text('No favorites yet'), findsNothing);
    });

    ///Todo : fails due to issues ... to be fixed later
    testWidgets('Remove favorite from home and verify empty in favorites', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const PetFinderApp());
      await tester.pumpAndSettle();

      // Ensure clean state
      await clearFavorites(tester);

      await tester.pump(const Duration(seconds: 2));

      // Add a favorite from home first
      final favoriteSvgFinder = find.byKey(const Key('favorite_key'));
      if (favoriteSvgFinder.evaluate().isEmpty) {
        fail('No favorite toggle found on home list');
      }
      await tester.tap(favoriteSvgFinder.first);
      await tester.pumpAndSettle();

      // Navigate to favorites tab
      final favTab = find.byKey(const Key('bottom_nav_favorites'));
      await tester.tap(favTab);
      await tester.pumpAndSettle();

      // Delete from favorites grid via dedicated delete button
      final deleteBtn = find.byKey(const Key('favorite_grid_delete_button'));
      expect(deleteBtn, findsWidgets);
      await tester.tap(deleteBtn.first);
      await tester.pumpAndSettle();

      // Expect empty state after deletion
      expect(find.text('No favorites yet'), findsWidgets);
    });
  });
}
