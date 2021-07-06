// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Base<T> _$BaseFromJson<T>(Map<String, dynamic> json) {
  return Base<T>()
    ..msg = json['msg'] as String?
    ..code = json['code'] as int?;
}

Map<String, dynamic> _$BaseToJson<T>(Base<T> instance) => <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
    };
