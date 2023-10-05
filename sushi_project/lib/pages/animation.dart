import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../service/category_service.dart';
import 'package:battery/battery.dart';
import 'package:device_info/device_info.dart';
import '../constant/api.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

final service = CategoryService();

class ResumeRoutePage extends StatefulWidget {
  const ResumeRoutePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ResumeRoutePage createState() => _ResumeRoutePage();
}

class _ResumeRoutePage extends State<ResumeRoutePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = "";
  final Battery _battery = Battery();
  int batteryLevel = 0;
  BatteryState? _batteryState;
  late StreamSubscription<BatteryState> _batteryStateSubscription;
  BatteryState? get currentBatteryState => _batteryState;
  String link = "";
  @override
  void initState() {
    super.initState();
    getBatteryLevel();
    retrieveData();
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
      if (_batteryState == BatteryState.discharging) {
        // Exit the app if the battery state is discharging
        if (Platform.isAndroid) {
          SystemNavigator.pop(); // For Android
        } else if (Platform.isIOS) {
          exit(0); // For iOS
        }
      }
    });
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

  Future<void> getDataFromServer() async {
    var url = Uri.parse('${API.dev}Inputsetting');
    var headers = {'Content-Type': 'application/json'};
    var body = '{"deviceID": "$deviceId"}';
    // print(body);
    var response = await http.post(url, headers: headers, body: body);
    setState(() {
      link = json.decode(response.body)['link'];
      // print(link);
    });
  }

  Future<void> retrieveData() async {
    await retrieveDeviceId(); // Wait for retrieveDeviceId to complete
    await getDataFromServer(); // Wait for getDataFromServer to complete
  }

  Future<void> getBatteryLevel() async {
    int level = await _battery.batteryLevel;
    setState(() {
      batteryLevel = level;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _batteryStateSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          debugPrint("Exit command");
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(40), // Set desired corner radius
                  child: CachedNetworkImage(
                    imageUrl: link,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            // ignore: sized_box_for_whitespace
                            child: Container(
                      width: 60,
                      height: 60,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue), // Set the color of the loading circle

                        // value: downloadProgress.progress,
                      ),
                    )),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                  //  Container(
                  //     height: double.infinity,
                  //     width: double.infinity,
                  //     child: CategoryItem(category: service.list[widget.id]))
                  //  Image.network(
                  //   widget.link,
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  //   height: double.infinity,
                  // ),
                ),

                // ClipRRect(
                //   borderRadius:
                //       BorderRadius.circular(40), // Set desired corner radius
                //   child:

                //   link.isNotEmpty
                //       ? Image.network(
                //           link,
                //           // '${API.dev}animation/Bills_1.gif',
                //           fit: BoxFit.cover,
                //           width: double.infinity,
                //           height: double.infinity,
                //         )
                //       : const Center(
                //           child: CircularProgressIndicator(
                //           color: Colors.white,
                //         )),
                // ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         top: 60, left: 10.0, bottom: 20, right: 30),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         InkWell(
                //           onTap: () {
                //             // _stopForegroundTask;
                //             Navigator.pushReplacement(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (_) => const HomePageScreen(
                //                           id: '0',
                //                         )));
                //             // Navigator.pop(context);
                //             // Your code for handling the close button click event goes here.
                //           },
                //           child: const Text(
                //             'Close',
                //             style: TextStyle(
                //               decoration: TextDecoration.underline,
                //               decorationThickness: 2,
                //               color: Colors.blue,
                //               fontSize: 20,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 100, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double screenWidth =
                                MediaQuery.of(context).size.width;
                            double buttonWidth = screenWidth *
                                0.8; // Set the desired percentage here
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: buttonWidth,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0, // Set the elevation to 0
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          'Charging $batteryLevel%',
                                          style: const TextStyle(fontSize: 25),
                                        )
                                        // Text(
                                        //   (()
                                        //   {
                                        //     switch (_batteryState) {
                                        //       case BatteryState.charging:
                                        //         return 'Charging  $batteryLevel%';
                                        //       case BatteryState.discharging:
                                        //         return 'DisCharging  $batteryLevel%';
                                        //       case BatteryState.full:
                                        //         return '100%';
                                        //       default:
                                        //         return '';
                                        //     }
                                        //   })
                                        //   (),
                                        //   style: const TextStyle(
                                        //       fontSize: 25, color: Colors.white),
                                        // ),
                                        )),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(left: 10.0, bottom: 20, right: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         LayoutBuilder(
                //           builder: (context, constraints) {
                //             double screenWidth = MediaQuery.of(context).size.width;
                //             double buttonWidth = screenWidth *
                //                 0.8; // Set the desired percentage here
                //             return Padding(
                //               padding: const EdgeInsets.all(12.0),
                //               child: SizedBox(
                //                 width: buttonWidth,
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [

                //                   ],
                //                 ),

                //               ),
                //             );
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
