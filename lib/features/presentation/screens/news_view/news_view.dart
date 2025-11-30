import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper_function/helper_functions.dart';

class NewsView extends StatefulWidget {
  final String blogUrl;

  const NewsView({super.key, required this.blogUrl});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  InAppWebViewController? webViewController;
  bool isLoading = true; // Controls shimmer visibility

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
      body: Stack(
        children: [
          /// WebView
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.blogUrl)),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() => isLoading = true);
            },
            onLoadStop: (controller, url) {
              setState(() => isLoading = false);
            },
            initialSettings: InAppWebViewSettings(
              javaScriptCanOpenWindowsAutomatically: true,
              javaScriptEnabled: true,
            ),
          ),

          /// Article-style Shimmer Loader
          if (isLoading)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(ZohSizes.md),
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.transparent,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(ZohSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Big Image Placeholder
                      Container(
                        height: ZohHelperFunction.screenHeight() * 0.35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: ZohSizes.md),

                      ///Title Placeholder
                      Container(
                        height: ZohHelperFunction.screenHeight() * .2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ZohSizes.spaceBtwZoh),
                          color: ZohColors.white,
                        ),
                      ),
                      const SizedBox(height: ZohSizes.sm),
                      Container(
                        height: ZohSizes.spaceBtwSections,
                        width: ZohHelperFunction.screenWidth() * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ZohSizes.spaceBtwZoh),
                          color: ZohColors.white,
                        ),
                      ),
                      const SizedBox(height: ZohSizes.sm),

                      ///Paragraph Placeholder
                      for (int i = 0; i < 6; i++) ...[
                        Container(
                          height: 14,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ZohSizes.spaceBtwZoh),
                            color: ZohColors.white,
                          ),
                        ),
                        SizedBox(height: ZohSizes.xs,)
                      ],

                      ///Author Info or Button Placeholder
                      const SizedBox(height: ZohSizes.md),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
