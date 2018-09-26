import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'banner.g.dart';


@JsonSerializable()
class Banner extends Object with _$BannerSerializerMixin{

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  Banner(this.data,this.errorCode,this.errorMsg,);

  factory Banner.fromJson(Map<String, dynamic> srcJson) => _$BannerFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object with _$DataSerializerMixin{

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  Data(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

void main(){
  String srcJson = """""";
  Map userMap = json.decode(srcJson);
  var user = new Banner.fromJson(userMap);

}


