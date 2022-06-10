import 'package:flutter/material.dart';
import 'package:unity_ads_demo/ad_service/ad_services.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UnityAdsExample extends StatefulWidget {
  const UnityAdsExample({Key? key}) : super(key: key);

  @override
  _UnityAdsExampleState createState() => _UnityAdsExampleState();
}

class _UnityAdsExampleState extends State<UnityAdsExample> {
  bool _showBanner = false;

  @override
  void initState() {
    super.initState();

    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () => print('Initialization Complete'),
      onFailed: (error, message) =>
          print('Initialization Failed: $error $message'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showBanner = !_showBanner;
                  });
                },
                child: Text(_showBanner ? 'Hide Banner' : 'Show Banner'),
              ),
              VideoAdButton(
                placementId: AdManager.rewardedVideoAdPlacementId,
                title: 'Show Rewarded Video',
              ),
              VideoAdButton(
                placementId: AdManager.interstitialVideoAdPlacementId,
                title: 'Show Interstitial Video',
              ),
            ],
          ),
          if (_showBanner)
            UnityBannerAd(
              placementId: AdManager.bannerAdPlacementId,
              onLoad: (placementId) => print('Banner loaded: $placementId'),
              onClick: (placementId) => print('Banner clicked: $placementId'),
              onFailed: (placementId, error, message) =>
                  print('Banner Ad $placementId failed: $error $message'),
            ),
        ],
      ),
    );
  }
}

class VideoAdButton extends StatefulWidget {
  const VideoAdButton(
      {Key? key, required this.placementId, required this.title})
      : super(key: key);

  final String placementId;
  final String title;

  @override
  _VideoAdButtonState createState() => _VideoAdButtonState();
}

class _VideoAdButtonState extends State<VideoAdButton> {
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    UnityAds.load(
      placementId: widget.placementId,
      onComplete: (placementId) {
        print('Load Complete $placementId');
        setState(() {
          _loaded = true;
        });
      },
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _loaded
          ? () {
              UnityAds.showVideoAd(
                placementId: widget.placementId,
                onComplete: (placementId) =>
                    print('Video Ad $placementId completed'),
                onFailed: (placementId, error, message) =>
                    print('Video Ad $placementId failed: $error $message'),
                onStart: (placementId) =>
                    print('Video Ad $placementId started'),
                onClick: (placementId) => print('Video Ad $placementId click'),
                onSkipped: (placementId) =>
                    print('Video Ad $placementId skipped'),
              );
            }
          : null,
      child: Text(widget.title),
    );
  }
}
