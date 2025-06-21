import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
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
    Future.delayed(Duration(seconds: 5)).then((zoh) {
      Navigator.of(
        context,
      ).pushReplacement(CupertinoPageRoute(builder: (ctx) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ZohImages.splashImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: ZohColors.darkColor.withOpacity(0.7)),
          DelayedDisplay(
            delay: Duration(milliseconds: 2000),
            fadingDuration: const Duration(milliseconds: 2000),
            slidingCurve: Curves.easeIn,
            slidingBeginOffset: Offset.fromDirection(-.8, 1.2),
            child: Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Image(
                  image: AssetImage(ZohImages.reportNews),
                  height: ZohHelperFunction.screenHeight() * .4,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: ZohSizes.spaceBtwSections,
            child: SizedBox(
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ZohColors.white,
                  fontFamily: 'Poppins',
                  fontSize: ZohSizes.md,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      textAlign: TextAlign.center,
                      ZohTextString.splashText,
                      speed: Durations.short1,
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
