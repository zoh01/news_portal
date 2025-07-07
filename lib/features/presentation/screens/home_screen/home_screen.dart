import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_portal/features/data/data.dart';
import 'package:news_portal/features/data/news.dart';
import 'package:news_portal/features/data/slider_data.dart';
import 'package:news_portal/features/domain/models/article_models.dart';
import 'package:news_portal/features/domain/models/slider_model.dart';
import 'package:news_portal/features/presentation/screens/home_screen/widgets/explore_container.dart';
import 'package:news_portal/features/presentation/screens/news_view/news_view.dart';
import 'package:news_portal/utils/constants/sizes.dart';
import 'package:news_portal/utils/device_utils/device_utilities.dart';
import 'package:news_portal/utils/helper_function/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../domain/models/category_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModels> articles = [];
  List<SliderModel> sliders = [];
  bool loading = true;
  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getNews();
    getSliders();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  getSliders() async {
    SliderData sliderClass = SliderData();
    await sliderClass.getSliders();
    sliders = sliderClass.sliders;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: ZohSizes.md, right: ZohSizes.md),
        child: SafeArea(
          child: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hottest News',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: ZohSizes.spaceBtwZoh,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: ZohColors.primaryColor,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String? resImage = sliders[index].newsImage;
                    String? resText = sliders[index].newsTitle;
                    return buildSlider(resImage!, index, resText!);
                  },
                  options: CarouselOptions(
                    height: ZohDeviceUtils.getScreenHeight() * .40,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),

                SizedBox(height: ZohSizes.sm),

                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: 5,
                    effect: SlideEffect(
                      activeDotColor: ZohColors.primaryColor,
                      dotWidth: ZohSizes.spaceBtwZoh,
                      dotHeight: ZohSizes.sm,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: ZohDeviceUtils.getScreenHeight() * .28,
                //   child: ListView.builder(
                //     itemCount: articles.length,
                //     physics: ClampingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         margin: EdgeInsets.all(ZohSizes.sm),
                //         child: Material(
                //           elevation: 5,
                //           borderRadius: BorderRadius.circular(15),
                //           child: Container(
                //             width: ZohDeviceUtils.getScreenWidth(context) * .85,
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.circular(15),
                //                     child: Image(
                //                       image: NetworkImage(articles[index].newsImage!),
                //                       width: ZohHelperFunction.screenWidth() * .4,
                //                       fit: BoxFit.cover,
                //                       height: 175,
                //                     ),
                //                   ),
                //                   SizedBox(width: ZohSizes.sm),
                //                   Flexible(
                //                     child: Column(
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           articles[index].newsTitle!,
                //                           style: TextStyle(
                //                             fontFamily: 'Roboto',
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: ZohSizes.md,
                //                             color: Colors.black
                //                           ),
                //                           overflow: TextOverflow.ellipsis,
                //                           maxLines: 2,
                //                           softWrap: true,
                //                         ),
                //                         Text(
                //                           articles[index].newsDesc!,
                //                           style: TextStyle(
                //                             fontFamily: 'IBM_Plex_Sans',
                //                             fontSize: ZohSizes.fontSizeSm,
                //                             color: Colors.black
                //                           ),
                //                           overflow: TextOverflow.ellipsis,
                //                           softWrap: true,
                //                           maxLines: 4,
                //                         ),
                //                         SizedBox(height: ZohSizes.xs),
                //                         Row(
                //                           mainAxisAlignment: MainAxisAlignment.end,
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               style: ElevatedButton.styleFrom(
                //                                 backgroundColor:
                //                                 ZohColors.primaryOpacity,
                //                                 side: BorderSide(
                //                                   color: ZohColors.primaryOpacity,
                //                                 ),
                //                               ),
                //                               child: Icon(
                //                                 Icons.arrow_forward_ios,
                //                                 color: Colors.white,
                //                                 size: ZohSizes.md,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                SizedBox(height: ZohSizes.md),
                Text(
                  'Explore',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: ZohSizes.spaceBtwZoh,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: ZohSizes.sm),
                SizedBox(
                  height: ZohHelperFunction.screenHeight() * .15,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ExploreContainer(
                        categoryImage: categories[index].categoryImage,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),
                Text(
                  'Trending News',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: ZohSizes.spaceBtwZoh,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: ZohHelperFunction.screenHeight() * .55,
                  child: ListView.builder(
                    itemCount: articles.length,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(ZohSizes.sm),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: ZohDeviceUtils.getScreenWidth(context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image(
                                      image: NetworkImage(
                                        articles[index].newsImage!,
                                      ),
                                      width:
                                          ZohHelperFunction.screenWidth() * .4,
                                      fit: BoxFit.cover,
                                      height: 175,
                                    ),
                                  ),
                                  SizedBox(width: ZohSizes.sm),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          articles[index].newsTitle!,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            fontSize: ZohSizes.md,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                        Text(
                                          articles[index].newsDesc!,
                                          style: TextStyle(
                                            fontFamily: 'IBM_Plex_Sans',
                                            fontSize: ZohSizes.fontSizeSm,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 4,
                                        ),
                                        SizedBox(height: ZohSizes.xs),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) => NewsView(
                                                          blogUrl:
                                                              articles[index]
                                                                  .newsUrl!,
                                                        ),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ZohColors.primaryOpacity,
                                                side: BorderSide(
                                                  color:
                                                      ZohColors.primaryOpacity,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSlider(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(
      horizontal: ZohSizes.sm,
      vertical: ZohSizes.sm,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(ZohSizes.md),
    ),
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(ZohSizes.md),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ZohSizes.md),
              child: Image(
                image: NetworkImage(sliders[index].newsImage!),
                fit: BoxFit.cover,
                width: ZohDeviceUtils.getScreenWidth(context) * .8,
                height: ZohHelperFunction.screenHeight() * .19,
              ),
            ),
            SizedBox(height: ZohSizes.sm),
            Text(
              sliders[index].newsTitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: ZohSizes.md,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
          ],
        ),
      ),
    ),
  );
}
