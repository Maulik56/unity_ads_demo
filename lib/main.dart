import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_demo/view/unity_ad_exapmle.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import 'ad_service/ad_services.dart';

void main() {
  runApp(const UnityAdsExampleApp());
}

class UnityAdsExampleApp extends StatelessWidget {
  const UnityAdsExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unity Ads Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Unity Ads Example'),
        ),
        body: const SafeArea(
          child: UnityAdsExample(),
        ),
      ),
    );
  }
}
