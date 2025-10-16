import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/controllers/home_cubit.dart';
import 'package:pet_finder_app/features/home/controllers/home_state.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';

import '../../../core/helpers/test_helper.dart';
import '../../../core/helpers/test_setup.dart';

void main() {
  late MockHomeRepository mockHomeRepository;
  late HomeCubit homeCubit;

  setUpAll(setupTests);

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    homeCubit = HomeCubit(homeRepository: mockHomeRepository);
  });

  tearDown(() => homeCubit.close());

  List<BreedModel> generateFakeBreeds(int count) {
    return List.generate(count, (_) => FakeBreedModel());
  }

  group('getBreedsPaginated - Basic Success', () {
    blocTest<HomeCubit, HomeState>(
      'emit [loading, success] on first call',
      build: () {
        when(
          () => mockHomeRepository.getBreedsPaginated(10, 0),
        ).thenAnswer((_) async => ApiResult.success(generateFakeBreeds(10)));
        return homeCubit;
      },
      act: (cubit) => cubit.getBreedsPaginated(),
      expect: () => [
        const HomeState.getBreedsLoading(),
        isA<BreedsSuccess>().having(
          (state) => state.breeds.length,
          'breeds length',
          10,
        ),
      ],
      verify: (cubit) {
        verify(() => mockHomeRepository.getBreedsPaginated(10, 0)).called(1);
        expect(cubit.breeds.length, 10);
        expect(cubit.isFetching, false);
        expect(cubit.hasReachedMax, false);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'IsRefresh mechanism working properly',
      build: () {
        when(
          () => mockHomeRepository.getBreedsPaginated(10, 0),
        ).thenAnswer((_) async => ApiResult.success(generateFakeBreeds(10)));
        return homeCubit;
      },
      act: (bloc) async => await bloc.getBreedsPaginated(isRefresh: true),
      expect: () => [
        // On refresh, cubit does not emit loading; only success is emitted
        isA<BreedsSuccess>().having(
          (state) => state.breeds.length,
          'breeds length after refresh',
          10,
        ),
      ],
      verify: (cubit) {
        verify(() => mockHomeRepository.getBreedsPaginated(10, 0)).called(1);
        expect(cubit.breeds.length, 10);
        expect(cubit.isFetching, false);
        expect(cubit.hasReachedMax, false);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emit [loading, error] on failure',
      build: () {
        when(() => mockHomeRepository.getBreedsPaginated(10, 0)).thenAnswer(
          (_) async => ApiResult.failure(
            ApiErrorModel.fromJson({'message': 'Failed to load breeds'}),
          ),
        );
        return homeCubit;
      },
      act: (cubit) => cubit.getBreedsPaginated(),
      expect: () => [
        const HomeState.getBreedsLoading(),
        isA<BreedsError>().having(
          (state) => state.message,
          'error message',
          contains('Failed to load breeds'),
        ),
      ],
      verify: (cubit) {
        verify(() => mockHomeRepository.getBreedsPaginated(10, 0)).called(1);
        expect(cubit.breeds.length, 0);
        expect(cubit.isFetching, false);
        expect(cubit.hasReachedMax, false);
      },
    );

    ///Todo: Pagination Testing
    ///Pagination Testing did not work as expected in blocTest
    // blocTest<HomeCubit, HomeState>(
    //   'emit correct states for multiple paginated calls',
    //   build: () {
    //     when(() => mockHomeRepository.getBreedsPaginated(10, 0)).thenAnswer((
    //       _,
    //     ) async {
    //       return ApiResult.success(generateFakeBreeds(10));
    //     });
    //     when(() => mockHomeRepository.getBreedsPaginated(10, 1)).thenAnswer((
    //       _,
    //     ) async {
    //       return ApiResult.success(generateFakeBreeds(10));
    //     });
    //     when(() => mockHomeRepository.getBreedsPaginated(10, 2)).thenAnswer((
    //       _,
    //     ) async {
    //       return ApiResult.success(generateFakeBreeds(10));
    //     });
    //     return homeCubit;
    //   },
    //   act: (cubit) async {
    //     await cubit.getBreedsPaginated();
    //     await cubit.getBreedsPaginated();
    //     await cubit.getBreedsPaginated();
    //   },
    //   expect: () => [
    //     const HomeState.getBreedsLoading(),
    //     isA<BreedsSuccess>().having(
    //       (state) => state.breeds.length,
    //       'breeds length after first call',
    //       10,
    //     ),
    //     const HomeState.paginationLoading(),
    //     isA<BreedsSuccess>().having(
    //       (state) => state.breeds.length,
    //       'breeds length after second call',
    //       20,
    //     ),
    //     const HomeState.paginationLoading(),
    //     isA<BreedsSuccess>().having(
    //       (state) => state.breeds.length,
    //       'breeds length after third call',
    //       30,
    //     ),
    //   ],
    //   verify: (cubit) {
    //     verify(() => mockHomeRepository.getBreedsPaginated(10, 0)).called(1);
    //     verify(() => mockHomeRepository.getBreedsPaginated(10, 1)).called(1);
    //     verify(() => mockHomeRepository.getBreedsPaginated(10, 2)).called(1);
    //     expect(cubit.breeds.length, 30);
    //   },
    // );
  });
}
