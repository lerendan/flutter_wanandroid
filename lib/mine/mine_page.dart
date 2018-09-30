import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/global_config.dart';

class MinePage extends StatefulWidget {

  @override
  _MinePageState createState() => new _MinePageState();

}

class _MinePageState  extends State<MinePage> {

  Widget myServiceCard() {
    return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.book, color: Colors.white),
                                backgroundColor: Colors.green,
                              ),
                            ),
                            new Container(
                              child: new Text("收藏", style: new TextStyle(color: GlobalConfig.fontColor, fontSize: 14.0),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.flash_on, color: Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            new Container(
                              child: new Text("Todo", style: new TextStyle(color: GlobalConfig.fontColor, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.shop, color: Colors.white),
                                backgroundColor: new Color(0xFF088DB4),
                              ),
                            ),
                            new Container(
                              child: new Text("常用网站", style: new TextStyle(color: GlobalConfig.fontColor, fontSize: 14.0),),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.radio, color: Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            new Container(
                              child: new Text("余额礼卷", style: new TextStyle(color: GlobalConfig.fontColor, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: (){},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.wifi_tethering, color: Colors.white),
                                backgroundColor: new Color(0xFF029A3F),
                              ),
                            ),
                            new Container(
                              child: new Text("服务", style: new TextStyle(color: GlobalConfig.fontColor, fontSize: 14.0)),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return myServiceCard();

  }

}