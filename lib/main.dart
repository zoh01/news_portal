import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/features/presentation/screens/home_screen/home_screen.dart';
import 'package:news_portal/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:news_portal/utils/themes/themes.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ZohAppTheme.lightTheme,
      darkTheme: ZohAppTheme.darkTheme,
      home: SplashScreen()
    );
  }
}
