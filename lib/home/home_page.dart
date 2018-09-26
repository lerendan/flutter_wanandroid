import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/home/item_widget.dart';
import 'package:flutter_wanandroid/home/article.dart';
import 'package:flutter_wanandroid/home/banner.dart' as b;
import 'package:flutter_wanandroid/common/api.dart';
import 'package:flutter_wanandroid/util/http_utils.dart';


import 'dart:convert';
import 'dart:async';
import 'slide_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listData;
  var slideData;
  var curPage = 0; //当前页码，从0开始

  //监听列表滚动事件
  ScrollController _controller = new ScrollController();

  _HomePageState() {
    _controller.addListener(() {
      // 表示列表的最大滚动距离
      var maxScroll = _controller.position.maxScrollExtent;
      // 表示当前列表已向下滚动的距离
      var pixels = _controller.position.pixels;
      // 如果两个值相等，表示滚动到底
      if (maxScroll == pixels ) {
        // scroll to bottom, get next page data
        print("load more ... ");
        // 当前页索引加1
        curPage++;
        // 获取下一页数据
        getNewsList(true);
      }
    });
  }

  _getItem(int i){
    if(i==0){
      return SlideView(slideData,200.0);
    }else{
      return ItemWidget(listData[--i]);
    }

  }

  @override
  void initState() {
    super.initState();
    getNewsList(false);
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    getNewsList(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        itemCount: listData.length+1,
        itemBuilder: (context, i) => _getItem(i),
        controller: _controller,
      );
      return new RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  getNewsList(bool isLoadMore) {
    NetUtils.get(Api.HOME_BANNER).then((data){
      print("BannerData: $data");
      if(data!=null){
        Map<String, dynamic> map = json.decode(data);
        var banner = b.Banner.fromJson(map);
        setState(() {
          slideData = banner.data;
        });
      }
    });

    String url = Api.HOME_ARTICLE;
    url += "$curPage/json";
    print("newsListUrl: $url");
    NetUtils.get(url).then((data) {
      print("newsListData: $data");
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
        var articles = new Article.fromJson(map);
        setState(() {
          if(!isLoadMore) {
            listData = articles.data.datas;
          }else{
            List list1 = new List();
              list1.addAll(listData);
              list1.addAll(listData);
//              if (list1.length >= listTotalSize) {
//                list1.add(Constants.END_LINE_TAG);
//              }
              listData = list1;
          }
        });
      }
    });
  }

}
