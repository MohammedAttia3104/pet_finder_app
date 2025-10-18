// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteBreed _$FavoriteBreedFromJson(Map<String, dynamic> json) =>
    FavoriteBreed(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String,
      imageId: json['image_id'] as String,
      subId: json['sub_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      image: json['image'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$FavoriteBreedToJson(FavoriteBreed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image_id': instance.imageId,
      'sub_id': instance.subId,
      'created_at': instance.createdAt.toIso8601String(),
      'image': instance.image,
    };
