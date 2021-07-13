// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexData _$IndexDataFromJson(Map<String, dynamic> json) {
  return IndexData()
    ..popup = json['popup'] == null
        ? null
        : Popup.fromJson(json['popup'] as Map<String, dynamic>)
    ..bannerList = (json['bannerList'] as List<dynamic>?)
        ?.map((e) => BannerListItem.fromJson(e as Map<String, dynamic>))
        .toList()
    ..bookList = (json['bookList'] as List<dynamic>?)
        ?.map((e) => BookItem.fromJson(e as Map<String, dynamic>))
        .toList()
    ..bookSetList = (json['bookSetList'] as List<dynamic>?)
        ?.map((e) => BookSetItem.fromJson(e as Map<String, dynamic>))
        .toList()
    ..otherBookSet = json['otherBookSet'] == null
        ? null
        : OtherBookSet.fromJson(json['otherBookSet'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IndexDataToJson(IndexData instance) => <String, dynamic>{
      'popup': instance.popup,
      'bannerList': instance.bannerList,
      'bookList': instance.bookList,
      'bookSetList': instance.bookSetList,
      'otherBookSet': instance.otherBookSet,
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

BookSetItem _$BookSetItemFromJson(Map<String, dynamic> json) {
  return BookSetItem()
    ..banner = json['banner'] as String?
    ..setName = json['setName'] as String?
    ..icon = json['icon'] as String?;
}

Map<String, dynamic> _$BookSetItemToJson(BookSetItem instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'setName': instance.setName,
      'icon': instance.icon,
    };

OtherBookSet _$OtherBookSetFromJson(Map<String, dynamic> json) {
  return OtherBookSet()
    ..banner = json['banner'] as String?
    ..pageUrl = json['pageUrl'] as String?
    ..id = json['id'] as int?;
}

Map<String, dynamic> _$OtherBookSetToJson(OtherBookSet instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'pageUrl': instance.pageUrl,
      'id': instance.id,
    };

BookItem _$BookItemFromJson(Map<String, dynamic> json) {
  return BookItem()
    ..id = json['id'] as int?
    ..bookname = json['bookname'] as String?
    ..bookabstract = json['bookabstract'] as String?
    ..cover = json['cover'] as String?
    ..author = json['author'] as String?
    ..publishHouse = json['publishHouse'] as String?
    ..markPrice = json['markPrice'] as int?
    ..retailPrice = json['retailPrice'] as int?
    ..remainingQuantity = json['remainingQuantity'] as int?
    ..canbuy = json['canbuy'] as bool?
    ..recommendText = json['recommendText'] as String?
    ..bookcatalog = json['bookcatalog'] as String?
    ..pages = json['pages'] as String?
    ..bookbref = json['bookbref'] as String?;
}

Map<String, dynamic> _$BookItemToJson(BookItem instance) => <String, dynamic>{
      'id': instance.id,
      'bookname': instance.bookname,
      'bookabstract': instance.bookabstract,
      'cover': instance.cover,
      'author': instance.author,
      'publishHouse': instance.publishHouse,
      'markPrice': instance.markPrice,
      'retailPrice': instance.retailPrice,
      'remainingQuantity': instance.remainingQuantity,
      'canbuy': instance.canbuy,
      'recommendText': instance.recommendText,
      'bookcatalog': instance.bookcatalog,
      'pages': instance.pages,
      'bookbref': instance.bookbref,
    };

BannerListItem _$BannerListItemFromJson(Map<String, dynamic> json) {
  return BannerListItem()
    ..id = json['id'] as int?
    ..coverUrl = json['coverUrl'] as String?
    ..redirectUrl = json['redirectUrl'] as String?;
}

Map<String, dynamic> _$BannerListItemToJson(BannerListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coverUrl': instance.coverUrl,
      'redirectUrl': instance.redirectUrl,
    };

HotPaginationResultType _$HotPaginationResultTypeFromJson(
    Map<String, dynamic> json) {
  return HotPaginationResultType(
    list: (json['list'] as List<dynamic>)
        .map((e) => BookItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HotPaginationResultTypeToJson(
        HotPaginationResultType instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
