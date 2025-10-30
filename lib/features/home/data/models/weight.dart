import 'package:json_annotation/json_annotation.dart';

part 'weight.g.dart';

@JsonSerializable()
class Weight {
  @JsonKey(name: "imperial")
  String imperial;
  @JsonKey(name: "metric")
  String metric;

  Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}
