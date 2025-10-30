import 'package:json_annotation/json_annotation.dart';

part 'favorite_breed.g.dart';

@JsonSerializable()
class FavoriteBreed {
  final int id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'image_id')
  final String imageId;
  @JsonKey(name: 'sub_id')
  final String subId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Map<String, dynamic> image;

  // Optional breed data (fetched separately)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? breedName;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? breedOrigin;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? breedImageUrl;

  FavoriteBreed({
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

  factory FavoriteBreed.fromJson(Map<String, dynamic> json) => _$FavoriteBreedFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteBreedToJson(this);

  // Copy with method to add breed data
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
    return FavoriteBreed(
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
