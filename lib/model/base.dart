import 'package:json_annotation/json_annotation.dart';
import 'index.dart';
part 'base.g.dart';

// An example highlighting the problem outlined in
// https://github.com/google/json_serializable.dart/issues/646
// https://github.com/google/json_serializable.dart/issues/671

@JsonSerializable(createToJson: false)
class BaseResponse<T> {
  final int? status;
  final String? msg;

  @JsonKey(fromJson: _dataFromJson)
  final T data;

  const BaseResponse({
    this.status,
    this.msg,
    required this.data,
  });
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  /// Decodes [json] by "inspecting" its contents.
  static T _dataFromJson<T>(Object json) {
    if (json is Map<String, dynamic>) {
      if (IndexData == T) {
        return IndexData.fromJson(json) as T;
      } else if (HotPaginationResultType == T) {
        return HotPaginationResultType.fromJson(json) as T;
      }
    }
    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}
