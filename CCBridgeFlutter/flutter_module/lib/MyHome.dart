import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHome extends StatefulWidget {

  @override
  createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {

  static const EventChannel eventChannel = const EventChannel('aaa');

  String navtitle = "iOS";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventChannel.receiveBroadcastStream(12345).listen(_onEvent,onError: _onError);

  }

  // 回调事件
  void _onEvent(Object event) {
    setState(() {
      navtitle = event;
    });
      print("iOS传给Flutter参数:$event");
  }
  // 错误返回
  void _onError(Object error) {

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text(navtitle,style:TextStyle(color: Colors.white)),
          ),
        ),
      ),
      title: "11111",
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
    );
  }


}

//class MyHome extends StatefulWidget {
//  MyHome({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHome> {
//
//  // 创建一个给native的channel (类似iOS的通知）
//  static const methodChannel = const MethodChannel('com.pages.your/native_get');
//
//
//  _iOSPushToVC() async {
//    await methodChannel.invokeMethod('iOSFlutter', '参数');
//  }
//
//  _iOSPushToVC1() async {
//    Map<String, dynamic> map = {"code": "200", "data":[1,2,3]};
//    await methodChannel.invokeMethod('iOSFlutter1', map);
//  }
//
//  _iOSPushToVC2() async {
//    dynamic result;
//    try {
//      result = await methodChannel.invokeMethod('iOSFlutter2');
//    } on PlatformException {
//      result = "error";
//    }
//    if (result is String) {
//      print(result);
//      showModalBottomSheet(context: context, builder: (BuildContext context) {
//        return new Container(
//          child: new Center(
//            child: new Text(result, style: new TextStyle(color: Colors.brown), textAlign: TextAlign.center,),
//          ),
//          height: 40.0,
//        );
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new FlatButton(onPressed: () {
//              _iOSPushToVC();
//            }, child: new Text("跳转ios新界面，参数是字符串")),
//            new FlatButton(onPressed: () {
//              _iOSPushToVC1();
//            }, child: new Text("传参，参数是map，看log")),
//            new FlatButton(onPressed: () {
//              _iOSPushToVC2();
//            }, child: new Text("接收客户端相关内容")),
//          ],
//        ),
//      ),
//    );
//  }
//}
