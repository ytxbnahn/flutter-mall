import 'package:json_annotation/json_annotation.dart';
part 'base.g.dart';

@JsonSerializable()
class Base<T> {
  String? msg;
  int? code;
  Base();

  factory Base.fromJson(Map<String, dynamic> json) => _$BaseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseToJson(this);
}
