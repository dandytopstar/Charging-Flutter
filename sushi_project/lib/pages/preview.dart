import 'package:flutter/material.dart';
import 'package:soar/constant/filestorage.dart';
import '../service/category_service.dart';
import 'package:pay/pay.dart';
import '../payment_configuration.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';
import '../constant/api.dart';
import 'package:http/http.dart' as http;
import './homepage.dart';
import 'package:cached_network_image/cached_network_image.dart';

// import 'package:dio/dio.dart';
final service = CategoryService();

class PreviewScreen extends StatefulWidget {
  final int id;
  final String link;
  const PreviewScreen({super.key, required this.id, required this.link});

  @override
  // ignore: library_private_types_in_public_api
  _PreviewScreen createState() => _PreviewScreen();
}

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
String deviceId = "";

class _PreviewScreen extends State<PreviewScreen> {
  late Future<bool> _userCanPay;
  late Future<bool> _userCanApplePay;
  final service = CategoryService();

  // ignore: deprecated_member_use
  Pay payClient = Pay.withAssets(['gpay.json']);
// ignore: deprecated_member_use
  Pay payAppleClient=Pay.withAssets(['applepay.json']);
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

  @override
  void initState() {
    _userCanPay = payClient.userCanPay(PayProvider.google_pay);
    _userCanApplePay=payAppleClient.userCanPay(PayProvider.apple_pay);

    super.initState();
    retrieveDeviceId();
  }

  Future<void> fetchData(String widgetUrl, String deviceID) async {
    // Make the GET request with variables
    debugPrint(widgetUrl);
    String urlParts = widgetUrl.split('/')[4];
    String newUrl1 = widgetUrl.replaceAll(urlParts, '1x');
    String newUrl2 = widgetUrl.replaceAll(urlParts, '2x');
    String newUrl3 = widgetUrl.replaceAll(urlParts, '3x');
    String newUrl4 = widgetUrl.replaceAll(urlParts, '4x');

    var url = Uri.parse('${API.dev}library');
    var headers = {'Content-Type': 'application/json'};
    var body = '{"widgetUrl": "$newUrl1", "deviceID": "$deviceID"}';
    var body1 = '{"widgetUrl": "$newUrl2", "deviceID": "$deviceID"}';
    var body2 = '{"widgetUrl": "$newUrl3", "deviceID": "$deviceID"}';
    var body3 = '{"widgetUrl": "$newUrl4", "deviceID": "$deviceID"}';
    var response1 = await http.post(url, headers: headers, body: body);
    var response2 = await http.post(url, headers: headers, body: body1);
    var response3 = await http.post(url, headers: headers, body: body2);
    var response4 = await http.post(url, headers: headers, body: body3);
    debugPrint(response1.body);
    debugPrint(response2.body);
    debugPrint(response3.body);
    debugPrint(response4.body);
  }

  void downloadAndSaveGif(String url) async {
    var response = await http.get(Uri.parse(url));
    FileStorage.writeCounter(
        response.bodyBytes, 'animation_${widget.link.split('/').last}');
  }

