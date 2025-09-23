import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_portal/features/presentation/screens/home_screen/home_screen.dart';
import 'package:news_portal/utils/constants/colors.dart';
import 'package:news_portal/utils/constants/image_strings.dart';
import 'package:news_portal/utils/constants/sizes.dart';
import 'package:news_portal/utils/constants/text_strings.dart';
import 'package:news_portal/utils/helper_function/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8)).then((zoh) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (zoh) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ZohSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceIn(
              duration: Duration(milliseconds: 5000),
              child: Image(
                image: AssetImage(ZohImages.reportNews),
                height: ZohHelperFunction.screenHeight() * .4,
                alignment: Alignment.center,
              ),
            ),

            SizedBox(height: ZohSizes.spaceBtwSections),

            SlideInRight(
              duration: Duration(milliseconds: 3000),
              child: SizedBox(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: ZohColors.darkColor,
                    fontSize: ZohSizes.spaceBtwZoh,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(ZohTextString.splashText),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
