import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:pet_finder_app/features/home/data/repositories/home_repository.dart';

import '../../../../core/helpers/test_helper.dart';
import '../../../../core/helpers/test_setup.dart';

void main() {
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;
  late HomeRepositoryImpl repository;

  setUpAll(setupTests);

  setUp(() {
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(remoteDataSource: mockHomeRemoteDataSource);
  });

  group('Home Repository Testing Cycle ', () {
    test('Get Breeds Successfully', () async {
      ///Arrange
      ///I make FakeBreedModel to avoid big data of it
      List<BreedModel> fakeBreeds = List<BreedModel>.filled(
        10,
        FakeBreedModel(),
      );
      when(
        () => mockHomeRemoteDataSource.getBreedsPaginated(10, 0),
      ).thenAnswer((_) async => fakeBreeds);

      ///Act
      final result = await repository.getBreedsPaginated(10, 0);
      result.when(
        success: (data) => expect(data, fakeBreeds),
        failure: (error) => null,
      );

      ///Assert
      verify(
        () => mockHomeRemoteDataSource.getBreedsPaginated(10, 0),
      ).called(1);
    });

    test('Get Breeds Failure', () async {
      /// Arrange
      Exception exception = Exception('Failed to load breeds');
      when(
        () => mockHomeRemoteDataSource.getBreedsPaginated(10, 0),
      ).thenThrow(exception);

      /// Act
      final result = await repository.getBreedsPaginated(10, 0);

      /// Assert
      result.when(
        success: (_) => fail('Expected failure but got success'),
        failure: (error) => expect(error, isNotNull),
      );
      verify(
        () => mockHomeRemoteDataSource.getBreedsPaginated(10, 0),
      ).called(1);
    });
  });
}
