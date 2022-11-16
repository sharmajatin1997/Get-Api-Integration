import 'package:json_annotation/json_annotation.dart';

part 'page_response.g.dart';

@JsonSerializable(genericArgumentFactories: true,includeIfNull: false, explicitToJson: true)
class PageResponse<TModel>{

  int? success;
  bool? status;
  int? code;
  String? message;
  List<TModel>? body;
  int? currentPage;
  int? totalPage;
  int? limit;

  PageResponse({this.success, this.status, this.code, this.message, this.body,this.currentPage,this.totalPage,this.limit});

  factory PageResponse.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$PageResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$PageResponseToJson(this, toJsonT);
}