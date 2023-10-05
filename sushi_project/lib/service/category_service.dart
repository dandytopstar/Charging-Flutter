import '../models/category.dart';
import '../constant/api.dart';

class CategoryService {
  final list = [
    Category(video: '${API.dev}animation/test1.gif', name: 'NFL', type: 'gif'),
    Category(video: '${API.dev}animation/test2.gif', name: 'MLB', type: 'gif'),
    Category(video: '${API.dev}animation/test3.gif', name: 'NCAA', type: 'gif'),
    Category(video: '${API.dev}animation/test4.gif', name: 'NCAA', type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/San Francisco 49ers-GIF SOAR.gif',
        name: 'NFL_SanFrancisco',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/San Francisco 49ers-GIF SOAR.gif',
        name: 'NFL_SanFrancisco_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/San Francisco 49ers-GIF SOAR.gif',
        name: 'NFL_SanFrancisco_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/San Francisco 49ers-GIF SOAR.gif',
        name: 'NFL_SanFrancisco_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Chicago Bears-GIF SOAR.gif',
        name: 'NFL_Chicago',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Chicago Bears-GIF SOAR.gif',
        name: 'NFL_Chicago_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Chicago Bears-GIF SOAR.gif',
        name: 'NFL_Chicago_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Chicago Bears-GIF SOAR.gif',
        name: 'NFL_Chicago_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Cincinnati Bengals-GIF SOAR.gif',
        name: 'NFL_Cincinnati',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Cincinnati Bengals-GIF SOAR.gif',
        name: 'NFL_Cincinnati_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Cincinnati Bengals-GIF SOAR.gif',
        name: 'NFL_Cincinnati_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Cincinnati Bengals-GIF SOAR.gif',
        name: 'NFL_Cincinnati_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Buffalo Bills-GIF SOAR.gif',
        name: 'NFL_Buffalo',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Buffalo Bills-GIF SOAR.gif',
        name: 'NFL_Buffalo_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Buffalo Bills-GIF SOAR.gif',
        name: 'NFL_Buffalo_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Buffalo Bills-GIF SOAR.gif',
        name: 'NFL_Buffalo_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Denver Broncos-GIF SOAR.gif',
        name: 'NFL_BRCS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Denver Broncos-GIF SOAR.gif',
        name: 'NFL_BRCS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Denver Broncos-GIF SOAR.gif',
        name: 'NFL_BRCS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Denver Broncos-GIF SOAR.gif',
        name: 'NFL_BRCS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Cleveland Browns-GIF SOAR.gif',
        name: 'NFL_BRNS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Cleveland Browns-GIF SOAR.gif',
        name: 'NFL_BRNS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Cleveland Browns-GIF SOAR.gif',
        name: 'NFL_BRNS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Cleveland Browns-GIF SOAR.gif',
        name: 'NFL_BRNS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Tampa Bay Buccaneers-GIF SOAR.gif',
        name: 'NFL_BUCN',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Tampa Bay Buccaneers-GIF SOAR.gif',
        name: 'NFL_BUCN_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Tampa Bay Buccaneers-GIF SOAR.gif',
        name: 'NFL_BUCN_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Tampa Bay Buccaneers-GIF SOAR.gif',
        name: 'NFL_BUCN_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Arizona Cardinals-GIF SOAR.gif',
        name: 'NFL_CARD',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Arizona Cardinals-GIF SOAR.gif',
        name: 'NFL_CARD_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Arizona Cardinals-GIF SOAR.gif',
        name: 'NFL_CARD_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Arizona Cardinals-GIF SOAR.gif',
        name: 'NFL_CARD_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Kansas City Chiefs-GIF SOAR.gif',
        name: 'NFL_CHFS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Kansas City Chiefs-GIF SOAR.gif',
        name: 'NFL_CHFS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Kansas City Chiefs-GIF SOAR.gif',
        name: 'NFL_CHFS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Kansas City Chiefs-GIF SOAR.gif',
        name: 'NFL_CHFS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Los Angeles Chargers-GIF SOAR.gif',
        name: 'NFL_CHRG',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Los Angeles Chargers-GIF SOAR.gif',
        name: 'NFL_CHRG_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Los Angeles Chargers-GIF SOAR.gif',
        name: 'NFL_CHRG_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Los Angeles Chargers-GIF SOAR.gif',
        name: 'NFL_CHRG_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Indianapolis Colts-GIF SOAR.gif',
        name: 'NFL_CLTS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Indianapolis Colts-GIF SOAR.gif',
        name: 'NFL_CLTS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Indianapolis Colts-GIF SOAR.gif',
        name: 'NFL_CLTS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Indianapolis Colts-GIF SOAR.gif',
        name: 'NFL_CLTS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Dallas Cowboys-GIF SOAR.gif',
        name: 'NFL_COWB',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Dallas Cowboys-GIF SOAR.gif',
        name: 'NFL_COWB_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Dallas Cowboys-GIF SOAR.gif',
        name: 'NFL_COWB_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Dallas Cowboys-GIF SOAR.gif',
        name: 'NFL_COWB_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Miami Dolphins-GIF SOAR.gif',
        name: 'NFL_DLPH',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Miami Dolphins-GIF SOAR.gif',
        name: 'NFL_DLPH_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Miami Dolphins-GIF SOAR.gif',
        name: 'NFL_DLPH_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Miami Dolphins-GIF SOAR.gif',
        name: 'NFL_DLPH_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Philadelphia Eagles-GIF SOAR.gif',
        name: 'NFL_EGLS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Philadelphia Eagles-GIF SOAR.gif',
        name: 'NFL_EGLS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Philadelphia Eagles-GIF SOAR.gif',
        name: 'NFL_EGLS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Philadelphia Eagles-GIF SOAR.gif',
        name: 'NFL_EGLS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Atlanta Falcons-GIF SOAR.gif',
        name: 'NFL_FALC',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Atlanta Falcons-GIF SOAR.gif',
        name: 'NFL_FALC_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Atlanta Falcons-GIF SOAR.gif',
        name: 'NFL_FALC_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Atlanta Falcons-GIF SOAR.gif',
        name: 'NFL_FALC_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Jacksonville Jaguars-GIF SOAR.gif',
        name: 'NFL_JAGS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Jacksonville Jaguars-GIF SOAR.gif',
        name: 'NFL_JAGS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Jacksonville Jaguars-GIF SOAR.gif',
        name: 'NFL_JAGS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Jacksonville Jaguars-GIF SOAR.gif',
        name: 'NFL_JAGS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Detroit Lions-GIF SOAR.gif',
        name: 'NFL_LNS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Detroit Lions-GIF SOAR.gif',
        name: 'NFL_LNS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Detroit Lions-GIF SOAR.gif',
        name: 'NFL_LNS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Detroit Lions-GIF SOAR.gif',
        name: 'NFL_LNS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/New York Giants-GIF SOAR.gif',
        name: 'NFL_NYG',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/New York Giants-GIF SOAR.gif',
        name: 'NFL_NYG_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/New York Giants-GIF SOAR.gif',
        name: 'NFL_NYG_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/New York Giants-GIF SOAR.gif',
        name: 'NFL_NYG_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/New York Jets-GIF SOAR.gif',
        name: 'NFL_NYJ',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/New York Jets-GIF SOAR.gif',
        name: 'NFL_NYJ_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/New York Jets-GIF SOAR.gif',
        name: 'NFL_NYJ_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/New York Jets-GIF SOAR.gif',
        name: 'NFL_NYJ_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Green Bay Packers-GIF SOAR.gif',
        name: 'NFL_PAKS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Green Bay Packers-GIF SOAR.gif',
        name: 'NFL_PAKS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Green Bay Packers-GIF SOAR.gif',
        name: 'NFL_PAKS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Green Bay Packers-GIF SOAR.gif',
        name: 'NFL_PAKS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/New England Patriots-GIF SOAR.gif',
        name: 'NFL_PATS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/New England Patriots-GIF SOAR.gif',
        name: 'NFL_PATS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/New England Patriots-GIF SOAR.gif',
        name: 'NFL_PATS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/New England Patriots-GIF SOAR.gif',
        name: 'NFL_PATS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Carolina Panthers-GIF SOAR.gif',
        name: 'NFL_PNTH',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Carolina Panthers-GIF SOAR.gif',
        name: 'NFL_PNTH_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Carolina Panthers-GIF SOAR.gif',
        name: 'NFL_PNTH_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Carolina Panthers-GIF SOAR.gif',
        name: 'NFL_PNTH_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Las Vegas Raiders-GIF SOAR.gif',
        name: 'NFL_RAID',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Las Vegas Raiders-GIF SOAR.gif',
        name: 'NFL_RAID_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Las Vegas Raiders-GIF SOAR.gif',
        name: 'NFL_RAID_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Las Vegas Raiders-GIF SOAR.gif',
        name: 'NFL_RAID_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Los Angeles Rams-GIF SOAR.gif',
        name: 'NFL_RMS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Los Angeles Rams-GIF SOAR.gif',
        name: 'NFL_RMS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Los Angeles Rams-GIF SOAR.gif',
        name: 'NFL_RMS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Los Angeles Rams-GIF SOAR.gif',
        name: 'NFL_RMS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Baltimore Ravens-GIF SOAR.gif',
        name: 'NFL_RVNS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Baltimore Ravens-GIF SOAR.gif',
        name: 'NFL_RVNS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Baltimore Ravens-GIF SOAR.gif',
        name: 'NFL_RVNS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Baltimore Ravens-GIF SOAR.gif',
        name: 'NFL_RVNS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Seattle Seahawks-GIF SOAR.gif',
        name: 'NFL_SHKS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Seattle Seahawks-GIF SOAR.gif',
        name: 'NFL_SHKS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Seattle Seahawks-GIF SOAR.gif',
        name: 'NFL_SHKS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Seattle Seahawks-GIF SOAR.gif',
        name: 'NFL_SHKS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/New Orleans Saints-GIF SOAR.gif',
        name: 'NFL_SNTS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/New Orleans Saints-GIF SOAR.gif',
        name: 'NFL_SNTS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/New Orleans Saints-GIF SOAR.gif',
        name: 'NFL_SNTS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/New Orleans Saints-GIF SOAR.gif',
        name: 'NFL_SNTS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Pittsburgh Steelers-GIF SOAR.gif',
        name: 'NFL_STLR',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Pittsburgh Steelers-GIF SOAR.gif',
        name: 'NFL_STLR_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Pittsburgh Steelers-GIF SOAR.gif',
        name: 'NFL_STLR_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Pittsburgh Steelers-GIF SOAR.gif',
        name: 'NFL_STLR_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Houston Texans-GIF SOAR.gif',
        name: 'NFL_TEX',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Houston Texans-GIF SOAR.gif',
        name: 'NFL_TEX_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Houston Texans-GIF SOAR.gif',
        name: 'NFL_TEX_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Houston Texans-GIF SOAR.gif',
        name: 'NFL_TEX_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Tennessee Titans-GIF SOAR.gif',
        name: 'NFL_TTNS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Tennessee Titans-GIF SOAR.gif',
        name: 'NFL_TTNS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Tennessee Titans-GIF SOAR.gif',
        name: 'NFL_TTNS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Tennessee Titans-GIF SOAR.gif',
        name: 'NFL_TTNS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Minnesota Vikings-GIF SOAR.gif',
        name: 'NFL_VKS',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Minnesota Vikings-GIF SOAR.gif',
        name: 'NFL_VKS_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Minnesota Vikings-GIF SOAR.gif',
        name: 'NFL_VKS_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Minnesota Vikings-GIF SOAR.gif',
        name: 'NFL_VKS_4',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/1x/Washington Commanders-GIF SOAR.gif',
        name: 'NFL_WASH',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/2x/Washington Commanders-GIF SOAR.gif',
        name: 'NFL_WASH_2',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/3x/Washington Commanders-GIF SOAR.gif',
        name: 'NFL_WASH_3',
        type: 'gif'),
    Category(
        video: '${API.dev}animation/4x/Washington Commanders-GIF SOAR.gif',
        name: 'NFL_WASH_4',
        type: 'gif'),
  ];
  int getIndexForName(String name) {
    return list.indexWhere((category) => category.name == name);
  }
}
