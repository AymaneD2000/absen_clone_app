import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialisation;

  AdState(this.initialisation);

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  BannerAdListener get adListener => _adListenere;

  final BannerAdListener _adListenere = BannerAdListener(
    onAdLoaded: (ad) => print("Ad loaded : ${ad.adUnitId}"),
    onAdClosed: (ad) => print("Ad closed : ${ad.adUnitId}"),
    onAdFailedToLoad: (ad, error) =>
        print("Ad failed to load : ${ad.adUnitId}"),
    onAdOpened: (ad) => print("Ad opened : ${ad.adUnitId}"),
    onAdClicked: (ad) => print("Ad clicked : ${ad.adUnitId}"),
  );
}
