import 'package:flutter/material.dart';
import 'package:flutter_app/ui/input.dart';
import 'package:flutter_app/ui/popup.dart';
import 'dart:async';

import '../user.dart';
import 'input2.dart';

//void main() {
//  runApp(MaterialApp(
//    initialRoute: "/",
//    routes: <String, WidgetBuilder>{
//      '/': (context) => SplashPage(),
//      "/input": (BuildContext context) => EditText(),
//      '/input2': (context) => EditText2(),
//      "/popup": (context) => TfPopup()
//    },
//  ));
//}

class SplashPage extends StatefulWidget {
  String title;

  SplashPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var _duration = Duration(seconds: 1);
    return new Timer(_duration, _toMain);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(builder: (context) {
      return Container(
        child: Image(
          image: AssetImage("assets/images/launcher.jpg"),
          fit: BoxFit.fill,
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  Future _toMain() async {
    final user = await Navigator.of(context)
        .pushNamed("/input", arguments: User("qqq", "qq.com"));
    print(user);
  }
}
