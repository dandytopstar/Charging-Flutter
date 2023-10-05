import 'package:flutter/material.dart';
import 'package:soar/models/category.dart';
import 'package:soar/pages/battery.dart';
import './qrview.dart';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import '../constant/api.dart';
// import '../ui/category_item.dart';
import '../service/category_service.dart';
import 'dart:io';
import 'dart:convert';
import '../ui/category_item.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLibraryState createState() => _MyLibraryState();
}

Widget getArchivedRow() {
  return Row(
    children: const [
      Icon(
        Icons.inventory,
        size: 28,
        color: Colors.grey,
      ),
      SizedBox(
        width: 15,
      ),
      Text(
        'Archived',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ],
  );
}

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
String deviceId = "";
List<String> libraryItem = [];

class _MyLibraryState extends State<MyLibrary> {
  final service = CategoryService();
  @override
  void initState() {
    super.initState();
    retrieveDeviceId().then((_) => {fetchData(deviceId).then((_) => {})});
  }

  Future<void> retrieveDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceId = androidInfo.androidId; // Unique ID on Android devices
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceId = iosInfo.identifierForVendor; // Unique ID on iOS devices
      });
    }
  }

  Future<void> fetchData(String deviceID) async {
    var url = Uri.parse('${API.dev}fetchlibrary');
    var headers = {'Content-Type': 'application/json'};
    var body = '{"deviceID": "$deviceID"}';

    var response = await http.post(url, headers: headers, body: body);
    List<dynamic> items = json.decode(response.body);
    if (mounted) {
      setState(() {
        libraryItem = List<String>.from(items);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildCategoryRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 30.0),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BatteryScreen(
                  link:
                      '${API.dev}mylibrary/$deviceId/${libraryItem[index].toString()}',
                ),
              ));
            },
            child: CategoryItem(
                category: Category(
                    video:
                        '${API.dev}mylibrary/$deviceId/${libraryItem[index]}',
                    // '${API.dev}mylibrary/$deviceId/${libraryItem[index].toString()}',
                    name: 'NCAA',
                    type: 'gif')),

            //  CategoryItem(category: service.list[1]),
          ),
        ),
        const SizedBox(width: 30.0),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BatteryScreen(
                  link:
                      '${API.dev}mylibrary/$deviceId/${libraryItem[index].toString()}',
                ),
              ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 85.0),
                Text(
                  libraryItem[index].toString().replaceAll('.gif', ''),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BatteryScreen(
                  link:
                      '${API.dev}mylibrary/$deviceId/${libraryItem[index].toString()}',
                ),
              ));
            },
            child: Image.asset(
              "assets/images/arrow.png",
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategoryRows() {
    List<Widget> rows = [];
    for (int i = 0; i < libraryItem.length; i++) {
      rows.addAll([
        buildCategoryRow(i),
        const SizedBox(height: 20),
      ]);
    }
    return Column(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00252525),
        body: Stack(children: [
          Positioned(
              top: 60,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  debugPrint('home');
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRViewExample(),
                  ));
                },
                child: Image.asset(
                  "assets/images/qr.png",
                  width: 40,
                  height: 40,
                ),
              )),
          Positioned(
              top: 130,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  debugPrint('home');
                },
                child: getArchivedRow(),
              )),
          Positioned(
              top: 130,
              right: 20,
              child: GestureDetector(
                  onTap: () {
                    debugPrint('home');
                  },
                  child: Image.asset(
                    "assets/images/arrow.png",
                    height: 28,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    width: 200,
                    height: 160,
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/images/mylibrary.png",
                      width: 120,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 190),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 20),
                  // ignore: unnecessary_null_comparison
                  libraryItem != null
                      ? buildCategoryRows()
                      : const CircularProgressIndicator(),
                ]),
              ))
            ],
          )
        ]));
  }
}
