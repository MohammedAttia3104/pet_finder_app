// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavoriteResponse _$AddFavoriteResponseFromJson(Map<String, dynamic> json) =>
    AddFavoriteResponse(
      message: json['message'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$AddFavoriteResponseToJson(
  AddFavoriteResponse instance,
) => <String, dynamic>{'message': instance.message, 'id': instance.id};
