import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/features/favorite/data/data_sources/favorite_remote_data_source.dart';
import 'package:pet_finder_app/features/favorite/data/models/add_favorite_request.dart';
import 'package:pet_finder_app/features/favorite/data/models/add_favorite_response.dart';
import 'package:pet_finder_app/features/favorite/data/models/delete_favorite_response.dart';
import 'package:pet_finder_app/features/favorite/data/models/favorite_breed.dart';
import 'package:pet_finder_app/features/favorite/data/repositories/favorite_repository.dart';
import 'package:pet_finder_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:pet_finder_app/features/home/data/models/breed_model.dart';
import 'package:pet_finder_app/features/home/data/models/weight.dart';
import 'package:pet_finder_app/features/home/data/repositories/home_repository.dart';

///Global
class MockDio extends Mock implements Dio {}

///Home
//Models
class FakeBreedModel extends Fake implements BreedModel {}

class FakeWeight extends Fake implements Weight {}

//Data Sources
class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

//Repositories
class MockHomeRepository extends Mock implements HomeRepository {}

///Favorite
//Models
class FakeAddFavoriteRequest extends Fake implements AddFavoriteRequest {}

class FakeFavoriteBreedModel extends Fake implements FavoriteBreed {
  @override
  int get id => 232551924;

  @override
  String get userId => 'ot8jc4';

  @override
  String get imageId => 'sibe';

  @override
  String get subId => 'gZiG70w_u';

  @override
  DateTime get createdAt => DateTime.parse('2025-10-18T09:17:28.000Z');

  @override
  Map<String, dynamic> get image => {};
}

class FakeAddFavoriteResponse extends Fake implements AddFavoriteResponse {
  @override
  String get message => 'SUCCESS';

  @override
  int get id => 232551925;
}

class FakeDeleteFavoriteResponse extends Fake implements DeleteFavoriteResponse {
  @override
  String get message => 'SUCCESS';
}

//Data Sources
class MockFavoriteRemoteDataSource extends Mock
    implements FavoriteRemoteDataSource {}

//Repositories
class MockFavoriteRepository extends Mock implements FavoriteRepository {}

///Only Used for Custom Models
void registerTestFallbacks() {
  registerFallbackValue(FakeBreedModel());
  registerFallbackValue(FakeWeight());
  registerFallbackValue(FakeAddFavoriteRequest());
  registerFallbackValue(FakeFavoriteBreedModel());
  registerFallbackValue(FakeAddFavoriteResponse());
  registerFallbackValue(FakeDeleteFavoriteResponse());
}
