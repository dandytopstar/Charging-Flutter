import 'package:flutter/material.dart';
import '../service/category_service.dart';
import '../ui/category_item.dart';
import './preview.dart';
import 'package:pay/pay.dart';
import 'dart:io';
import './homepage.dart';
import '../constant/api.dart';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';

final service = CategoryService();

class DetailScreen extends StatefulWidget {
  final int id;
  final String team;
  const DetailScreen({super.key, required this.id, required this.team});
  @override
  // ignore: library_private_types_in_public_api
  _DetailScreen createState() => _DetailScreen();
}

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
String deviceId = "";

class _DetailScreen extends State<DetailScreen> {
  String os = Platform.operatingSystem;
  late Future<bool> _userCanPay;
  String selectedTeam = "";
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

  // ignore: deprecated_member_use
  Pay payClient = Pay.withAssets(['gpay.json']);
  @override
  void initState() {
    _userCanPay = payClient.userCanPay(PayProvider.google_pay);
    // print(widget.id);
    // print(widget.team);
    super.initState();
    retrieveDeviceId();
  }

  Future<void> fetchData(String widgetUrl, String widgetUrl1, String widgetUrl2,
      String widgetUrl3, String deviceID) async {
    // Make the GET request with variables
    debugPrint(widgetUrl);
    debugPrint(widgetUrl1);
    debugPrint(widgetUrl2);
    debugPrint(widgetUrl3);
    var url = Uri.parse('${API.dev}library');
    var headers = {'Content-Type': 'application/json'};
    var body = '{"widgetUrl": "$widgetUrl", "deviceID": "$deviceID"}';
    var body1 = '{"widgetUrl": "$widgetUrl1", "deviceID": "$deviceID"}';
    var body2 = '{"widgetUrl": "$widgetUrl2", "deviceID": "$deviceID"}';
    var body3 = '{"widgetUrl": "$widgetUrl3", "deviceID": "$deviceID"}';

    var response = await http.post(url, headers: headers, body: body);
    var response1 = await http.post(url, headers: headers, body: body1);
    var response2 = await http.post(url, headers: headers, body: body2);
    var response3 = await http.post(url, headers: headers, body: body3);

    debugPrint(response.body);
    debugPrint(response1.body);
    debugPrint(response2.body);
    debugPrint(response3.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00252525),
        body: Stack(children: [
          Positioned(
              top: 60,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePageScreen(
                            id: '1',
                          )));
                  // Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/back.png",
                  width: 80,
                  height: 50,
                ),
              )),
          Positioned(
              top: 60,
              right: 20,
              child: GestureDetector(
                  onTap: () {
                    //payment option
                  },
                  child: FutureBuilder(
                    future: _userCanPay,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == true) {
                          return ElevatedButton(
                            onPressed: () async {
                              if (os == "android") {
                                final result =
                                    await payClient.showPaymentSelector(
                                  PayProvider.google_pay,
                                  [
                                    const PaymentItem(
                                      amount: '2.99',
                                      status: PaymentItemStatus.final_price,
                                    )
                                  ],
                                );
                                await fetchData(
                                    service.list[widget.id].video,
                                    service.list[widget.id + 1].video,
                                    service.list[widget.id + 2].video,
                                    service.list[widget.id + 3].video,
                                    deviceId);

                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomePageScreen(
                                          id: '2',
                                        )));
                                debugPrint(result.toString());
                              } else {}
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent),
                            child: Image.asset(
                              "assets/images/individual_price.png",
                              width: 90,
                              height: 50,
                            ),
                          );
                        } else {
                          // userCanPay returned false
                          // Consider showing an alternative payment method
                        }
                      }
                      return Container();
                    },
                  ))),
          Center(
              child: Column(
            children: [
              const SizedBox(height: 140),
              FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Text(
                    widget.team,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )),
          Column(children: [
            const SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   // width: MediaQuery.of(context).size.width * 0.6,
                //   decoration: const BoxDecoration(
                //     color: Colors.black,
                //   ),
                //   child: GestureDetector(
                //       onTap: () {
                //         int id = widget.id;
                //         String link = service.list[widget.id].video;
                //         print(link);
                //         Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => PreviewScreen(
                //             id: id,
                //             link: link,
                //           ),
                //         ));
                //       },
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(width: 30.0),
                //           Expanded(
                //             child:
                //                 CategoryItem(category: service.list[widget.id]),
                //           ),
                //           const SizedBox(width: 30.0),
                //           Expanded(
                //             child:
                //                 CategoryItem(category: service.list[widget.id]),
                //           ),
                //         ],
                //       )

                //       // ClipRRect(
                //       //   borderRadius: BorderRadius.circular(20),
                //       //   child: CachedNetworkImage(
                //       //     imageUrl: service.list[widget.id].video,
                //       //     fit: BoxFit.fill,
                //       //     progressIndicatorBuilder:
                //       //         (context, url, downloadProgress) => const Center(
                //       //       child: SizedBox(
                //       //         width: 60,
                //       //         height: 60,
                //       //         child: CircularProgressIndicator(
                //       //           valueColor:
                //       //               AlwaysStoppedAnimation<Color>(Colors.blue),
                //       //         ),
                //       //       ),
                //       //     ),
                //       //     errorWidget: (context, url, error) => const Center(
                //       //       child: Icon(Icons.error),
                //       //     ),
                //       //   ),
                //       // ),
                //       ),
                // )

                // ClipRRect(
                //   borderRadius:
                //       BorderRadius.circular(40), // Set desired corner radius
                //   child: CachedNetworkImage(
                //     imageUrl: service.list[widget.id].video,
                //     fit: BoxFit.fill,
                //     progressIndicatorBuilder:
                //         (context, url, downloadProgress) => Center(
                //             // ignore: sized_box_for_whitespace
                //             child: Container(
                //       width: 60,
                //       height: 60,
                //       child: const CircularProgressIndicator(
                //         valueColor: AlwaysStoppedAnimation<Color>(
                //             Colors.blue), // Set the color of the loading circle

                //         // value: downloadProgress.progress,
                //       ),
                //     )),
                //     errorWidget: (context, url, error) => const Center(
                //       child: Icon(Icons.error),
                //     ),
                //   ),
                // ),

                // const SizedBox(width: 50.0),
                const SizedBox(width: 30.0),

                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    int id = widget.id;
                    String link = service.list[widget.id].video;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        id: id,
                        link: link,
                      ),
                    ));
                  },
                  child:

                      //  Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //     color: Colors.black, // Placeholder color
                      //     image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         image: CachedNetworkImageProvider(
                      //             service.list[widget.id].video)),
                      //   ),
                      // ),

                      CategoryItem(category: service.list[widget.id]),
                )),
                const SizedBox(width: 60.0),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    int id = widget.id + 1;
                    String link = service.list[id].video;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        id: id,
                        link: link,
                      ),
                    ));
                  },
                  child: CategoryItem(category: service.list[widget.id + 1]),
                )),
                const SizedBox(width: 30.0),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 30.0),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    int id = widget.id + 2;
                    String link = service.list[id].video;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        id: id,
                        link: link,
                      ),
                    ));
                  },
                  child: CategoryItem(category: service.list[widget.id + 2]),
                )),
                const SizedBox(width: 60.0),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          int id = widget.id + 3;
                          String link = service.list[3].video;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PreviewScreen(
                              id: id,
                              link: link,
                            ),
                          ));
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: CategoryItem(
                              category: service.list[widget.id + 3]),
                        ))),
                const SizedBox(width: 30.0),
              ],
            ),
          ])
        ]));
  }
}
