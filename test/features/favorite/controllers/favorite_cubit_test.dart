import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/controllers/favorite_state.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';

import '../../../core/helpers/test_helper.dart';
import '../../../core/helpers/test_setup.dart';

void main() {
  late MockFavoriteRepository mockFavoriteRepository;
  late FavoriteCubit favoriteCubit;

  setUpAll(setupTests);

  setUp(() {
    mockFavoriteRepository = MockFavoriteRepository();
    favoriteCubit = FavoriteCubit(mockFavoriteRepository);
  });

  tearDown(() => favoriteCubit.close());

  List<FavoriteBreed> generateFakeFavorites(int count) {
    return List.generate(count, (_) => FakeFavoriteBreedModel());
  }

  group('getFavorites - Basic Success', () {
    blocTest<FavoriteCubit, FavoriteState>(
      'emit [loading, success] on first call',
      build: () {
        when(
          () => mockFavoriteRepository.fetchFavorites(),
        ).thenAnswer((_) async => ApiResult.success(generateFakeFavorites(2)));
        return favoriteCubit;
      },
      act: (cubit) => cubit.getFavorites(),
      expect: () => [
        const FavoriteState.getFavoritesLoading(),
        isA<GetFavoritesSuccess>().having(
          (state) => state.favorites.length,
          'favorites length',
          2,
        ),
      ],
      verify: (cubit) {
        verify(() => mockFavoriteRepository.fetchFavorites()).called(1);
      },
    );

    blocTest<FavoriteCubit, FavoriteState>(
      'emit [loading, error] on failure',
      build: () {
        when(() => mockFavoriteRepository.fetchFavorites()).thenAnswer(
          (_) async => ApiResult.failure(
            ApiErrorModel.fromJson({'message': 'Failed to load favorites'}),
          ),
        );
        return favoriteCubit;
      },
      act: (cubit) => cubit.getFavorites(),
      expect: () => [
        const FavoriteState.getFavoritesLoading(),
        isA<GetFavoritesFailure>().having(
          (state) => state.error,
          'error message',
          contains('Failed to load favorites'),
        ),
      ],
      verify: (cubit) {
        verify(() => mockFavoriteRepository.fetchFavorites()).called(1);
      },
    );
  });

  group('addFavorite - Basic Success', () {
    blocTest<FavoriteCubit, FavoriteState>(
      'emit [loading, success, loading, success] on add favorite',
      build: () {
        when(
          () => mockFavoriteRepository.addFavorite(any()),
        ).thenAnswer((_) async => ApiResult.success(FakeAddFavoriteResponse()));
        when(
          () => mockFavoriteRepository.fetchFavorites(),
        ).thenAnswer((_) async => ApiResult.success(generateFakeFavorites(1)));
        return favoriteCubit;
      },
      act: (cubit) => cubit.addFavorite('sibe', 'gZiG70w_u'),
      expect: () => [
        const FavoriteState.addFavoriteLoading(),
        isA<AddFavoriteSuccess>(),
        const FavoriteState.getFavoritesLoading(),
        isA<GetFavoritesSuccess>().having(
          (state) => state.favorites.length,
          'favorites length after add',
          1,
        ),
      ],
      verify: (cubit) {
        verify(() => mockFavoriteRepository.addFavorite(any())).called(1);
        verify(() => mockFavoriteRepository.fetchFavorites()).called(1);
      },
    );

    blocTest<FavoriteCubit, FavoriteState>(
      'emit [loading, error] on add favorite failure',
      build: () {
        when(() => mockFavoriteRepository.addFavorite(any())).thenAnswer(
          (_) async => ApiResult.failure(
            ApiErrorModel.fromJson({'message': 'Failed to add favorite'}),
          ),
        );
        return favoriteCubit;
      },
      act: (cubit) => cubit.addFavorite('asho', 'gZiG70w_u'),
      expect: () => [
        const FavoriteState.addFavoriteLoading(),
        isA<AddFavoriteFailure>().having(
          (state) => state.error,
          'error message',
          contains('Failed to add favorite'),
        ),
      ],
      verify: (cubit) {
        verify(() => mockFavoriteRepository.addFavorite(any())).called(1);
      },
    );
  });

  group('deleteFavorite - Basic Success', () {
    blocTest<FavoriteCubit, FavoriteState>(
      'emit [loading, success, loading, success] on delete favorite',
      build: () {
        when(() => mockFavoriteRepository.deleteFavorite(any())).thenAnswer(
          (_) async => ApiResult.success(FakeDeleteFavoriteResponse()),
        );
        when(
          () => mockFavoriteRepository.fetchFavorites(),
        ).thenAnswer((_) async => ApiResult.success(generateFakeFavorites(0)));
        return favoriteCubit;
      },
      act: (cubit) => cubit.deleteFavorite(232551924),
      expect: () => [
        const FavoriteState.deleteFavoriteLoading(),
        isA<DeleteFavoriteSuccess>(),
        const FavoriteState.getFavoritesLoading(),
        isA<GetFavoritesSuccess>().having(
          (state) => state.favorites.length,
          'favorites length after delete',
          0,
        ),
      ],
      verify: (cubit) {
        verify(() => mockFavoriteRepository.deleteFavorite(any())).called(1);
        verify(() => mockFavoriteRepository.fetchFavorites()).called(1);
      },
    );

    blocTest<FavoriteCubit, FavoriteState>(
      'emit [loading, error] on delete favorite failure',
      build: () {
        when(() => mockFavoriteRepository.deleteFavorite(any())).thenAnswer(
          (_) async => ApiResult.failure(
            ApiErrorModel.fromJson({'message': 'Failed to delete favorite'}),
          ),
        );
        return favoriteCubit;
      },
      act: (cubit) => cubit.deleteFavorite(232551925),
      expect: () => [
        const FavoriteState.deleteFavoriteLoading(),
        isA<DeleteFavoriteFailure>().having(
          (state) => state.error,
          'error message',
          contains('Failed to delete favorite'),
        ),
      ],
      verify: (cubit) {
        verify(() => mockFavoriteRepository.deleteFavorite(any())).called(1);
      },
    );
  });
}
