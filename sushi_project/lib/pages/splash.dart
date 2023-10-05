import 'package:flutter/material.dart';
import 'package:soar/pages/animation.dart';
import '/pages/homepage.dart';
import 'package:battery/battery.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  final Battery _battery = Battery();
  BatteryState? _batteryState;
  late StreamSubscription<BatteryState> _batteryStateSubscription;
  final bool _isPageOpened = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        if (state == BatteryState.charging) {
          _navigateToAnotherPage();
        } else if (state == BatteryState.discharging) {}
        _batteryState = state;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      {
        if (_batteryState == BatteryState.charging && mounted) {
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => const HomePageScreen(
                        id: '0',
                      )));
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isPageOpened) {
      // Check the current battery state and navigate accordingly
      if (_batteryState == BatteryState.charging) {
        _navigateToAnotherPage();
      }
    }
  }

  void _navigateToAnotherPage() {
    // Navigate to another page or perform any other action
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResumeRoutePage()),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _batteryStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          debugPrint('soar exit');
          return false;
        },
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xFF0F1F46)),
                child: Image.asset("assets/images/asset3.png"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Stack(children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/soar.png',
                                    height: 50,
                                  ),
                                ),
                                Center(
                                  widthFactor: 3.5,
                                  heightFactor: 2.5,
                                  child: Image.asset(
                                    'assets/images/asset2.png',
                                    height: 60,
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10.0)),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
