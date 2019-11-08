import 'dart:io';

import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Apis.dart';
import 'file_manager.dart';

class HttpManager {
  static HttpManager _instance;
  Dio dio;

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = new HttpManager();
    }
    return _instance;
  }

  HttpManager() {
    dio = new Dio();
  }

  static HttpManager get instance => _getInstance();

  getResult(String url, Map<String, String> params) async {
    try {
      var response = await dio.post(Apis.BaseUrl + url, data: params);
      print(response);
//      Result<String> result = Result.fromJson(response.data);
//      print(result.code);
    } catch (exception) {
      print(exception);
      return exception.toString();
    }
    return "失败了";
  }

  downloadFile(String url) async {
    url = "http://pic37.nipic.com/20140103/10616010_215644481373_2.jpg";
    String path = await FileManager.instance.getLocalFile();
    int lastIndex = url.lastIndexOf("/");
    
    String localFilePath = path +url.substring(lastIndex);
    File file = await FileManager.instance.createFile(localFilePath);
    if (file == null) {
      print("create file failed");
    }
    var response =
        await dio.download(url, file.path, onReceiveProgress: (count, total) {
      String a = count.toString() + "/" + total.toString();
      print(a);
    });
    print(response);
  }

  requestPermission() async {
    //请求权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    //校验权限
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      print("无定位权限");
    }
  }
}
