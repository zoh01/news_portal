import 'package:flutter/material.dart';
import 'package:news_portal/utils/constants/image_strings.dart';
import 'package:news_portal/utils/constants/sizes.dart';
import 'package:news_portal/utils/device_utils/device_utilities.dart';
import 'package:news_portal/utils/helper_function/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5FAF9F9),
      body: Padding(
        padding: const EdgeInsets.all(ZohSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            SizedBox(height: ZohSizes.md),
            Text(
              'Hottest News',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: ZohSizes.md,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ZohSizes.sm),
            Container(
              height: ZohDeviceUtils.getScreenHeight() * .35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(ZohSizes.sm),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: ZohDeviceUtils.getScreenWidth(context) * .7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: AssetImage(ZohImages.technology),
                                  width: ZohHelperFunction.screenWidth() * .3,
                                  fit: BoxFit.cover,
                                  height: 140,
                                ),
                              ),
                              SizedBox(width: ZohSizes.sm),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get the latest news about Zoh',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ZohSizes.md,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    Text(
                                      'Zoh is a Flutter Mobile App Developer, He have experience building Mobile & Web Applications.',
                                      style: TextStyle(
                                        fontFamily: 'IBM_Plex_Sans',
                                        fontSize: ZohSizes.fontSizeSm,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 4,
                                    ),
                                    SizedBox(height: ZohSizes.xs),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ZohColors.primaryOpacity,
                                            side: BorderSide(
                                              color: ZohColors.primaryOpacity,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: ZohSizes.md,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(ZohSizes.sm),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: ZohDeviceUtils.getScreenWidth(context) * .7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: AssetImage(ZohImages.technology),
                                  width: ZohHelperFunction.screenWidth() * .3,
                                  fit: BoxFit.cover,
                                  height: 140,
                                ),
                              ),
                              SizedBox(width: ZohSizes.sm),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get the latest news about Zoh',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ZohSizes.md,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    Text(
                                      'Zoh is a Flutter Mobile App Developer, He have experience building Mobile & Web Applications.',
                                      style: TextStyle(
                                        fontFamily: 'IBM_Plex_Sans',
                                        fontSize: ZohSizes.fontSizeSm,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 4,
                                    ),
                                    SizedBox(height: ZohSizes.xs),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ZohColors.primaryOpacity,
                                            side: BorderSide(
                                              color: ZohColors.primaryOpacity,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: ZohSizes.md,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(ZohSizes.sm),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: ZohDeviceUtils.getScreenWidth(context) * .7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: AssetImage(ZohImages.technology),
                                  width: ZohHelperFunction.screenWidth() * .3,
                                  fit: BoxFit.cover,
                                  height: 140,
                                ),
                              ),
                              SizedBox(width: ZohSizes.sm),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get the latest news about Zoh',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ZohSizes.md,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    Text(
                                      'Zoh is a Flutter Mobile App Developer, He have experience building Mobile & Web Applications.',
                                      style: TextStyle(
                                        fontFamily: 'IBM_Plex_Sans',
                                        fontSize: ZohSizes.fontSizeSm,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 4,
                                    ),
                                    SizedBox(height: ZohSizes.xs,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            ZohColors.primaryOpacity,
                                            side: BorderSide(
                                              color: ZohColors.primaryOpacity,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: ZohSizes.md,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
