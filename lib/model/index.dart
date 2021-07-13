import 'package:json_annotation/json_annotation.dart';
part 'index.g.dart';

@JsonSerializable()
class IndexData {
  Popup? popup;
  List<BannerListItem>? bannerList;
  List<BookItem>? bookList;
  List<BookSetItem>? bookSetList;
  OtherBookSet? otherBookSet;
  IndexData();
  factory IndexData.fromJson(Map<String, dynamic> json) =>
      _$IndexDataFromJson(json);

  Map<String, dynamic> toJson() => _$IndexDataToJson(this);
}

@JsonSerializable()
class Popup {
  String? background;
  String? url;
  Popup();

  factory Popup.fromJson(Map<String, dynamic> json) => _$PopupFromJson(json);

  Map<String, dynamic> toJson() => _$PopupToJson(this);
}

@JsonSerializable()
class BookSetItem {
  String? banner;
  String? setName;
  String? icon;
  BookSetItem();
  factory BookSetItem.fromJson(Map<String, dynamic> json) =>
      _$BookSetItemFromJson(json);

  Map<String, dynamic> toJson() => _$BookSetItemToJson(this);
}

@JsonSerializable()
class OtherBookSet {
  String? banner;
  String? pageUrl;
  int? id;
  OtherBookSet();
  factory OtherBookSet.fromJson(Map<String, dynamic> json) =>
      _$OtherBookSetFromJson(json);

  Map<String, dynamic> toJson() => _$OtherBookSetToJson(this);
}

@JsonSerializable()
class BookItem {
  int? id;
  String? bookname;
  String? bookabstract;
  String? cover;
  String? author;
  String? publishHouse;
  int? markPrice;
  int? retailPrice;
  int? remainingQuantity;
  bool? canbuy;
  String? recommendText;
  String? bookcatalog;
  String? pages;
  String? bookbref;

  BookItem();
  factory BookItem.fromJson(Map<String, dynamic> json) =>
      _$BookItemFromJson(json);

  Map<String, dynamic> toJson() => _$BookItemToJson(this);
}

@JsonSerializable()
class BannerListItem {
  int? id;
  String? coverUrl;
  String? redirectUrl;
  BannerListItem();
  factory BannerListItem.fromJson(Map<String, dynamic> json) =>
      _$BannerListItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListItemToJson(this);
}

@JsonSerializable()
class HotPaginationResultType {
  final List<BookItem> list;
  const HotPaginationResultType({required this.list});
  factory HotPaginationResultType.fromJson(Map<String, dynamic> json) =>
      _$HotPaginationResultTypeFromJson(json);

  Map<String, dynamic> toJson() => _$HotPaginationResultTypeToJson(this);
}
