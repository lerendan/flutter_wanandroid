// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return new Article(
      json['data'] == null
          ? null
          : new Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

abstract class _$ArticleSerializerMixin {
  Data get data;
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
      json['curPage'] as int,
      (json['datas'] as List)
          ?.map((e) =>
              e == null ? null : new Datas.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int);
}

abstract class _$DataSerializerMixin {
  int get curPage;
  List<Datas> get datas;
  int get offset;
  bool get over;
  int get pageCount;
  int get size;
  int get total;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'curPage': curPage,
        'datas': datas,
        'offset': offset,
        'over': over,
        'pageCount': pageCount,
        'size': size,
        'total': total
      };
}

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return new Datas(
      json['apkLink'] as String,
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['collect'] as bool,
      json['courseId'] as int,
      json['desc'] as String,
      json['envelopePic'] as String,
      json['fresh'] as bool,
      json['id'] as int,
      json['link'] as String,
      json['niceDate'] as String,
      json['origin'] as String,
      json['projectLink'] as String,
      json['publishTime'] as int,
      json['superChapterId'] as int,
      json['superChapterName'] as String,
      json['tags'] as List,
      json['title'] as String,
      json['type'] as int,
      json['userId'] as int,
      json['visible'] as int,
      json['zan'] as int);
}

abstract class _$DatasSerializerMixin {
  String get apkLink;
  String get author;
  int get chapterId;
  String get chapterName;
  bool get collect;
  int get courseId;
  String get desc;
  String get envelopePic;
  bool get fresh;
  int get id;
  String get link;
  String get niceDate;
  String get origin;
  String get projectLink;
  int get publishTime;
  int get superChapterId;
  String get superChapterName;
  List<dynamic> get tags;
  String get title;
  int get type;
  int get userId;
  int get visible;
  int get zan;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'apkLink': apkLink,
        'author': author,
        'chapterId': chapterId,
        'chapterName': chapterName,
        'collect': collect,
        'courseId': courseId,
        'desc': desc,
        'envelopePic': envelopePic,
        'fresh': fresh,
        'id': id,
        'link': link,
        'niceDate': niceDate,
        'origin': origin,
        'projectLink': projectLink,
        'publishTime': publishTime,
        'superChapterId': superChapterId,
        'superChapterName': superChapterName,
        'tags': tags,
        'title': title,
        'type': type,
        'userId': userId,
        'visible': visible,
        'zan': zan
      };
}
