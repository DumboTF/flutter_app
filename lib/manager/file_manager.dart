import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static FileManager _instance;

  static FileManager _getInstance() {
    if (_instance == null) {
      _instance = new FileManager();
    }
    return _instance;
  }

  static FileManager get instance => _getInstance();

  Future<String> getLocalFile() async {
    Directory appDir = await getExternalStorageDirectory();
    final dirPath = appDir.path;
    return dirPath;
  }

  Future<File> createFile(String filePath) async {
    File file = new File(filePath);
    final exist = await file.exists();
    if (exist) {
      file.delete();
      print("file exist - delete");
    } else {
      final parent = await file.parent.exists();
      print("parent "+parent.toString());
      if (!parent) {
        file.parent.create();
        print("parent create");
      }
    }
    return file.create();
  }
}
