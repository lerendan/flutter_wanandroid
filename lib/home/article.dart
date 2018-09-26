import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'article.g.dart';


@JsonSerializable()
class Article extends Object with _$ArticleSerializerMixin{

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  Article(this.data,this.errorCode,this.errorMsg,);

  factory Article.fromJson(Map<String, dynamic> srcJson) => _$ArticleFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object with _$DataSerializerMixin{

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  Data(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}


@JsonSerializable()
class Datas extends Object with _$DatasSerializerMixin{

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  Datas(this.apkLink,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.origin,this.projectLink,this.publishTime,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

}


void main(){
  String srcJson = """{
	"data": {
		"curPage": 1,
		"datas": [{
			"apkLink": "",
			"author": "陪代码度过的漫长岁月",
			"chapterId": 121,
			"chapterName": "ViewPager",
			"collect": false,
			"courseId": 13,
			"desc": "",
			"envelopePic": "",
			"fresh": true,
			"id": 3414,
			"link": "https://blog.csdn.net/wurensen/article/details/81390641",
			"niceDate": "35分钟前",
			"origin": "",
			"projectLink": "",
			"publishTime": 1537255208000,
			"superChapterId": 26,
			"superChapterName": "常用控件",
			"tags": [],
			"title": "ViewPager源码分析（发现刷新数据的正确使用姿势）",
			"type": 0,
			"userId": -1,
			"visible": 1,
			"zan": 0
		}, {
			"apkLink": "",
			"author": "鸿洋",
			"chapterId": 298,
			"chapterName": "我的博客",
			"collect": false,
			"courseId": 13,
			"desc": "",
			"envelopePic": "",
			"fresh": true,
			"id": 3413,
			"link": "https://mp.weixin.qq.com/s/y4VIUl1g59GPKi_zYmKWrQ",
			"niceDate": "7小时前",
			"origin": "",
			"projectLink": "",
			"publishTime": 1537229560000,
			"superChapterId": 298,
			"superChapterName": "原创文章",
			"tags": [],
			"title": "我平时学习的一个方法",
			"type": 0,
			"userId": -1,
			"visible": 1,
			"zan": 0
		}],
		"offset": 0,
		"over": false,
		"pageCount": 83,
		"size": 20,
		"total": 1651
	},
	"errorCode": 0,
	"errorMsg": ""
}""";


  Map userMap = json.decode(srcJson);
  var user = new Article.fromJson(userMap);

//  List<Entity> list = new List();
//  list.add(Entity.fromJson(json.decode(srcJson)));
  print(user.data.datas[0].title);

}