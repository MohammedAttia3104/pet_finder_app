// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavoriteRequest _$AddFavoriteRequestFromJson(Map<String, dynamic> json) =>
    AddFavoriteRequest(
      imageId: json['image_id'] as String,
      subId: json['sub_id'] as String,
    );

Map<String, dynamic> _$AddFavoriteRequestToJson(AddFavoriteRequest instance) =>
    <String, dynamic>{'image_id': instance.imageId, 'sub_id': instance.subId};
