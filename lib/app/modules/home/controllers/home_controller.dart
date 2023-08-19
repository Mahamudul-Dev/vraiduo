import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/utils.dart';

class HomeController extends GetxController {
  WebViewController? webViewController;
  final webViewKey = UniqueKey();
  RxInt progress = 0.obs;

  void loadNewUrl(String url) {
    if (webViewController != null) {
      webViewController!.loadUrl(url);
    } else {
      Get.snackbar('Wait', 'App is not loaded completely');
    }
  }

  FutureOr<NavigationDecision> navigationDelegate(
      NavigationRequest? request) async {
    if (request != null) {
      if (request.url.contains('whatsapp') ||
          request.url.contains('instagram') ||
          request.url.contains('youtube') ||
          request.url.startsWith('mailto') ||
          request.url.contains('linkedin') ||
          request.url.contains('facebook')) {
        if (await canLaunchUrl(Uri.parse(request.url))) {
          await launchUrl(Uri.parse(request.url),
              mode: LaunchMode.externalNonBrowserApplication);
          webViewController!.loadUrl(URL);
          return NavigationDecision.prevent;
        }
      }
    }
    return NavigationDecision.navigate;
  }
}
