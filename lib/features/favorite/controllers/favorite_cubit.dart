import 'package:bloc/bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favorite/data/models/add_favorite_request.dart';
import 'package:pet_finder_app/features/favorite/data/repositories/favorite_repository.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _repository;

  FavoriteCubit(this._repository) : super(const FavoriteState.initial());

  Future<void> getFavorites() async {
    emit(const FavoriteState.getFavoritesLoading());
    final result = await _repository.fetchFavorites();
    result.when(
      success: (favorites) {
        emit(FavoriteState.getFavoritesSuccess(favorites));
      },
      failure: (error) {
        emit(
          FavoriteState.getFavoritesFailure(
            error: error.message ?? 'Failed to fetch favorites',
          ),
        );
      },
    );
  }

  Future<void> addFavorite(String imageId, String subId) async {
    emit(const FavoriteState.addFavoriteLoading());
    final request = AddFavoriteRequest(imageId: imageId, subId: subId);
    final result = await _repository.addFavorite(request);
    result.when(
      success: (response) {
        emit(FavoriteState.addFavoriteSuccess(message: response.message));
        getFavorites(); // Refresh the favorites list
      },
      failure: (error) {
        emit(
          FavoriteState.addFavoriteFailure(
            error: error.message ?? 'Failed to add favorite',
          ),
        );
      },
    );
  }

  Future<void> deleteFavorite(int favoriteId) async {
    emit(const FavoriteState.deleteFavoriteLoading());
    final result = await _repository.deleteFavorite(favoriteId);
    result.when(
      success: (response) {
        emit(FavoriteState.deleteFavoriteSuccess( message : response.message));
        getFavorites();
      },
      failure: (error) {
        emit(
          FavoriteState.deleteFavoriteFailure(
            error: error.message ?? 'Failed to delete favorite',
          ),
        );
      },
    );
  }
}
