import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_favorite_request.g.dart';

@JsonSerializable()
class AddFavoriteRequest {
  @JsonKey(name: 'image_id')
  final String imageId;
  @JsonKey(name: 'sub_id')
  final String subId;

  AddFavoriteRequest({required this.imageId, required this.subId});

  factory AddFavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavoriteRequestToJson(this);
}
