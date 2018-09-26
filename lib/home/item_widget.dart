import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/global_config.dart';
import 'package:flutter_wanandroid/home/article.dart';
import 'package:flutter_wanandroid/home/web_page.dart';


class ItemWidget extends StatelessWidget {
  Datas data;

  ItemWidget(this.data);

  _getArticleLogo(String link) {
    String logoAddress = 'logo_android.jpg';
    if (link.contains("csdn"))
      logoAddress = 'logo_csdn.jpg';
    else if (link.contains("juejin"))
      logoAddress = 'logo_juejin.jpg';
    else if (link.contains("jianshu"))
      logoAddress = 'logo_jianshu.jpg';
    else if (link.contains("wanandroid")) logoAddress = 'logo_wanandroid.jpg';

    return new AssetImage("images/$logoAddress");
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: GlobalConfig.cardBackgroundColor,
        margin: const EdgeInsets.only(bottom: 5.0),
        child: new FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new WebDetailPage(url: data.link,)),
            );
          },
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                          backgroundImage: _getArticleLogo(data.link),
                          radius: 11.0),
                    ),
                    new Expanded(
                        child: new Text("  " + data.author,
                            style:
                            new TextStyle(color: GlobalConfig.fontColor))),
                    new Text(data.niceDate,
                        style: new TextStyle(color: Colors.grey)),
                  ],
                ),
                padding: const EdgeInsets.only(top: 10.0),
              ),
              new Container(
                  child: new Text(data.title,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          height: 1.3,
                          color: GlobalConfig.dark == true
                              ? Colors.white70
                              : Colors.black)),
                  margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                  alignment: Alignment.topLeft),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
//                        child: new Text(article.agreeNum.toString() + " 赞同 · " + article.commentNum.toString() + "评论", style: new TextStyle(color: GlobalConfig.fontColor))
                        child: new Text(
                            data.superChapterName +
                                '/' +
                                data.chapterName,
                            style: new TextStyle(
                                height: 1.3, color: Colors.grey))),
                    new PopupMenuButton(
                        icon: new Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              value: '选项一的值', child: new Text('屏蔽这个问题')),
                          new PopupMenuItem<String>(
                              value: '选项二的值',
                              child: new Text('取消关注 learner')),
                          new PopupMenuItem<String>(
                              value: '选项二的值', child: new Text("举报"))
                        ])
                  ],
                ),
                padding: const EdgeInsets.only(),
              )
            ],
          ),
        ));
  }
}
