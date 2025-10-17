import 'package:bloc/bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/routing/router_observer.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:pet_finder_app/features/home/data/repositories/home_repository.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(const HomeState.initial());

  ///pagination
  int _page = 0;
  bool hasReachedMax = false;
  List<BreedModel> breeds = [];
  bool isFetching = false;

  /// Counter for function calls
  int _getProductsCallCount = 0;

  /// Search variables
  String _lastSearchQuery = '';
  List<BreedModel> searchResults = [];
  bool isSearching = false;

  /// Breed details variable
  BreedModel? selectedBreed;

  Future<void> getBreedById(String id) async {
    emit(const HomeState.getBreedDetailsLoading());

    final response = await homeRepository.getBreedById(id);

    response.when(
      success: (breedData) {
        selectedBreed = breedData;
        if (!isClosed) {
          emit(HomeState.getBreedDetailsSuccess(breedData));
        }
        logger.i('getBreedById fetched breed: ${breedData.name}');
      },
      failure: (error) {
        if (!isClosed) {
          emit(HomeState.getBreedDetailsError(error.message.toString()));
        }
      },
    );
  }

  Future<void> searchBreeds(String query) async {
    if (query.isEmpty) {
      clearSearch();
      return;
    }

    if (_lastSearchQuery == query) {
      return;
    }

    _lastSearchQuery = query;
    isSearching = true;

    emit(const HomeState.searchBreedsLoading());

    final response = await homeRepository.searchBreeds(
      query,
      attachImage: true,
    );

    response.when(
      success: (breedsData) {
        searchResults = breedsData;
        if (!isClosed) {
          emit(HomeState.searchBreedsSuccess(breedsData));
        }
        logger.i(
          'searchBreeds found ${breedsData.length} results for query: $query',
        );
      },
      failure: (error) {
        if (!isClosed) {
          emit(HomeState.searchBreedsError(error.message.toString()));
        }
      },
    );
  }

  Future<void> getBreedsPaginated({bool isRefresh = false}) async {
    if (isFetching) return;
    isFetching = true;

    if (!isRefresh && hasReachedMax) {
      isFetching = false;
      return;
    }

    if (isRefresh) {
      _page = 0;
      hasReachedMax = false;
      breeds.clear();
    } else if (_page > 0) {
      emit(const HomeState.paginationLoading());
    } else {
      emit(const HomeState.getBreedsLoading());
    }

    final response = await homeRepository.getBreedsPaginated(10, _page);

    response.when(
      success: (breedsData) {
        if (breedsData.isEmpty) {
          hasReachedMax = true;
        } else {
          breeds.addAll(breedsData);
          _page++;
        }
        if (!isClosed) {
          emit(HomeState.getBreedsSuccess(breeds));
        }
        _getProductsCallCount++;
        logger.i(
          'getBreedsPaginated called $_getProductsCallCount times\n hasReachedMax: $hasReachedMax',
        );
      },
      failure: (error) {
        if (!isClosed) {
          emit(HomeState.getBreedsError(error.message.toString()));
        }
      },
    );
    isFetching = false;
    // _getProductsCallCount++;
  }

  void clearSearch() {
    _lastSearchQuery = '';
    searchResults.clear();
    isSearching = false;
    getBreedsPaginated(isRefresh: true);
  }
}
