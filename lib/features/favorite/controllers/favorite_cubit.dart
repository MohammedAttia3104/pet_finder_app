import 'package:bloc/bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favorite/data/models/add_favorite_request.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';
import 'package:pet_finder_app/features/favorite/data/repositories/favorite_repository.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _repository;

  FavoriteCubit(this._repository) : super(const FavoriteState.initial());

  final List<FavoriteBreed> favorites = [];

  Future<void> getFavorites() async {
    emit(const FavoriteState.getFavoritesLoading());
    final result = await _repository.fetchFavorites();
    result.when(
      success: (favoritesData) {
        favorites.clear();
        favorites.addAll(favoritesData);
        emit(FavoriteState.getFavoritesSuccess(favoritesData));
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
    final tempFavorite = FavoriteBreed(
      id: DateTime.now().millisecondsSinceEpoch,
      userId: 'temp_user',
      imageId: imageId,
      subId: subId,
      createdAt: DateTime.now(),
      image: {},
    );

    favorites.add(tempFavorite);
    emit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

    final request = AddFavoriteRequest(imageId: imageId, subId: subId);
    final result = await _repository.addFavorite(request);

    result.when(
      success: (response) {
        favorites.removeWhere((fav) => fav.id == tempFavorite.id);

        final realFavorite = FavoriteBreed(
          id: response.id,
          userId: tempFavorite.userId,
          imageId: imageId,
          subId: subId,
          createdAt: DateTime.now(),
          image: {},
        );

        favorites.add(realFavorite);

        emit(FavoriteState.addFavoriteSuccess(message: response.message));
        emit(FavoriteState.getFavoritesSuccess(List.from(favorites)));
      },
      failure: (error) {
        favorites.removeWhere((fav) => fav.id == tempFavorite.id);
        emit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

        emit(
          FavoriteState.addFavoriteFailure(
            error: error.message ?? 'Failed to add favorite',
          ),
        );
      },
    );
  }

  Future<void> deleteFavorite(int favoriteId) async {
    final removedFavorite = favorites.firstWhere(
      (favorite) => favorite.id == favoriteId,
      orElse: () => favorites.isNotEmpty
          ? favorites.first
          : FavoriteBreed(
              id: favoriteId,
              userId: '',
              imageId: '',
              subId: '',
              createdAt: DateTime.now(),
              image: {},
            ),
    );

    favorites.removeWhere((favorite) => favorite.id == favoriteId);
    emit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

    final result = await _repository.deleteFavorite(favoriteId);
    result.when(
      success: (response) {
        emit(FavoriteState.deleteFavoriteSuccess(message: response.message));

        emit(FavoriteState.getFavoritesSuccess(List.from(favorites)));
      },
      failure: (error) {
        favorites.add(removedFavorite);
        emit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

        emit(
          FavoriteState.deleteFavoriteFailure(
            error: error.message ?? 'Failed to delete favorite',
          ),
        );
      },
    );
  }

  /// Check if a breed is favorited by imageId
  bool isFavorited(String imageId) {
    return favorites.any((favorite) => favorite.imageId == imageId);
  }

  /// Get favorite ID by imageId
  int? getFavoriteId(String imageId) {
    try {
      return favorites.firstWhere((favorite) => favorite.imageId == imageId).id;
    } catch (e) {
      return null;
    }
  }
}
