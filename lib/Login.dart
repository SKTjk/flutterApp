import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go_me/utils/HttpUtils.dart';
import 'package:flutter_go_me/utils/LogUtil.dart';
import 'package:flutter_go_me/utils/ObjectUtil.dart';
import 'package:flutter_go_me/utils/ToastUtil.dart';

import 'main.dart';

void main() => runApp(AbizApp());

class AbizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: 'Title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();
    _pwdEditController.addListener(() => setState(() => {}));
    _userNameEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* // 输入框是否抵住键盘
      resizeToAvoidBottomPadding: false,*/
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max, //设置主轴方向所占的宽度和高度
            children: <Widget>[
              _buildTopBannerWidget(),
              _buildEditWidget(),
              Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 100),
                child: new Container(
                  margin: const EdgeInsets.only(top: 110.0),
                  height: 50,
                  width: 320.0,
                  child: _buildFlatButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 图标
  _buildTopBannerWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Image.asset(
        "assets/images/monkey.gif",
        fit: BoxFit.cover,
      ),
    );
  }

  /// 用户名框
  _buildEditWidget() {
    return Container(
      width: 320,
      height: 170,
      margin: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: new Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        borderOnForeground: false,
        elevation: 25,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 22, left: 20, right: 20),
              // 用户名输入框
              child: _buildLoginNameTextField(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              // 密码输入框
              child: _buildPwdTextField(),
            ),
          ],
        ),
      ),
    );
  }

  ///用户名输入框
  _buildLoginNameTextField() {
    return TextField(
      controller: _userNameEditController,
      focusNode: _userNameFocusNode,
      // 优先键盘类型
      keyboardType: TextInputType.number,
      style: new TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
        hintText: "请输入手机号",
        labelText: "手机",
        border: OutlineInputBorder(
          // 圆角
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: Icon(CupertinoIcons.person_solid),
      ),
    );
  }

  /// 密码输入框
  _buildPwdTextField() {
    return TextField(
        controller: _pwdEditController,
        focusNode: _pwdFocusNode,
        style: new TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          hintText: "请输入密码",
          labelText: "密码",
          border: OutlineInputBorder(
              // 圆角
              borderRadius: BorderRadius.circular(8.0)),
          prefixIcon: Icon(CupertinoIcons.padlock_solid),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              onPressed: () {
                _pwdEditController.clear();
                _pwdFocusNode.unfocus();
                setState(() {});
              }),
        ));
  }

  /// 登录按钮
  _buildFlatButton() {
    return new RaisedButton(
      elevation: 40,
      //背景颜色decorationdecoration
      color: Color.alphaBlend(Colors.blue[400], Colors.blue[900]),
      // 字体颜色
      textColor: Colors.white,
      //禁用是填充颜色
      disabledColor: Colors.grey,
      // 点击溅射的颜色
      splashColor: Colors.blueAccent,
      clipBehavior: Clip.antiAlias,
      textTheme: ButtonTextTheme.normal,
      padding: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: new Text(
        "登录",
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      onPressed: () {
//        Navigator.push(
//          context,
//          new MaterialPageRoute(
//              builder: (context) => new MyApp(), maintainState: false),
//        );
        _handleGetShelf();
        print('点击登录');
      },
    );
  }

  // GET 请求
// 返回的结果直接就是 json 格式
// 要使用 await，必须在方法名后面加上 async
  _handleGetShelf() async {
    var result =
        await HttpUtils.request('auth/login', method: HttpUtils.POST, data: {
      'username': ObjectUtil.isEmpty(_userNameEditController.text)
          ? ToastUtil.show(context, '手机号不能为空！')
          : _userNameEditController.text,
      'password': ObjectUtil.isEmpty(_pwdEditController.text)
          ? ToastUtil.show(context, '密码不能为空！')
          : _pwdEditController.text,
    });
    LogUtil.init(isDebug: false, tag: "LoginPage");
    LogUtil.v(result);
    print(result);
    if (result['status'] == 200) {
      ToastUtil.show(context, '登入成功！');
    } else {
      ToastUtil.show(context, result['msg']);
    }
  }
}
