import 'package:bloc/bloc.dart';
import 'package:pet_finder_app/core/extensions/image_url_extension.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favorite/data/models/add_favorite_request.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';
import 'package:pet_finder_app/features/favorite/data/repositories/favorite_repository.dart';
import 'package:pet_finder_app/features/home/data/repositories/home_repository.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _repository;
  final HomeRepository _homeRepository;

  FavoriteCubit(this._repository, this._homeRepository) : super(const FavoriteState.initial());

  final List<FavoriteBreed> favorites = [];

  void _safeEmit(FavoriteState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> getFavorites() async {
    _safeEmit(const FavoriteState.getFavoritesLoading());
    final result = await _repository.fetchFavorites();

    await result.when(
      success: (favoritesData) async {
        favorites.clear();

        // Fetch breed details for each favorite
        final enrichedFavorites = <FavoriteBreed>[];
        for (var favorite in favoritesData) {
          // Fetch breed details using imageId (which is the breed ID)
          final breedResult = await _homeRepository.getBreedById(favorite.imageId);

          await breedResult.when(
            success: (breed) {
              // Add breed data to favorite
              final enrichedFavorite = favorite.copyWith(
                breedName: breed.name,
                breedOrigin: breed.origin,
                breedImageUrl: breed.referenceImageId?.toImageUrl(),
              );
              enrichedFavorites.add(enrichedFavorite);
            },
            failure: (error) {
              // If breed fetch fails, add favorite without breed data
              enrichedFavorites.add(favorite);
            },
          );
        }

        favorites.addAll(enrichedFavorites);
        _safeEmit(FavoriteState.getFavoritesSuccess(enrichedFavorites));
      },
      failure: (error) {
        _safeEmit(
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
    _safeEmit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

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

        _safeEmit(FavoriteState.addFavoriteSuccess(message: response.message));
        _safeEmit(FavoriteState.getFavoritesSuccess(List.from(favorites)));
      },
      failure: (error) {
        favorites.removeWhere((fav) => fav.id == tempFavorite.id);
        _safeEmit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

        _safeEmit(
          FavoriteState.addFavoriteFailure(
            error: error.message ?? 'Failed to add favorite',
          ),
        );
      },
    );
  }

  Future<void> deleteFavorite(int favoriteId) async {
    /// Integration Test Check - Prevent deletion of temporary favorites
    if (favoriteId > 1000000000000) {
      _safeEmit(
        const FavoriteState.deleteFavoriteFailure(
          error: 'Please wait for the favorite to be saved before removing it',
        ),
      );
      return;
    }

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
    _safeEmit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

    final result = await _repository.deleteFavorite(favoriteId);
    result.when(
      success: (response) {
        _safeEmit(FavoriteState.deleteFavoriteSuccess(message: response.message));

        _safeEmit(FavoriteState.getFavoritesSuccess(List.from(favorites)));
      },
      failure: (error) {
        favorites.add(removedFavorite);
        _safeEmit(FavoriteState.getFavoritesSuccess(List.from(favorites)));

        _safeEmit(
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
