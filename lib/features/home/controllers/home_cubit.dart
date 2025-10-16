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
        logger.i('getBreedsPaginated called $_getProductsCallCount times');
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
}
