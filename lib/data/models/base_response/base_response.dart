import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'cod')
  final String code;
  final int message;
  @JsonKey(name: 'list', includeIfNull: false)
  final T data;

  const BaseResponse(this.code, this.message, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);
}