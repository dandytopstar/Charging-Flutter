// ignore_for_file: unused_field

import 'dart:isolate';
import 'package:battery/battery.dart';
import 'dart:async';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class MyTaskHandler extends TaskHandler {
  SendPort? _sendPort;
  int _eventCount = 0;

  final Battery _battery = Battery();
  BatteryState? _batteryState;
  late StreamSubscription<BatteryState> _batteryStateSubscription;

  // Called when the task is started.

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;

    // You can use the getData function to get the stored data.
    final customData =
        await FlutterForegroundTask.getData<String>(key: 'customData');
    // ignore: avoid_print
    print('customData: $customData');

    // Listen for battery state changes
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      _batteryState = state;
      // print('Battery State Changed: $state');
      // Handle the updated battery state here
    });
  }

  bool isBatteryChargingPrinted = false;

  // Called every [interval] milliseconds in [ForegroundTaskOptions].
  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    // print('onRepeat');
    // final int batteryLevel = await _battery.batteryLevel;
    FlutterForegroundTask.updateService(
      notificationTitle: 'Battery charging Animation-SOAR',
      notificationText: 'Start the charging animation',
    );
    if (_batteryState == BatteryState.discharging && isBatteryChargingPrinted) {
      if (Platform.isAndroid) {
        SystemNavigator.pop(); // For Android
      } else if (Platform.isIOS) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop'); // For iOS
      }
      isBatteryChargingPrinted = false;
    }
    if (_batteryState == BatteryState.charging && !isBatteryChargingPrinted) {
      isBatteryChargingPrinted = true;
      FlutterForegroundTask.launchApp("/");
    }
    // Send data to the main isolate.
    sendPort?.send(_eventCount);

    _eventCount++;
  }

  // Called when the notification button on the Android platform is pressed.
  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    // print('onDestroy');
  }

  // Called when the notification button on the Android platform is pressed.
  @override
  void onNotificationButtonPressed(String id) {
    // print('onNotificationButtonPressed >> $id');
  }

  // Called when the notification itself on the Android platform is pressed.
  //
  // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
  // this function to be called.
  @override
  void onNotificationPressed() {
    // Note that the app will only route to "/resume-route" when it is exited so
    // it will usually be necessary to send a message through the send port to
    // signal it to restore state when the app is already started.
    FlutterForegroundTask.launchApp("/");

    _sendPort?.send('onNotificationPressed');
  }
}