  String os = Platform.operatingSystem;
  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    paymentItems: const [
      PaymentItem(
        label: 'Item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Item B',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Total',
        amount: '0.02',
        status: PaymentItemStatus.final_price,
      )
    ],
    style: ApplePayButtonStyle.black,
    width: double.infinity,
    height: 50,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(40), // Set desired corner radius
              child: CachedNetworkImage(
                imageUrl: service.list[widget.id].video,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, bottom: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Pay Button
                    if (Platform.isAndroid)
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
                                child: Visibility(
                                  visible: Platform.isAndroid,
                                  child: FutureBuilder(
                                    future: _userCanPay,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.data == true) {
                                          return ElevatedButton(
                                            // ignore: sort_child_properties_last
                                            child: const Text(
                                                'Get 4 Animations for \$2.99'),
                                            onPressed: () async {
                                              final result = await payClient
                                                  .showPaymentSelector(
                                                PayProvider.google_pay,
                                                [
                                                  const PaymentItem(
                                                    amount: '2.99',
                                                    status: PaymentItemStatus
                                                        .final_price,
                                                  )
                                                ],
                                              );
                                              await fetchData(
                                                  widget.link, deviceId);
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePageScreen(
                                                            id: '2',
                                                          )));

                                              debugPrint(result.toString());
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Set desired corner radius here
                                              ),
                                            ),
                                          );
                                        } else {
                                          // userCanPay returned false
                                          // Consider showing an alternative payment method
                                        }
                                      }
                                      return Container();
                                    },
                                  ),
                                )

                                // GooglePayButton(
                                //   paymentConfiguration:
                                //       PaymentConfiguration.fromJsonString(
                                //           defaultGooglePay),
                                //   paymentItems: const [
                                //     PaymentItem(
                                //       label: 'Total',
                                //       amount: '0.01',
                                //       status: PaymentItemStatus.final_price,
                                //     )
                                //   ],
                                //   type: GooglePayButtonType.pay,
                                //   margin: const EdgeInsets.only(top: 15.0),
                                //   onPaymentResult: (result) {
                                //     // downloadAndSaveGif(widget.link);
                                //     debugPrint(widget.link.split('/').last);
                                //     debugPrint(widget.link);
                                //     debugPrint('${API.dev}library');
                                //     //send to library
                                //     fetchData(widget.link, deviceId);
                                //     Navigator.of(context).push(MaterialPageRoute(
                                //         builder: (context) =>
                                //             const HomePageScreen(
                                //               id: '2',
                                //             )));
                                //   },
                                //   loadingIndicator: const Center(
                                //     child: CircularProgressIndicator(),
                                //   ),
                                // ),

                                ),
                          );
                        },
                      ),

                    // Apple Pay Button
                    if (Platform.isIOS)
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
                                // child: applePayButton
                                
                                  child: FutureBuilder(
                                    future: _userCanApplePay,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.data == true) {
                                          return ElevatedButton(
                                            // ignore: sort_child_properties_last
                                            child: const Text(
                                                'Get 4 Animations for \$2.99'),
                                            onPressed: () async {
                                              final result = await payAppleClient
                                                  .showPaymentSelector(
                                                PayProvider.apple_pay,
                                                [
                                                  const PaymentItem(
                                                     label: 'Get 4 Animations',
                                                     amount: '2.99',
                                                     status: PaymentItemStatus.final_price,
                                                    ),
                                                ],
                                              );
                                              fetchData(widget.link, deviceId);
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePageScreen(
                                                            id: '2',
                                                          )));

                                              debugPrint(result.toString());
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Set desired corner radius here
                                              ),
                                            ),
                                          );
                                        } else {
                                          // userCanPay returned false
                                          // Consider showing an alternative payment method
                                        }
                                      }
                                      return Container();
                                    },
                                  ),
                         
                               

                                ),
                          );
                        },
                      ),
                      // LayoutBuilder(
                      //   builder: (context, constraints) {
                      //     double screenWidth =
                      //         MediaQuery.of(context).size.width;
                      //     double buttonWidth = screenWidth *
                      //         0.8; // Set the desired percentage here

                      //     return Padding(
                      //       padding: const EdgeInsets.all(12.0),
                      //       child: SizedBox(
                      //         width: buttonWidth,
                      //         child: applePayButton,
                      //       ),
                      //     );
                      //   },
                      // ),
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

// child: FutureBuilder(
//   future: _userCanPay,
//   builder:
//       (BuildContext context, AsyncSnapshot snapshot) {
//     if (snapshot.connectionState ==
//         ConnectionState.done) {
//       if (snapshot.data == true) {
//         return ElevatedButton(
//           onPressed: () async {
//             final result =
//                 await payClient.showPaymentSelector(
//               PayProvider.google_pay,
//               [
//                 const PaymentItem(
//                   amount: '50.00',
//                   status: PaymentItemStatus.final_price,
//                 )
//               ],
//             );
//             print(result.toString());
//           },
//           style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.all(16.0),
//               shape: RoundedRectangleBorder(
//                   borderRadius:
//                       BorderRadius.circular(10))),
//           child: const Text(
//             'Get 4 animations for \$1.99',
//             style: TextStyle(
//                 fontSize: 25), // Set desired font size
//           ),
//         );
//       } else {
//         // userCanPay returned false
//         // Consider showing an alternative payment method
//       }
//     }
//     return Container();
//   },
// )
