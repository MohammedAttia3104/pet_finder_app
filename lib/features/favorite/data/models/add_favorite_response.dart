import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_favorite_response.g.dart';

@JsonSerializable()
class AddFavoriteResponse {
  final String message;
  final int id;

  AddFavoriteResponse({required this.message, required this.id});

  factory AddFavoriteResponse.fromJson(Map<String, dynamic> json) => _$AddFavoriteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddFavoriteResponseToJson(this);
}
