import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.webViewController != null) {
          if (await controller.webViewController!.canGoBack()) {
            controller.webViewController!.goBack();
            return false;
          }
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: WebView(
                    initialUrl: URL,
                    key: controller.webViewKey,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (webController) {
                      controller.webViewController = webController;
                    },
                    navigationDelegate: controller.navigationDelegate),
              ),
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColor.ACCENT_COLOR,
        //   onPressed: () {
        //     controller.loadNewUrl(URL);
        //   },
        //   child: const Icon(
        //     CupertinoIcons.home,
        //     color: Colors.white,
        //   ),
        // ),
      ),
    );
  }
}
