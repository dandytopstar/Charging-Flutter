import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'dart:convert';

// To save the file in the device
class FileStorage {
  List<String> libraryItem = [];

  Future<List<String>> fetchData(String deviceID) async {
    var url = Uri.parse('${API.dev}fetchlibrary');
    var headers = {'Content-Type': 'application/json'};
    var body = '{"deviceID": "$deviceID"}';

    var response = await http.post(url, headers: headers, body: body);

    List<dynamic> items = json.decode(response.body);
    libraryItem = [];
    for (String item in items) {
      // Perform some logic with each item

      libraryItem.add(item);
    }
    return libraryItem;
  }

  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      // Redirects it to download folder in android
      directory = Directory("/storage/emulated/0/Download");
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final exPath = directory.path;
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
    // To get the external path from device of download folder
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  void saveByteFile(List<int> bytes, String filePath) {
    File(filePath).writeAsBytes(bytes);
  }

  static Future<File> writeCounter(List<int> bytes, String name) async {
    final path = await _localPath;

    // Create a file for the path of
    // device and file name with extension
    File file = File('$path/$name');
    // Write the data in the file you have created
    return file.writeAsBytes(bytes);
  }
}
