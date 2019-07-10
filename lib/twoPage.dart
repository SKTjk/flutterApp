import 'package:flutter/cupertino.dart';

class twoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _twoPageState();
  }
}

class _twoPageState extends State<twoPage> {
  @override
  Widget build(BuildContext context) {
    return new GridView(
      padding: const EdgeInsets.all(2.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: 0.7,
      ),
      children: <Widget>[
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big42000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big103000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big266000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big122000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big41000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big222004.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big42000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big103000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big266000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big122000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big41000.jpg",
            fit: BoxFit.cover),
        new Image.network(
            "https://ossweb-img.qq.com/images/lol/web201310/skin/big222004.jpg",
            fit: BoxFit.cover),
      ],
    );
  }
}
