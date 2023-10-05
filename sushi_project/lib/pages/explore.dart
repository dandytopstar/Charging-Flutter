import 'package:flutter/material.dart';
// import 'package:sushi_project/pages/collection.dart';
import 'package:soar/pages/collection.dart';
import '../service/category_service.dart';
import './qrview.dart';
import '../constant/team.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final service = CategoryService();
  List<String> filteredItems = [
    'NFL',
    'MLB',
    'NCAA',
    'NFL San Francisco 49ers',
    'NFL Chicago Bears',
    'NFL Cincinnati Bengals',
    'NFL Denver Broncos',
    'NFL Buffalo Bills',
    'NFL Cleaveland Browns',
    'NFL Tampa Bay Buccaneers',
    'NFL Arizona Cardinals',
    'NFL Kansas City Chiefs',
    'NFL Los Angeles Chargers',
    'NFL IndianaPolis Colt',
    'NFL Dallas Cowboys',
    'NFL Miami Dolphins',
    'NFL Philadelphia Eagles',
    'NFL Atlanta Falcons',
    'NFL Jacksonville Jaguars',
    'NFL Detroit Lions',
    'NFL New York Giants',
    'NFL New York Jets',
    'NFL Green Bay Packers',
    'NFL Carolina Panthers',
    'NFL Las Vegas Raiders',
    'NFL Los Angeles Rams',
    'NFL Baltimore Ravens',
    'NFL Seattle Seahawks',
    'NFL New Orleans Saints',
    'NFL Pittsburgh Steelers',
    'NFL Houston Texans',
    'NFL Tennessee Titans',
    'NFL Minnesota Vikings',
    'NFL Seattle Seahawks',
    'NFL New Orleans Saints',
    'NFL Pittsburgh Steelers',
    'NFL Houston Texans',
    'NFL Tennessee Titans',
    'NFL Minnesota Vikings',
    'NFL Washington Commanders'
  ];

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
          Center(
              child: Column(
            children: [
              const SizedBox(height: 110),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filteredItems = [];
                      for (var category in Team().nflItems) {
                        if (category
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                          filteredItems.add(category);
                        }
                      }
                    });
                  },
                  // controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: 'Search All Collections',
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: Colors.grey[20],
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              )
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
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL San Francisco 49ers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nSan Francisco 49ers\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/49ER.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_SanFrancisco',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Chicago Bears')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Chicago Bears')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nChicago Bears      \nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/BEAR.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_Chicago',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Cincinnati Bengals')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Cincinnati Bengals')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nCincinnati Bengals\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/BENG.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_Cincinnati',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Buffalo Bills')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Buffalo Bills')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nBuffalo Bills\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/BLS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_Buffalo',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Denver Broncos')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Denver Broncos')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nDenver Broncos\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/BRCS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_BRCS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Cleaveland Browns')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Cleaveland Browns')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nCleaveland Browns\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/BRNS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_BRNS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Tampa Bay Buccaneers')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Tampa Bay Buccaneers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nTampa Bay Buccaneers\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/BUCN.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_BUCN',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Arizona Cardinals')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Arizona Cardinals')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nArizona Cardinals\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/CARD.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_CARD',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Kansas City Chiefs')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Kansas City Chiefs')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nKansas City Chiefs\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/CHFS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_CHFS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Los Angeles Chargers')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Los Angeles Chargers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nLos Angeles Chargers\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/CHRG.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_CHRG',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL IndianaPolis Colt')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL IndianaPolis Colt')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nIndianaPolis Colt\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/CLTS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_CLTS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Dallas Cowboys')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Dallas Cowboys')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nDallas Cowboys\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/COWB.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_COWB',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Miami Dolphins')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Miami Dolphins')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nMiami Dolphins\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/DLPH.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_DLPH',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Philadelphia Eagles')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Philadelphia Eagles')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nPhiladelphia Eagles\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/EGLS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_EGLS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Atlanta Falcons')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Atlanta Falcons')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nAtlanta Falcons\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/FALC.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_FALC',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Jacksonville Jaguars')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Jacksonville Jaguars')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nJacksonville Jaguars\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/JAGS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_JAGS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Detroit Lions')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Detroit Lions')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nDetroit Lions\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/LNS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_LNS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL New York Giants')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL New York Giants')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nNew York Giants\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/NYG.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_NYG',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL New York Jets')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL New York Jets')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nNew York Jets\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/NYJ.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_NYJ',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Green Bay Packers')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Green Bay Packers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nGreen Bay Packers\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/PAKS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_PAKS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Green Bay Packers')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Green Bay Packers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nNew England Patriots\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/PATS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_PATS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Carolina Panthers')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Carolina Panthers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nCarolina Panthers\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/PNTH.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_PNTH',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Las Vegas Raiders')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Las Vegas Raiders')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nLas Vegas Raiders\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/RAID.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_RAID',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Los Angeles Rams')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Los Angeles Rams')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nLos Angeles Rams\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/RMS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_RMS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Baltimore Ravens')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Baltimore Ravens')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nBaltimore Ravens\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/RVNS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_RVNS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Seattle Seahawks')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Seattle Seahawks')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nSeattle Seahawks\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/SHKS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_SHKS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL New Orleans Saints')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL New Orleans Saints')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nNew Orleans Saints\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/SNTS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_SNTS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Pittsburgh Steelers')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Pittsburgh Steelers')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nPittsburgh Steelers\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/STLR.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_STLR',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Houston Texans')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Houston Texans')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nHouston Texans\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/TEX.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_TEX',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Tennessee Titans')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Tennessee Titans')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nTennessee Titans\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/TTNS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_TTNS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Minnesota Vikings')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Minnesota Vikings')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nMinnesota Vikings\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/VKS.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_VKS',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Washington Commanders')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NFL Washington Commanders')
                          ? const CustomRowWidget(
                              labelText:
                                  'NFL \nWashington Commanders\nAnimation Packs ',
                              categoryItem:
                                  MyImageCard(assetPath: 'assets/1x/WASH.png'),
                              // CategoryItem(category: service.list[0]),
                              resource: 'NFL_WASH',
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('MLB')
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container();
                    }),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('MLB')
                          ? const CustomRowWidget(
                              labelText:
                                  'MLB \nLos Angeles Dodgers\nAnimation Packs',
                              categoryItem: MyImageCard(
                                  assetPath: 'assets/images/coming_soon.png'),
                              // CategoryItem(category: service.list[1]),
                              resource: 'MLB',
                            )
                          : Container();
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Builder(builder: (BuildContext context) {
                      return filteredItems.contains('NCAA')
                          ? const CustomRowWidget(
                              labelText:
                                  'NCAA \nOhio Stete Buckeyes\nAnimation Packs',
                              categoryItem: MyImageCard(
                                  assetPath: 'assets/images/coming_soon.png'),
                              // CategoryItem(category: service.list[2]),
                              resource: 'NCAA',
                            )
                          : Container();
                    }),
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

class CustomRowWidget extends StatelessWidget {
  // final Widget imageAsset;
  final Widget categoryItem;
  final String resource;
  final String labelText;

  const CustomRowWidget({
    super.key,
    // required this.imageAsset,
    required this.categoryItem,
    required this.resource,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 30.0),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Collection(id: resource),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
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
                    ),
                  );
                },
                child: categoryItem)),
        const SizedBox(width: 30.0),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Collection(id: resource),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
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
                    ),
                  );
                },
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  // ignore: sized_box_for_whitespace
                  Container(
                      width: 180,
                      child: Text(
                        labelText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          // Add desired text styles here
                        ),
                      ))
                ])

                // imageAsset,
                )),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Collection(id: resource),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
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
                ),
              );

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => Collection(id: resource),
              // ));
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
