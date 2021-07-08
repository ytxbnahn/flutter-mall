import 'package:json_annotation/json_annotation.dart';
part 'index.g.dart';

@JsonSerializable()
class IndexData {
  Popup? popup;
  List<BannerListItem>? bannerList;
  List<BookItem>? bookList;
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
  BannerListItem();
  factory BannerListItem.fromJson(Map<String, dynamic> json) =>
      _$BannerListItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListItemToJson(this);
}
