import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:news_portal/features/data/data.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class NewsView extends StatefulWidget {
  NewsView({super.key, required this.blogUrl});

  String blogUrl;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {

  // /// Initialize WebView Controller
  // final controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.disabled)
  // ..loadRequest(Uri.parse(getCategories() as String));

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ZOH',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: ZohSizes.defaultSpace,
                fontWeight: FontWeight.bold,
                color: ZohColors.primaryColor,
              ),
            ),
            Text(
              'NEWS',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: ZohSizes.defaultSpace,
                fontWeight: FontWeight.bold,
                color: ZohColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.blogUrl)),
          onWebViewCreated: (controller){
            webViewController = controller;
          },
          initialSettings: InAppWebViewSettings(
            javaScriptCanOpenWindowsAutomatically: true,
            javaScriptEnabled: true,
          ),
        )
      )
    );
  }
}
