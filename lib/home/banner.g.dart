// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return new Banner(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : new Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

abstract class _$BannerSerializerMixin {
  List<Data> get data;
  int get errorCode;
  String get errorMsg;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
        'errorCode': errorCode,
        'errorMsg': errorMsg
      };
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return new Data(
      json['desc'] as String,
      json['id'] as int,
      json['imagePath'] as String,
      json['isVisible'] as int,
      json['order'] as int,
      json['title'] as String,
      json['type'] as int,
      json['url'] as String);
}

abstract class _$DataSerializerMixin {
  String get desc;
  int get id;
  String get imagePath;
  int get isVisible;
  int get order;
  String get title;
  int get type;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'desc': desc,
        'id': id,
        'imagePath': imagePath,
        'isVisible': isVisible,
        'order': order,
        'title': title,
        'type': type,
        'url': url
      };
}
