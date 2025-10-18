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

  FavoriteBreed({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });

  factory FavoriteBreed.fromJson(Map<String, dynamic> json) => _$FavoriteBreedFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteBreedToJson(this);
}
