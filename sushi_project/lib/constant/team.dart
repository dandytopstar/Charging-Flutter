import '../models/category.dart';
import '../constant/api.dart';

class Team {
  List<String> nflItems = [
    'MLB',
    'NCAA',
    'NFL San Francisco 49ers',
    'NFL Chicago Bears',
    'NFL Cincinnati Bengals',
    'NFL Buffalo Bills',
    'NFL Denver Broncos',
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
  List<String> nflSanFranciscoItems = [
    'NFL \nSan Francisco 49ers\nAnimation Packs 1.0',
    'NFL \nSan Francisco 49ers\nAnimation Packs 2.0',
    'NFL \nSan Francisco 49ers\nAnimation Packs 3.0',
    'NFL San Francisco 49ers \nSeries 1.0',
    'NFL San Francisco 49ers \nSeries 2.0',
    'NFL San Francisco 49ers \nSeries 3.0',
  ];
  List<String> nflChicagoItems = [
    'NFL \nChicago Bears\nAnimation Packs 1.0',
    'NFL \nChicago Bears\nAnimation Packs 2.0',
    'NFL \nChicago Bears\nAnimation Packs 3.0',
    'NFL Chicago Bears Series 1.0',
    'NFL Chicago Bears Series 2.0',
    'NFL Chicago Bears Series 3.0',
  ];
  List<String> nflCincinnatiItems = [
    'NFL \nCincinnati Bengals\nAnimation Packs 1.0',
    'NFL \nCincinnati Bengals\nAnimation Packs 2.0',
    'NFL \nCincinnati Bengals\nAnimation Packs 3.0',
    'NFL Cincinnati Bengals\nSeries 1.0',
    'NFL Cincinnati Bengals\nSeries 2.0',
    'NFL Cincinnati Bengals\nSeries 3.0',
  ];
  List<String> nflBuffaloItems = [
    'NFL \nBuffalo Bills\nAnimation Packs 1.0',
    'NFL \nBuffalo Bills\nAnimation Packs 2.0',
    'NFL \nBuffalo Bills\nAnimation Packs 3.0',
    'NFL Buffalo Bills Series 1.0',
    'NFL Buffalo Bills Series 2.0',
    'NFL Buffalo Bills Series 3.0',
  ];
  List<String> nflBrcsItems = [
    'NFL \nDenver Broncos\nAnimation Packs 1.0',
    'NFL \nDenver Broncos\nAnimation Packs 2.0',
    'NFL \nDenver Broncos\nAnimation Packs 3.0',
    'NFL Denver Broncos Series 1.0',
    'NFL Denver Broncos Series 2.0',
    'NFL Denver Broncos Series 3.0',
  ];
  List<String> nflBrnsItems = [
    'NFL \nCleaveland Browns\nAnimation Packs 1.0',
    'NFL \nCleaveland Browns\nAnimation Packs 2.0',
    'NFL \nCleaveland Browns\nAnimation Packs 3.0',
    'NFL Cleaveland Browns\nSeries 1.0',
    'NFL Cleaveland Browns\nSeries 2.0',
    'NFL Cleaveland Browns\nSeries 3.0',
  ];
  List<String> nflBucnItems = [
    'NFL \nTampa Bay Buccaneers\nAnimation Packs 1.0',
    'NFL \nTampa Bay Buccaneers\nAnimation Packs 2.0',
    'NFL \nTampa Bay Buccaneers\nAnimation Packs 3.0',
    'NFL Tampa Bay Buccaneers\nSeries 1.0',
    'NFL Tampa Bay Buccaneers\nSeries 2.0',
    'NFL Tampa Bay Buccaneers\nSeries 3.0',
  ];
  List<String> nflCardItems = [
    'NFL \nArizona Cardinals\nAnimation Packs 1.0',
    'NFL \nArizona Cardinals\nAnimation Packs 2.0',
    'NFL \nArizona Cardinals\nAnimation Packs 3.0',
    'NFL Arizona Cardinals Series 1.0',
    'NFL Arizona Cardinals Series 2.0',
    'NFL Arizona Cardinals Series 3.0',
  ];
  List<String> nflChfsItems = [
    'NFL \nKansas City Chiefs\nAnimation Packs 1.0',
    'NFL \nKansas City Chiefs\nAnimation Packs 2.0',
    'NFL \nKansas City Chiefs\nAnimation Packs 3.0',
    'NFL Kansas City Chiefs\nSeries 1.0',
    'NFL Kansas City Chiefs\nSeries 2.0',
    'NFL Kansas City Chiefs\nSeries 3.0',
  ];
  List<String> nflChrgItems = [
    'NFL \nLos Angeles Chargers\nAnimation Packs 1.0',
    'NFL \nLos Angeles Chargers\nAnimation Packs 2.0',
    'NFL \nLos Angeles Chargers\nAnimation Packs 3.0',
    'NFL Los Angeles Chargers\nSeries 1.0',
    'NFL Los Angeles Chargers\nSeries 2.0',
    'NFL Los Angeles Chargers\nSeries 3.0',
  ];

  List<String> nflcltsItems = [
    'NFL \nIndianaPolis Colt\nAnimation Packs 1.0',
    'NFL \nIndianaPolis Colt\nAnimation Packs 2.0',
    'NFL \nIndianaPolis Colt\nAnimation Packs 3.0',
    'NFL IndianaPolis Colt\nSeries 1.0',
    'NFL IndianaPolis Colt\nSeries 2.0',
    'NFL IndianaPolis Colt\nSeries 3.0',
  ];
  List<String> nflcowbItems = [
    'NFL \nDallas Cowboys\nAnimation Packs 1.0',
    'NFL \nDallas Cowboys\nAnimation Packs 2.0',
    'NFL \nDallas Cowboys\nAnimation Packs 3.0',
    'NFL Dallas Cowboys\nSeries 1.0',
    'NFL Dallas Cowboys\nSeries 2.0',
    'NFL Dallas Cowboys\nSeries 3.0',
  ];
  List<String> nfldlphItems = [
    'NFL \nMiami Dolphins\nAnimation Packs 1.0',
    'NFL \nMiami Dolphins\nAnimation Packs 2.0',
    'NFL \nMiami Dolphins\nAnimation Packs 3.0',
    'NFL Miami Dolphins Series 1.0',
    'NFL Miami Dolphins Series 2.0',
    'NFL Miami Dolphins Series 3.0',
  ];
  List<String> nfleglsItems = [
    'NFL \nPhiladelphia Eagles\nAnimation Packs 1.0',
    'NFL \nPhiladelphia Eagles\nAnimation Packs 2.0',
    'NFL \nPhiladelphia Eagles\nAnimation Packs 3.0',
    'NFL Philadelphia Eagles\nSeries 1.0',
    'NFL Philadelphia Eagles\nSeries 2.0',
    'NFL Philadelphia Eagles\nSeries 3.0',
  ];
  List<String> nflfalcItems = [
    'NFL \nAtlanta Falcons\nAnimation Packs 1.0',
    'NFL \nAtlanta Falcons\nAnimation Packs 2.0',
    'NFL \nAtlanta Falcons\nAnimation Packs 3.0',
    'NFL Atlanta Falcons\nSeries 1.0',
    'NFL Atlanta Falcons\nSeries 2.0',
    'NFL Atlanta Falcons\nSeries 3.0',
  ];
  List<String> nfljagsItems = [
    'NFL \nJacksonville Jaguars\nAnimation Packs 1.0',
    'NFL \nJacksonville Jaguars\nAnimation Packs 2.0',
    'NFL \nJacksonville Jaguars\nAnimation Packs 3.0',
    'NFL Jacksonville Jaguars\nSeries 1.0',
    'NFL Jacksonville Jaguars\nSeries 2.0',
    'NFL Jacksonville Jaguars\nSeries 3.0',
  ];
  List<String> nfllnsItems = [
    'NFL \nDetroit Lions\nAnimation Packs 1.0',
    'NFL \nDetroit Lions\nAnimation Packs 2.0',
    'NFL \nDetroit Lions\nAnimation Packs 3.0',
    'NFL Detroit Lions Series 1.0',
    'NFL Detroit Lions Series 2.0',
    'NFL Detroit Lions Series 3.0',
  ];
  List<String> nflnygItems = [
    'NFL \nNew York Giants\nAnimation Packs 1.0',
    'NFL \nNew York Giants\nAnimation Packs 2.0',
    'NFL \nNew York Giants\nAnimation Packs 3.0',
    'NFL New York Giants\nSeries 1.0',
    'NFL New York Giants\nSeries 2.0',
    'NFL New York Giants\nSeries 3.0',
  ];
  List<String> nflnyjItems = [
    'NFL \nNew York Jets\nAnimation Packs 1.0',
    'NFL \nNew York Jets\nAnimation Packs 2.0',
    'NFL \nNew York Jets\nAnimation Packs 3.0',
    'NFL New York Jets\nSeries 1.0',
    'NFL New York Jets\nSeries 2.0',
    'NFL New York Jets\nSeries 3.0',
  ];
  List<String> nflpaksItems = [
    'NFL \nGreen Bay Packers\nAnimation Packs 1.0',
    'NFL \nGreen Bay Packers\nAnimation Packs 2.0',
    'NFL \nGreen Bay Packers\nAnimation Packs 3.0',
    'NFL Green Bay Packers\nSeries 1.0',
    'NFL Green Bay Packers\nSeries 2.0',
    'NFL Green Bay Packers\nSeries 3.0',
  ];
  List<String> nflpatsItems = [
    'NFL \nNew England Patriots\nAnimation Packs 1.0',
    'NFL \nNew England Patriots\nAnimation Packs 2.0',
    'NFL \nNew England Patriots\nAnimation Packs 3.0',
    'NFL New England Patriots\nSeries 1.0',
    'NFL New England Patriots\nSeries 2.0',
    'NFL New England Patriots\nSeries 3.0',
  ];
  List<String> nflpnthItems = [
    'NFL \nCarolina Panthers\nAnimation Packs 1.0',
    'NFL \nCarolina Panthers\nAnimation Packs 2.0',
    'NFL \nCarolina Panthers\nAnimation Packs 3.0',
    'NFL Carolina Panthers\nSeries 1.0',
    'NFL Carolina Panthers\nSeries 1.0',
    'NFL Carolina Panthers\nSeries 1.0',
  ];

  List<String> nflraidItems = [
    'NFL \nLas Vegas Raiders\nAnimation Packs 1.0',
    'NFL \nLas Vegas Raiders\nAnimation Packs 2.0',
    'NFL \nLas Vegas Raiders\nAnimation Packs 3.0',
    'NFL Las Vegas Raiders\nSeries 1.0',
    'NFL Las Vegas Raiders\nSeries 2.0',
    'NFL Las Vegas Raiders\nSeries 3.0',
  ];
  List<String> nflrmsItems = [
    'NFL \nLos Angeles Rams\nAnimation Packs 1.0',
    'NFL \nLos Angeles Rams\nAnimation Packs 2.0',
    'NFL \nLos Angeles Rams\nAnimation Packs 3.0',
    'NFL Los Angeles Rams\nSeries 1.0',
    'NFL Los Angeles Rams\nSeries 2.0',
    'NFL Los Angeles Rams\nSeries 3.0',
  ];
  List<String> nflrvnsItems = [
    'NFL \nBaltimore Ravens\nAnimation Packs 1.0',
    'NFL \nBaltimore Ravens\nAnimation Packs 2.0',
    'NFL \nBaltimore Ravens\nAnimation Packs 3.0',
    'NFL Baltimore Ravens\nSeries 1.0',
    'NFL Baltimore Ravens\nSeries 2.0',
    'NFL Baltimore Ravens\nSeries 3.0',
  ];
  List<String> nflshksItems = [
    'NFL \nSeattle Seahawks\nAnimation Packs 1.0',
    'NFL \nSeattle Seahawks\nAnimation Packs 2.0',
    'NFL \nSeattle Seahawks\nAnimation Packs 3.0',
    'NFL Seattle Seahawks\nSeries 1.0',
    'NFL Seattle Seahawks\nSeries 2.0',
    'NFL Seattle Seahawks\nSeries 3.0',
  ];
  List<String> nflsntsItems = [
    'NFL \nNew Orleans Saints\nAnimation Packs 1.0',
    'NFL \nNew Orleans Saints\nAnimation Packs 2.0',
    'NFL \nNew Orleans Saints\nAnimation Packs 3.0',
    'NFL New Orleans Saints\nSeries 1.0',
    'NFL New Orleans Saints\nSeries 2.0',
    'NFL New Orleans Saints\nSeries 3.0',
  ];
  List<String> nflstlrItems = [
    'NFL \nPittsburgh Steelers\nAnimation Packs 1.0',
    'NFL \nPittsburgh Steelers\nAnimation Packs 2.0',
    'NFL \nPittsburgh Steelers\nAnimation Packs 3.0',
    'NFL Pittsburgh Steelers\nSeries 1.0',
    'NFL Pittsburgh Steelers\nSeries 2.0',
    'NFL Pittsburgh Steelers\nSeries 3.0',
  ];
  List<String> nfltexItems = [
    'NFL \nHouston Texans\nAnimation Packs 1.0',
    'NFL \nHouston Texans\nAnimation Packs 2.0',
    'NFL \nHouston Texans\nAnimation Packs 3.0',
    'NFL Houston Texans\nSeries 1.0',
    'NFL Houston Texans\nSeries 2.0',
    'NFL Houston Texans\nSeries 3.0',
  ];
  List<String> nflttnsItems = [
    'NFL \nTennessee Titans\nAnimation Packs 1.0',
    'NFL \nTennessee Titans\nAnimation Packs 2.0',
    'NFL \nTennessee Titans\nAnimation Packs 3.0',
    'NFL Tennessee Titans\nSeries 1.0',
    'NFL Tennessee Titans\nSeries 2.0',
    'NFL Tennessee Titans\nSeries 3.0',
  ];
  List<String> nflvksItems = [
    'NFL \nMinnesota Vikings\nAnimation Packs 1.0',
    'NFL \nMinnesota Vikings\nAnimation Packs 2.0',
    'NFL \nMinnesota Vikings\nAnimation Packs 3.0',
    'NFL Minnesota Vikings\nSeries 1.0',
    'NFL Minnesota Vikings\nSeries 2.0',
    'NFL Minnesota Vikings\nSeries 3.0',
  ];
  List<String> nflwashItems = [
    'NFL \nWashington Commanders\nAnimation Packs 1.0',
    'NFL \nWashington Commanders\nAnimation Packs 2.0',
    'NFL \nWashington Commanders\nAnimation Packs 3.0',
    'NFL Washington Commanders\nSeries 1.0',
    'NFL Washington Commanders\nSeries 2.0',
    'NFL Washington Commanders\nSeries 3.0',
  ];
  List<String> mlbItems = [
    'MLB \nLos Angeles Dodgers \nAnimation Packs 1.0',
    'MLB \nLos Angeles Dodgers \nAnimation Packs 2.0',
    'MLB \nLos Angeles Dodgers \nAnimation Packs 3.0',
    'MLB Los Angeles Dodgers \nSeries 1.0',
    'MLB Los Angeles Dodgers \nSeries 2.0',
    'MLB Los Angeles Dodgers \nSeries 3.0',
  ];
  List<String> ncaaItems = [
    'NCAA \nOhio Stete Buckeyes\nAnimation Packs 1.0',
    'NCAA \nOhio Stete Buckeyes\nAnimation Packs 2.0',
    'NCAA \nOhio Stete Buckeyes\nAnimation Packs 3.0',
    'NCAA Ohio Stete Buckeyes\nSeries 1.0',
    'NCAA Ohio Stete Buckeyes\nSeries 2.0',
    'NCAA Ohio Stete Buckeyes\nSeries 3.0',
  ];

  final list = [
    Category(
        // id: '1',
        video: '${API.dev}animation/Bills_1.gif',
        name: 'NFL',
        type: 'gif'),
    Category(
        // id: '2',
        video: '${API.dev}animation/KC.gif',
        name: 'MLB',
        type: 'gif'),
    Category(
        // id: '3',
        video: '${API.dev}animation/Eagles.gif',
        name: 'NCAA',
        type: 'gif'),
  ];
}
