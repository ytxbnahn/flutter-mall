import 'package:json_annotation/json_annotation.dart';
part 'index.g.dart';

@JsonSerializable()
class Data {
  Popup? popup;
  List<BannerListItem>? bannerList;
  Data();
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
class BannerListItem {
  int? id;
  BannerListItem();
  factory BannerListItem.fromJson(Map<String, dynamic> json) =>
      _$BannerListItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListItemToJson(this);
}

@JsonSerializable()
class IndexEntity {
  String? msg;
  int? code;
  Data? data;
  IndexEntity();

  factory IndexEntity.fromJson(Map<String, dynamic> json) =>
      _$IndexEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IndexEntityToJson(this);
}
