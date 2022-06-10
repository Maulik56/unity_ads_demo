import 'package:flutter/foundation.dart';

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '4644611';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return '4644610';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'Banner_Android';
  }

  static String get interstitialVideoAdPlacementId {
    return 'Interstitial_Android';
  }

  static String get rewardedVideoAdPlacementId {
    return 'Rewarded_Android';
  }
}
