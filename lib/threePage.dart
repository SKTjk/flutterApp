import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class threePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _threePageState();
  }
}

class _threePageState extends State<threePage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        children: _getAnalyze());
  }

  List images = [
    'home_climb_icon.png',
    'home_face_comparison_icon.png',
    'home_fire_icon.png',
    'home_inbreak_icon.png',
    'home_parking_icon.png',
    'home_perimeter_icon.png',
    'home_tag_after_icon.png'
  ];

  List titles = ['攀爬监测', '抓拍分析', '消防占道', '入侵告警', '违停监测', '周界监测', '疑似尾随'];

  List<Card> _getAnalyze() {
    List<Card> card = new List();
    for (int i = 0; i < titles.length; i++) {
      card.add(new Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))), //设置圆角
        margin: EdgeInsets.all(2.0),
        elevation: 10.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 0, bottom: 0, right: 0),
              child: new Image.asset('assets/images/' + images[i]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 0, bottom: 0, right: 0),
              child: new Text(
                titles[i],
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ));
    }
    return card;
  }
}
