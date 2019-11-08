import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../user.dart';

//import 'package:toast/toast.dart';
//void main() {
//  runApp(EditText());
//}

class EditText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Input"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: "输入姓名+${user.name}",
                    labelText: "name",
                    icon: Icon(Icons.input)),
                onChanged: (rstString) {
                  print(rstString);
                },
                controller: TextEditingController(),
                buildCounter: buildCount,
                maxLength: 100,
                onSubmitted: (text) {
                  Fluttertoast.showToast(
                      msg: "$text",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white);
                },
                onEditingComplete: () {
                  Fluttertoast.showToast(
                      msg: "ok",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white);
                },
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "年龄",
                    errorText: "",
                    labelText: "age",
                    icon: Icon(Icons.input)),
                obscureText: true,
                //密码样式
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: "LiuJianMaoCao",
                    letterSpacing: 5),
                keyboardType: TextInputType.number,
                controller: TextEditingController(),
                buildCounter: buildCount,
                maxLength: 100,
                onChanged: (rstString) {
                  print(rstString);
                },
                onSubmitted: (text) {
                  Fluttertoast.showToast(
                      msg: "$text",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white);
                },
                onEditingComplete: () {
                  print("complete");
//                  Fluttertoast.showToast(
//                      msg: "ok",
//                      toastLength: Toast.LENGTH_SHORT,
//                      gravity: ToastGravity.CENTER,
//                      timeInSecForIos: 1,
//                      backgroundColor: Colors.blue,
//                      textColor: Colors.white);
                },
              ),
              InputWidget()
            ],
          ),
        ),
      );
  }
}

Widget buildCount(BuildContext context,
    {@required int currentLength,
    @required int maxLength,
    @required bool isFocused}) {
  return Text("$currentLength / $maxLength");
}

class InputWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputWidgetState();
  }
}

class InputWidgetState extends State<InputWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration:
              InputDecoration(hintText: "Type someting", counterText: "aaa"),
        ),
        RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text(
                  "what you typed",
                  textAlign: TextAlign.center,
                ),
                content: Text(_controller.text),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.add,
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed("/popup");
                      }),
                  BackButton(),
                  CloseButton(),
                ],
              ),
              barrierDismissible: false,
            );
          },
          child: Text("Show"),
          color: Colors.red,
          highlightColor: Colors.redAccent,
        ),
        TextFormField(
          onSaved: (String value) {
            print(value);
          },
          validator: (String value) {
            return value.contains("@") ? "don't use the @ char" : null;
          },
          readOnly: false,
        ),
        FlatButton(
          child: Text("PUSH"),
          onPressed: () {
            _controller.text =
                "https://oct.antss031.com/aff/tJCR   c7d007e76e86dd1f827b8f1e81067e67";
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("what"),
                ),
                body: Center(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context, User("ztf", "163.com"));
                      },
                      child: Text("POP")),
                ),
              );
            }));
          },
        ),
      ],
    );
  }
}
