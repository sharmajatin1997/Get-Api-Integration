import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';
@JsonSerializable(genericArgumentFactories: true, includeIfNull: false, explicitToJson: true)
class DataResponse<TModel> {
  int? code;
  bool? status;
  String? message;
  TModel? body;

  DataResponse({this.code, this.status, this.message, this.body});

  factory DataResponse.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$DataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$DataResponseToJson(this, toJsonT);
}
