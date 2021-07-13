// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return BaseResponse<T>(
    status: json['status'] as int?,
    msg: json['msg'] as String?,
    data: BaseResponse._dataFromJson(json['data'] as Object),
  );
}
