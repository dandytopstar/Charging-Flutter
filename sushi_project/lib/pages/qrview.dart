import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import './detail.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _buildQrView(context)),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      if (result != null)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16,
                              right:
                                  16.0), // Set the desired right padding here
                          child: Text(
                            '${result!.code}',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        )
                      // Text(
                      //     'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      else
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right:
                                  16.0), // Set the desired right padding here
                          child: Text(
                            'Point at the QR code located inside',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      if (result == null)
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right:
                                  16.0), // Set the desired right padding here
                          child: Text(
                            'your strap packaging',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 16, right: 16),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: const [
                      //       Center(
                      //         child: Text(
                      //           'Point at the QR code located inside',
                      //           style: TextStyle(
                      //               fontSize: 10, color: Colors.white),
                      //         ),
                      //       ),
                      //       Center(
                      //         child: Text(
                      //           'your strap packaging',
                      //           style: TextStyle(
                      //               fontSize: 10, color: Colors.white),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(children: [
      QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
      Positioned(
          top: 60,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text('Close',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  decoration: TextDecoration.underline,
                )),
          )),
    ]);
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    bool detailScreenOpened = false;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (!detailScreenOpened &&
            result?.code == 'NFL San Francisco 49ers Series 1.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'NFL',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'NFL San Francisco 49ers Series 2.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'NFL',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'NFL San Francisco 49ers Series 3.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'NFL',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'MLB Los Angeles Dodgers Series 1.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'MLB',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'MLB Los Angeles Dodgers Series 2.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'MLB',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'MLB Los Angeles Dodgers Series 3.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'MLB',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'NCAA Ohio Stete Buckeyes Series 1.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 0,
                      team: 'NCAA',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'NCAA Ohio Stete Buckeyes Series 2.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 1,
                      team: 'NCAA',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
        if (!detailScreenOpened &&
            result?.code == 'NCAA Ohio Stete Buckeyes Series 3.0') {
          detailScreenOpened = true;
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailScreen(
                      id: 2,
                      team: 'NCAA',
                    )),
          ).then((value) => detailScreenOpened = false);
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
