import 'package:flutter/material.dart';
import '../ui/category_item.dart';
import '../service/category_service.dart';
import './detail.dart';
import 'package:pay/pay.dart';
import 'dart:io';
import '../constant/team.dart';

final service = CategoryService();

class Collection extends StatefulWidget {
  final String id;
  const Collection({super.key, required this.id});
  @override
  // ignore: library_private_types_in_public_api
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  String os = Platform.operatingSystem;
  late Future<bool> _userCanPay;

  String team = "";
  List<String> teams = [];
  // ignore: deprecated_member_use
  Pay payClient = Pay.withAssets(['gpay.json']);
  final service = CategoryService();

  @override
  void initState() {
    _userCanPay = payClient.userCanPay(PayProvider.google_pay);
    selectTeam();
    super.initState();
  }

  void selectTeam() {
    team = widget.id;
    if (team == "NFL_SanFrancisco") {
      teams = Team().nflSanFranciscoItems;
    }
    if (team == "NFL_Chicago") {
      teams = Team().nflChicagoItems;
    }
    if (team == "NFL_Cincinnati") {
      teams = Team().nflCincinnatiItems;
    }
    if (team == "NFL_Buffalo") {
      teams = Team().nflBuffaloItems;
    }
    if (team == "NFL_BRCS") {
      teams = Team().nflBrcsItems;
    }
    if (team == "NFL_BRNS") {
      teams = Team().nflBrnsItems;
    }
    if (team == "NFL_BUCN") {
      teams = Team().nflBucnItems;
    }
    if (team == "NFL_CARD") {
      teams = Team().nflCardItems;
    }
    if (team == "NFL_CHFS") {
      teams = Team().nflChfsItems;
    }
    if (team == "NFL_CHRG") {
      teams = Team().nflChrgItems;
    }
    if (team == "NFL_CLTS") {
      teams = Team().nflcltsItems;
    }
    if (team == "NFL_COWB") {
      teams = Team().nflcowbItems;
    }
    if (team == "NFL_DLPH") {
      teams = Team().nfldlphItems;
    }
    if (team == "NFL_EGLS") {
      teams = Team().nfleglsItems;
    }
    if (team == "NFL_FALC") {
      teams = Team().nflfalcItems;
    }
    if (team == "NFL_JAGS") {
      teams = Team().nfljagsItems;
    }
    if (team == "NFL_LNS") {
      teams = Team().nfllnsItems;
    }
    if (team == "NFL_NYG") {
      teams = Team().nflnygItems;
    }
    if (team == "NFL_NYJ") {
      teams = Team().nflnyjItems;
    }
    if (team == "NFL_PAKS") {
      teams = Team().nflpaksItems;
    }
    if (team == "NFL_PATS") {
      teams = Team().nflpatsItems;
    }
    if (team == "NFL_PNTH") {
      teams = Team().nflpnthItems;
    }
    if (team == "NFL_RAID") {
      teams = Team().nflraidItems;
    }
    if (team == "NFL_RMS") {
      teams = Team().nflrmsItems;
    }
    if (team == "NFL_RVNS") {
      teams = Team().nflrvnsItems;
    }
    if (team == "NFL_SHKS") {
      teams = Team().nflshksItems;
    }
    if (team == "NFL_SNTS") {
      teams = Team().nflsntsItems;
    }
    if (team == "NFL_STLR") {
      teams = Team().nflstlrItems;
    }
    if (team == "NFL_TEX") {
      teams = Team().nfltexItems;
    }
    if (team == "NFL_TTNS") {
      teams = Team().nflttnsItems;
    }
    if (team == "NFL_VKS") {
      teams = Team().nflvksItems;
    }
    if (team == "NFL_WASH") {
      teams = Team().nflwashItems;
    }
    if (team == "MLB") {
      teams = Team().mlbItems;
    }
    if (team == "NCAA") {
      teams = Team().ncaaItems;
    }
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
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/back.png",
                  width: 80,
                  height: 50,
                ),
              )),
          // Positioned(
          //     top: 60,
          //     right: 20,
          //     child: GestureDetector(
          //         onTap: () {
          //           debugPrint(widget.id);
          //           //payment option
          //         },
          //         child: FutureBuilder(
          //           future: _userCanPay,
          //           builder: (BuildContext context, AsyncSnapshot snapshot) {
          //             if (snapshot.connectionState == ConnectionState.done) {
          //               if (snapshot.data == true) {
          //                 return ElevatedButton(
          //                   onPressed: () async {
          //                     if (os == "android") {
          //                       final result =
          //                           await payClient.showPaymentSelector(
          //                         PayProvider.google_pay,
          //                         [
          //                           const PaymentItem(
          //                             amount: '4.99',
          //                             status: PaymentItemStatus.final_price,
          //                           )
          //                         ],
          //                       );
          //                       debugPrint(result.toString());
          //                       // ignore: use_build_context_synchronously
          //                       showDialog(
          //                         context: context,
          //                         builder: (BuildContext dialogContext) =>
          //                             AlertDialog(
          //                           title: const Text('Payment Successful'),
          //                           content: const Text(
          //                               'Thank you for your payment.'),
          //                           actions: <Widget>[
          //                             ElevatedButton(
          //                               child: const Text('OK'),
          //                               onPressed: () {
          //                                 Navigator.of(dialogContext).pop();
          //                               },
          //                             ),
          //                           ],
          //                         ),
          //                       );
          //                     } else {}
          //                   },
          //                   style: ElevatedButton.styleFrom(
          //                       backgroundColor: Colors.transparent),
          //                   child: Image.asset(
          //                     "assets/images/total_price.png",
          //                     width: 90,
          //                     height: 50,
          //                   ),
          //                 );
          //               } else {
          //                 // userCanPay returned false
          //                 // Consider showing an alternative payment method
          //               }
          //             }
          //             return Container();
          //           },
          //         ))),
          Center(
              child: Column(
            children: [
              const SizedBox(height: 140),
              FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Image.asset(
                    "assets/images/get_label_collection.png",
                    width: 40,
                    height: 40,
                  ))
            ],
          )),
          const SizedBox(
            height: 230,
          ),
          Column(
            children: [
              const SizedBox(height: 180),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 30.0),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  int id = service.getIndexForName(team);
                                  // print(id);
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: teams[3],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = const Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));

                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child:
                                    // const MyImageCard(
                                    //     assetPath: 'assets/images/coming_soon.png'),
                                    CategoryItem(
                                        category: service.list[
                                            service.getIndexForName(team)]))),
                        const SizedBox(width: 30.0),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  int id = service.getIndexForName(team);

                                  Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        DetailScreen(
                                      id: id,
                                      team: teams[3],
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = const Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09),
                                    Text(
                                      teams[0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      '4 Animations Available',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ))),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            int id = service.getIndexForName(team);

                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      DetailScreen(
                                id: id,
                                team: teams[3],
                              ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = const Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ));
                          },
                          child: Image.asset(
                            "assets/images/arrow.png",
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 30.0),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  // int id = service.getIndexForName(team) + 1;
                                  // print(service.getIndexForName(team));
                                  // Navigator.of(context).push(PageRouteBuilder(
                                  //   pageBuilder: (context, animation,
                                  //           secondaryAnimation) =>
                                  //       DetailScreen(
                                  //     id: id,
                                  //     team: teams[4],
                                  //   ),
                                  //   transitionsBuilder: (context, animation,
                                  //       secondaryAnimation, child) {
                                  //     var begin = const Offset(1.0, 0.0);
                                  //     var end = Offset.zero;
                                  //     var curve = Curves.ease;

                                  //     var tween = Tween(begin: begin, end: end)
                                  //         .chain(CurveTween(curve: curve));

                                  //     return SlideTransition(
                                  //       position: animation.drive(tween),
                                  //       child: child,
                                  //     );
                                  //   },
                                  // ));
                                },
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: Card(
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors
                                            .grey[300], // Placeholder color
                                      ),
                                      child: Image.asset(
                                        'assets/images/coming_soon.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  //  CategoryItem(category: service.list[0]),
                                ))),

                        // CategoryItem(
                        //     category: service.list[
                        //         service.getIndexForName(team) + 1]))),
                        const SizedBox(width: 30.0),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  int id = service.getIndexForName(team) + 1;
                                  // print(service.getIndexForName(team));
                                  Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        DetailScreen(
                                      id: id,
                                      team: teams[4],
                                    ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = const Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09),
                                    Text(
                                      teams[1],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // const Text(
                                    //   '4 Animations Available',
                                    //   style: TextStyle(
                                    //     color: Colors.blue,
                                    //     fontSize: 10,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                  ],
                                ))),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            int id = service.getIndexForName(team) + 1;
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      DetailScreen(
                                id: id,
                                team: teams[4],
                              ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = const Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ));
                          },
                          child: Image.asset(
                            "assets/images/arrow.png",
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        )),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const SizedBox(width: 30.0),
                    //     Expanded(
                    //         child: GestureDetector(
                    //             onTap: () {
                    //               int id = service.getIndexForName(team) + 2;
                    //               Navigator.of(context).push(
                    //                 PageRouteBuilder(
                    //                   pageBuilder: (context, animation,
                    //                           secondaryAnimation) =>
                    //                       DetailScreen(
                    //                     id: id,
                    //                     team: teams[5],
                    //                   ),
                    //                   transitionsBuilder: (context, animation,
                    //                       secondaryAnimation, child) {
                    //                     var begin = const Offset(1.0, 0.0);
                    //                     var end = Offset.zero;
                    //                     var curve = Curves.ease;

                    //                     var tween = Tween(
                    //                             begin: begin, end: end)
                    //                         .chain(CurveTween(curve: curve));

                    //                     return SlideTransition(
                    //                       position: animation.drive(tween),
                    //                       child: child,
                    //                     );
                    //                   },
                    //                 ),
                    //               );
                    //             },
                    //             child: CategoryItem(
                    //                 category: service.list[
                    //                     service.getIndexForName(team) + 2]))),
                    //     const SizedBox(width: 30.0),
                    //     Expanded(
                    //         child: GestureDetector(
                    //             onTap: () {
                    //               int id = service.getIndexForName(team) + 2;
                    //               Navigator.of(context).push(
                    //                 PageRouteBuilder(
                    //                   pageBuilder: (context, animation,
                    //                           secondaryAnimation) =>
                    //                       DetailScreen(
                    //                     id: id,
                    //                     team: teams[5],
                    //                   ),
                    //                   transitionsBuilder: (context, animation,
                    //                       secondaryAnimation, child) {
                    //                     var begin = const Offset(1.0, 0.0);
                    //                     var end = Offset.zero;
                    //                     var curve = Curves.ease;

                    //                     var tween = Tween(
                    //                             begin: begin, end: end)
                    //                         .chain(CurveTween(curve: curve));

                    //                     return SlideTransition(
                    //                       position: animation.drive(tween),
                    //                       child: child,
                    //                     );
                    //                   },
                    //                 ),
                    //               );
                    //             },
                    //             child: Column(
                    //               children: [
                    //                 SizedBox(
                    //                     height:
                    //                         MediaQuery.of(context).size.height *
                    //                             0.09),
                    //                 Text(
                    //                   teams[2],
                    //                   style: const TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 11,
                    //                     fontWeight: FontWeight.bold,
                    //                   ),
                    //                 ),
                    //                 const Text(
                    //                   '4 Animations Available',
                    //                   style: TextStyle(
                    //                     color: Colors.blue,
                    //                     fontSize: 10,
                    //                     fontWeight: FontWeight.bold,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ))),
                    //     Expanded(
                    //         child: GestureDetector(
                    //       onTap: () {
                    //         int id = service.getIndexForName(team) + 2;
                    //         Navigator.of(context).push(
                    //           PageRouteBuilder(
                    //             pageBuilder:
                    //                 (context, animation, secondaryAnimation) =>
                    //                     DetailScreen(
                    //               id: id,
                    //               team: teams[5],
                    //             ),
                    //             transitionsBuilder: (context, animation,
                    //                 secondaryAnimation, child) {
                    //               var begin = const Offset(1.0, 0.0);
                    //               var end = Offset.zero;
                    //               var curve = Curves.ease;

                    //               var tween = Tween(begin: begin, end: end)
                    //                   .chain(CurveTween(curve: curve));

                    //               return SlideTransition(
                    //                 position: animation.drive(tween),
                    //                 child: child,
                    //               );
                    //             },
                    //           ),
                    //         );
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/arrow.png",
                    //         height: MediaQuery.of(context).size.height * 0.25,
                    //       ),
                    //     )),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ))
            ],
          )
        ]));
  }
}

class MyImageCard extends StatelessWidget {
  final String assetPath;

  const MyImageCard({super.key, required this.assetPath});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey[300], // Placeholder color
          ),
          child: Image.asset(
            assetPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
