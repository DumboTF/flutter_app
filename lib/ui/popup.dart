import 'package:flutter/material.dart';
import 'package:flutter_app/manager/HttpManager.dart';

class TfPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PopupWindow(),
    );
  }
}

class PopupWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PopupWindowState();
  }
}

enum TFNumber { One, Two, Three }

class PopupWindowState extends State<PopupWindow> {
  var _selection;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    HttpManager.instance.requestPermission();
    return Scaffold(
      appBar: AppBar(
        title: Text("pop"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<TFNumber>>[
              const PopupMenuItem<TFNumber>(
                child: Icon(Icons.add),
                value: TFNumber.One,
              ),
              const PopupMenuItem(
                child: Icon(Icons.input),
                value: TFNumber.Two,
              ),
              const PopupMenuItem(
                child: Icon(Icons.print),
                value: TFNumber.Three,
              )
            ],
            onSelected: (TFNumber number) {
              setState(() {
                _selection = number;
                print(_selection.toString());

                //连个网试试、
//                Map<String,String> params = new Map();
//               var result =  HttpManager.instance.getResult("/user/saveUserOperateLog", params);
//                print(result);
              //下个文件
                HttpManager.instance.downloadFile("");
              });
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        child: FlatButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "aaa",
                            style: TextStyle(height: 2, color: Colors.red),
                          ),
                          Icon(Icons.star, size: 20.0)
                        ],
                      ),
                      height: 250,
                    );
                  });
            },
            child: Text(
              "Print",
              style: TextStyle(color: Colors.red),
            )),
      ),
    );
  }
}
