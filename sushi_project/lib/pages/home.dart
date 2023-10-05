import 'package:flutter/material.dart';
import '../service/category_service.dart';
import './qrview.dart';
import './detail.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final service = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00252525),
        body: Stack(
          children: [
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
              top: 60,
              left: 40,
              child: Image.asset(
                "assets/images/soar.png",
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              top: 118,
              left: 68,
              child: Image.asset(
                "assets/images/asset6.png",
                width: 70,
                height: 70,
              ),
            ),
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
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                'Featured',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              )

                              // Image.asset(
                              //   "assets/images/featured.png",
                              //   width: 80,
                              //   height: 100,
                              // ),
                              )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 4;
                              String team =
                                  'NFL San Francisco 49ers \nSeries 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/49ER.png'),
                            // CategoryItem(category: service.list[0])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 8;
                              String team = 'NFL Chicago Bears Series 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/BEAR.png'),
                            // CategoryItem(category: service.list[1])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 12;
                              String team =
                                  'NFL Cincinnati Bengals\nSeries 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/BENG.png'),
                            // CategoryItem(category: service.list[2])
                          )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                'Animation Packs',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              )
                              // Image.asset(
                              //   "assets/images/animationpacks.png",
                              //   width: 140,
                              //   height: 100,
                              // ),
                              )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 16;
                              String team = 'NFL Buffalo Bills Series 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/BLS.png'),
                            // CategoryItem(category: service.list[0])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 20;
                              String team = 'NFL Denver Broncos Series 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/BRCS.png'),
                            // CategoryItem(category: service.list[1])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 24;
                              String team = 'NFL Cleaveland Browns\nSeries 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/BRNS.png'),
                            // CategoryItem(category: service.list[2])
                          )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                'My library',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              )
                              // Image.asset(
                              //   "assets/images/mylibrary.png",
                              //   width: 100,
                              //   height: 100,
                              // ),
                              )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 28;
                              String team =
                                  'NFL Tampa Bay Buccaneers\nSeries 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/BUCN.png'),
                            // CategoryItem(category: service.list[0])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 32;
                              String team = 'NFL Arizona Cardinals Series 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/CARD.png'),
                            // CategoryItem(category: service.list[1])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 36;
                              String team =
                                  'NFL Kansas City Chiefs\nSeries 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/CHFS.png'),
                            // CategoryItem(category: service.list[2])
                          )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text('New Drops',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              const id = 40;
                              String team =
                                  'NFL Los Angeles Chargers\nSeries 1.0';
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        DetailScreen(
                                  id: id,
                                  team: team,
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
                            child: const MyImageCard(
                                assetPath: 'assets/1x/CHRG.png'),
                            // CategoryItem(category: service.list[0])
                          )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 44;
                                    String team =
                                        'NFL IndianaPolis Colt\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/CLTS.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 48;
                                    String team =
                                        'NFL Dallas Cowboys Series 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/COWB.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text('Shop by Property',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 52;
                                    String team =
                                        'NFL Miami Dolphins Series 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/DLPH.png')
                                  // CategoryItem(category: service.list[0])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 56;
                                    String team =
                                        'NFL Philadelphia Eagles\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/EGLS.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 60;
                                    String team =
                                        'NFL Atlanta Falcons\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/FALC.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Image.asset(
                              "assets/images/hardgoods.png",
                              width: 150,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 64;
                                    String team =
                                        'NFL Jacksonville Jaguars\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/JAGS.png')
                                  // CategoryItem(category: service.list[0])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 68;
                                    String team =
                                        'NFL Detroit Lions \nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/LNS.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 72;
                                    String team =
                                        'NFL New York Giants\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/NYG.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Image.asset(
                              "assets/images/nfl.png",
                              width: 150,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 76;
                                    String team =
                                        'NFL New York Jets\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/NYJ.png')
                                  // CategoryItem(category: service.list[0])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 80;
                                    String team =
                                        'NFL Green Bay Packers\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/PAKS.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 84;
                                    String team =
                                        'NFL England Patriots\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/PATS.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Image.asset(
                              "assets/images/ncaa.png",
                              width: 150,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 88;
                                    String team =
                                        'NFL Carolina Panthers \nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/PNTH.png')
                                  // CategoryItem(category: service.list[0])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 92;
                                    String team =
                                        'NFL Las Vegas Raiders\nSeries 1.0';

                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/RAID.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 96;
                                    String team =
                                        'NFL Los Angeles Rams\nSeries 1.0';

                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/RMS.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Image.asset(
                              "assets/images/mlb.png",
                              width: 150,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 100;
                                    String team =
                                        'NFL Baltimore Ravens\nSeries 1.0';

                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/RVNS.png')
                                  // CategoryItem(category: service.list[0])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 104;
                                    String team =
                                        'NFL Seattle Seahawks\nSeries 1.0';

                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/SHKS.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 108;
                                    String team =
                                        'NFL New Orleans Saints\nSeries 1.0';

                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/SNTS.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Image.asset(
                              "assets/images/nhl.png",
                              width: 150,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 112;
                                    String team =
                                        'NFL Pittsburgh Steelers\nSeries 1.0';

                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/STLR.png')
                                  // CategoryItem(category: service.list[0])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 116;
                                    String team =
                                        'NFL Houston Texans\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/TEX.png')
                                  // CategoryItem(category: service.list[1])
                                  )),
                          const SizedBox(width: 3.0),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    const id = 120;
                                    String team =
                                        'NFL Tennessee Titans\nSeries 1.0';
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailScreen(
                                        id: id,
                                        team: team,
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
                                    ));
                                  },
                                  child: const MyImageCard(
                                      assetPath: 'assets/1x/TTNS.png')
                                  // CategoryItem(category: service.list[2])
                                  )),
                          const SizedBox(width: 15.0)
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  10), // Set the desired border radius here
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
