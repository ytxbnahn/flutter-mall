// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..popup = json['popup'] == null
        ? null
        : Popup.fromJson(json['popup'] as Map<String, dynamic>)
    ..bannerList = (json['bannerList'] as List<dynamic>?)
        ?.map((e) => BannerListItem.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'popup': instance.popup,
      'bannerList': instance.bannerList,
    };

Popup _$PopupFromJson(Map<String, dynamic> json) {
  return Popup()
    ..background = json['background'] as String?
    ..url = json['url'] as String?;
}

Map<String, dynamic> _$PopupToJson(Popup instance) => <String, dynamic>{
      'background': instance.background,
      'url': instance.url,
    };

BannerListItem _$BannerListItemFromJson(Map<String, dynamic> json) {
  return BannerListItem()..id = json['id'] as int?;
}

Map<String, dynamic> _$BannerListItemToJson(BannerListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

IndexEntity _$IndexEntityFromJson(Map<String, dynamic> json) {
  return IndexEntity()
    ..msg = json['msg'] as String?
    ..code = json['code'] as int?
    ..data = json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IndexEntityToJson(IndexEntity instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
    };
