import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favorite/data/models/add_favorite_request.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';
import 'package:pet_finder_app/features/favorite/data/repositories/favorite_repository.dart';

import '../../../core/helpers/test_helper.dart';
import '../../../core/helpers/test_setup.dart';

void main() {
  late MockFavoriteRemoteDataSource mockFavoriteRemoteDataSource;
  late FavoriteRepositoryImpl repository;

  setUpAll(setupTests);

  setUp(() {
    mockFavoriteRemoteDataSource = MockFavoriteRemoteDataSource();
    repository = FavoriteRepositoryImpl(
      remoteDataSource: mockFavoriteRemoteDataSource,
    );
  });

  group('Favorite Repository Testing Cycle', () {
    test('Fetch Favorites Successfully', () async {
      /// Arrange
      List<FavoriteBreed> fakeFavorites = List<FavoriteBreed>.filled(
        2,
        FakeFavoriteBreedModel(),
      );
      when(
        () => mockFavoriteRemoteDataSource.getFavorites(),
      ).thenAnswer((_) async => fakeFavorites);

      /// Act
      final result = await repository.fetchFavorites();
      result.when(
        success: (data) => expect(data, fakeFavorites),
        failure: (error) => null,
      );

      /// Assert
      verify(() => mockFavoriteRemoteDataSource.getFavorites()).called(1);
    });

    test('Fetch Favorites Failure', () async {
      Exception exception = Exception('Failed to load favorites');
      when(
        () => mockFavoriteRemoteDataSource.getFavorites(),
      ).thenThrow(exception);

      final result = await repository.fetchFavorites();

      result.when(
        success: (_) => fail('Expected failure but got success'),
        failure: (error) => expect(error, isNotNull),
      );
      verify(() => mockFavoriteRemoteDataSource.getFavorites()).called(1);
    });

    test('Add Favorite Successfully', () async {
      /// Arrange
      final request = AddFavoriteRequest(imageId: 'asho', subId: 'gZiG70w_u');
      final fakeResponse = FakeAddFavoriteResponse();
      when(
        () => mockFavoriteRemoteDataSource.addFavorite(request),
      ).thenAnswer((_) async => fakeResponse);

      /// Act
      final result = await repository.addFavorite(request);
      result.when(
        success: (data) => expect(data, fakeResponse),
        failure: (error) => null,
      );

      /// Assert
      verify(() => mockFavoriteRemoteDataSource.addFavorite(request)).called(1);
    });

    test('Add Favorite Failure', () async {
      /// Arrange
      final request = AddFavoriteRequest(imageId: 'asho', subId: 'gZiG70w_u');
      Exception exception = Exception('Failed to add favorite');
      when(
        () => mockFavoriteRemoteDataSource.addFavorite(request),
      ).thenThrow(exception);

      /// Act
      final result = await repository.addFavorite(request);

      /// Assert
      result.when(
        success: (_) => fail('Expected failure but got success'),
        failure: (error) => expect(error, isNotNull),
      );
      verify(() => mockFavoriteRemoteDataSource.addFavorite(request)).called(1);
    });

    test('Delete Favorite Successfully', () async {
      /// Arrange
      const favoriteId = 232551925;
      final fakeResponse = FakeDeleteFavoriteResponse();
      when(
        () => mockFavoriteRemoteDataSource.deleteFavorite(favoriteId),
      ).thenAnswer((_) async => fakeResponse);

      /// Act
      final result = await repository.deleteFavorite(favoriteId);
      result.when(
        success: (data) => expect(data, fakeResponse),
        failure: (error) => null,
      );

      /// Assert
      verify(
        () => mockFavoriteRemoteDataSource.deleteFavorite(favoriteId),
      ).called(1);
    });

    test('Delete Favorite Failure', () async {
      const favoriteId = 232551925;
      Exception exception = Exception('Failed to delete favorite');
      when(
        () => mockFavoriteRemoteDataSource.deleteFavorite(favoriteId),
      ).thenThrow(exception);

      final result = await repository.deleteFavorite(favoriteId);

      result.when(
        success: (_) => fail('Expected failure but got success'),
        failure: (error) => expect(error, isNotNull),
      );
      verify(
        () => mockFavoriteRemoteDataSource.deleteFavorite(favoriteId),
      ).called(1);
    });
  });
}
