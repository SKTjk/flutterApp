import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_me/utils/HttpUtils.dart';

class onePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _onePageState();
  }
}

class _onePageState extends State<onePage> {
  String _token = "";

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, //设置主轴方向所占的宽度和高度
      children: <Widget>[
        new FlatButton(
          //背景颜色
          color: Colors.blue,
          // 字体颜色
          textColor: Colors.white,
          //禁用是填充颜色
          disabledColor: Colors.grey,
          // 点击溅射的颜色
          splashColor: Colors.blueAccent,
          clipBehavior: Clip.antiAlias,
          textTheme: ButtonTextTheme.normal,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            print("点击事件");
            _handleGetShelf();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            "Flat Button",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Text(_token),
      ],
    ));
  }

  // GET 请求
// 返回的结果直接就是 json 格式
// 要使用 await，必须在方法名后面加上 async
  _handleGetShelf() async {
    var result = await HttpUtils.request('auth/login',
        method: HttpUtils.POST,
        data: {'username': '15316881835', 'password': '123456'});
    _updateText(result['data']);
  }

  void _updateText(String token) {
    //直接变换数据的值，不需要所谓的TextView对象
    setState(() {
      this._token = token;
    });
  }
}
