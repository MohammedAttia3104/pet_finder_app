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
class FakeBreedModel extends Fake implements BreedModel {
  @override
  String get id => 'sibe';

  @override
  String get name => 'Siberian';

  @override
  String get origin => 'Russia';

  @override
  String? get referenceImageId => 'test_image_id';

  @override
  Weight get weight => FakeWeight();

  @override
  String get temperament => 'Playful, Affectionate';

  @override
  String get description => 'Test description';

  @override
  String get lifeSpan => '12-15';

  @override
  int get indoor => 1;

  @override
  int? get lap => 1;

  @override
  int get adaptability => 4;

  @override
  int get affectionLevel => 5;

  @override
  int get childFriendly => 4;

  @override
  int get dogFriendly => 3;

  @override
  int get energyLevel => 4;

  @override
  int get grooming => 3;

  @override
  int get healthIssues => 2;

  @override
  int get intelligence => 5;

  @override
  int get sheddingLevel => 4;

  @override
  int get socialNeeds => 4;

  @override
  int get strangerFriendly => 3;

  @override
  int get vocalisation => 3;

  @override
  int get hypoallergenic => 0;

  @override
  int get rare => 0;

  @override
  int get hairless => 0;

  @override
  int get rex => 0;

  @override
  int get natural => 1;

  @override
  String get countryCodes => 'RU';

  @override
  String get countryCode => 'RU';
}

class FakeWeight extends Fake implements Weight {
  @override
  String get imperial => '8-15';

  @override
  String get metric => '4-7';
}

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

  @override
  String? get breedName => null;

  @override
  String? get breedOrigin => null;

  @override
  String? get breedImageUrl => null;

  @override
  FavoriteBreed copyWith({
    int? id,
    String? userId,
    String? imageId,
    String? subId,
    DateTime? createdAt,
    Map<String, dynamic>? image,
    String? breedName,
    String? breedOrigin,
    String? breedImageUrl,
  }) {
    return FakeFavoriteBreedModelWithData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageId: imageId ?? this.imageId,
      subId: subId ?? this.subId,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      breedName: breedName ?? this.breedName,
      breedOrigin: breedOrigin ?? this.breedOrigin,
      breedImageUrl: breedImageUrl ?? this.breedImageUrl,
    );
  }
}

class FakeFavoriteBreedModelWithData extends Fake implements FavoriteBreed {
  @override
  final int id;

  @override
  final String userId;

  @override
  final String imageId;

  @override
  final String subId;

  @override
  final DateTime createdAt;

  @override
  final Map<String, dynamic> image;

  @override
  final String? breedName;

  @override
  final String? breedOrigin;

  @override
  final String? breedImageUrl;

  FakeFavoriteBreedModelWithData({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
    this.breedName,
    this.breedOrigin,
    this.breedImageUrl,
  });

  @override
  FavoriteBreed copyWith({
    int? id,
    String? userId,
    String? imageId,
    String? subId,
    DateTime? createdAt,
    Map<String, dynamic>? image,
    String? breedName,
    String? breedOrigin,
    String? breedImageUrl,
  }) {
    return FakeFavoriteBreedModelWithData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageId: imageId ?? this.imageId,
      subId: subId ?? this.subId,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      breedName: breedName ?? this.breedName,
      breedOrigin: breedOrigin ?? this.breedOrigin,
      breedImageUrl: breedImageUrl ?? this.breedImageUrl,
    );
  }
}

class FakeAddFavoriteResponse extends Fake implements AddFavoriteResponse {
  @override
  String get message => 'SUCCESS';

  @override
  int get id => 232551925;
}

class FakeDeleteFavoriteResponse extends Fake
    implements DeleteFavoriteResponse {
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
