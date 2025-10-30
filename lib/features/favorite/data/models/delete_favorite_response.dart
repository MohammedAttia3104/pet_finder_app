import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_favorite_response.g.dart';

@JsonSerializable()
class DeleteFavoriteResponse {
  final String message;

  DeleteFavoriteResponse({required this.message});

  factory DeleteFavoriteResponse.fromJson(Map<String, dynamic> json) => _$DeleteFavoriteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteFavoriteResponseToJson(this);
}