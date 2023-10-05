// ignore_for_file: unused_field

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import '../service/category_service.dart';

import 'package:battery/battery.dart';
import 'dart:io';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import '../taskhandler.dart';
import '../constant/api.dart';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';
import 'package:cached_network_image/cached_network_image.dart';

@pragma('vm:entry-point')
void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}

// import 'package:dio/dio.dart';
final service = CategoryService();

class BatteryScreen extends StatefulWidget {
  final String link;
  const BatteryScreen({super.key, required this.link});

  @override
  // ignore: library_private_types_in_public_api
  _BatteryScreen createState() => _BatteryScreen();
}

class _BatteryScreen extends State<BatteryScreen> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = "";

  ReceivePort? _receivePort;
  final Battery _battery = Battery();
  int batteryLevel = 0;

  BatteryState? _batteryState;
  late StreamSubscription<BatteryState> _batteryStateSubscription;
  @override
  void initState() {
    super.initState();
    retrieveDeviceId();
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
      getBatteryLevel();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _requestPermissionForAndroid();
      _initForegroundTask();

      // You can get the previous ReceivePort without restarting the service.
      if (await FlutterForegroundTask.isRunningService) {
        final newReceivePort = FlutterForegroundTask.receivePort;
        _registerReceivePort(newReceivePort);
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

  Future<void> getBatteryLevel() async {
    int level = await _battery.batteryLevel;
    setState(() {
      batteryLevel = level;
    });
  }

  Future<void> _requestPermissionForAndroid() async {
    if (!Platform.isAndroid) {
      return;
    }

    // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
    // onNotificationPressed function to be called.
    //
    // When the notification is pressed while permission is denied,
    // the onNotificationPressed function is not called and the app opens.
    //
    // If you do not use the onNotificationPressed or launchApp function,
    // you do not need to write this code.
    if (!await FlutterForegroundTask.canDrawOverlays) {
      // This function requires `android.permission.SYSTEM_ALERT_WINDOW` permission.
      await FlutterForegroundTask.openSystemAlertWindowSettings();
    }

    // Android 12 or higher, there are restrictions on starting a foreground service.
    //
    // To restart the service on device reboot or unexpected problem, you need to allow below permission.
    if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
      await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    }

    // Android 13 and higher, you need to allow notification permission to expose foreground service notification.
    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermissionStatus != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }
  }

  void _initForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        id: 500,
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
          backgroundColor: Colors.orange,
        ),
        buttons: [
          const NotificationButton(
            id: 'sendButton',
            text: 'Send',
            textColor: Colors.orange,
          ),
          const NotificationButton(
            id: 'testButton',
            text: 'Test',
            textColor: Colors.grey,
          ),
        ],
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 2000,
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  void setData(String widgetUrl, String deviceID) async {
    // Make the GET request with variables

    var url = Uri.parse('${API.dev}setting');
    var headers = {'Content-Type': 'application/json'};
    var body = '{"widgetUrl": "$widgetUrl", "deviceID": "$deviceID"}';
    var response = await http.post(url, headers: headers, body: body);
    debugPrint(response.body);
  }

  Future<bool> _startForegroundTask() async {
    // print(deviceId);
    setData(widget.link, deviceId);
    await FlutterForegroundTask.saveData(key: 'customData', value: 'hello');

    // Register the receivePort before starting the service.
    final ReceivePort? receivePort = FlutterForegroundTask.receivePort;
    final bool isRegistered = _registerReceivePort(receivePort);
    if (!isRegistered) {
      debugPrint('Failed to register receivePort!');
      return false;
    }

    if (await FlutterForegroundTask.isRunningService) {
      return FlutterForegroundTask.restartService();
    } else {
      return FlutterForegroundTask.startService(
        notificationTitle: 'Service is running',
        notificationText: 'Tap to return to the app',
        callback: startCallback,
      );
    }
  }

  // Future<bool> _stopForegroundTask() {
  //   return FlutterForegroundTask.stopService();
  // }

  bool _registerReceivePort(ReceivePort? newReceivePort) {
    if (newReceivePort == null) {
      return false;
    }

    _closeReceivePort();

    _receivePort = newReceivePort;
    _receivePort?.listen((data) {
      if (data is int) {
        // print('eventCount: $data');
      } else if (data is String) {
        if (data == 'onNotificationPressed') {
          Navigator.of(context).pushNamed('/resume-route');
        }
      } else if (data is DateTime) {
        debugPrint('timestamp: ${data.toString()}');
      }
    });

    return _receivePort != null;
  }

  void _closeReceivePort() {
    _receivePort?.close();
    _receivePort = null;
  }

  @override
  void dispose() {
    super.dispose();
    _closeReceivePort();
    _batteryStateSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    buttonBuilder(String text, {VoidCallback? onPressed}) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Set desired corner radius here
          ),
        ),
        child: Text(
          text,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            ClipRRect(
                borderRadius:
                    BorderRadius.circular(40), // Set desired corner radius
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(40), // Set desired corner radius
                  child: CachedNetworkImage(
                    imageUrl: widget.link,
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
                )

                // Image.network(
                //   widget.link,
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                //   height: double.infinity,
                // ),
                ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 10.0, bottom: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // _stopForegroundTask;
                        Navigator.pop(context);
                        // Your code for handling the close button click event goes here.
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 10.0, top: 100, right: 10),
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
            //               child:
            //               SizedBox(
            //                 width: buttonWidth,
            //                 child: ElevatedButton(
            //                     onPressed: () {
            //                       debugPrint('Hello');
            //                     },
            //                     style: ElevatedButton.styleFrom(
            //                       foregroundColor: Colors.white,
            //                       backgroundColor: Colors.transparent,
            //                     ),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(18.0),
            //                       child: Text(
            //                         (() {
            //                           switch (_batteryState) {
            //                             case BatteryState.charging:
            //                               return 'Charging  $batteryLevel%';
            //                             case BatteryState.discharging:
            //                               return 'DisCharging  $batteryLevel%';
            //                             case BatteryState.full:
            //                               return '100%';
            //                             default:
            //                               return '';
            //                           }
            //                         })(),
            //                         style: const TextStyle(fontSize: 25),
            //                       ),
            //                     )),
            //               ),
            //             );
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, bottom: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = MediaQuery.of(context).size.width;
                        double buttonWidth = screenWidth *
                            0.8; // Set the desired percentage here
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: buttonWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buttonBuilder('Set the Charging Animation',
                                    onPressed: _startForegroundTask),
                                // const SizedBox(
                                //   width: 40,
                                // ),
                                // buttonBuilder('stop',
                                //     onPressed: _stopForegroundTask),
                              ],
                            ),
                            //  ElevatedButton(
                            //   onPressed: () {
                            //     debugPrint('Hello');
                            //   },
                            //   child: const Text(
                            //     "Set the Charging Animation",
                            //     style: TextStyle(fontSize: 18),
                            //   ),
                            // ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
