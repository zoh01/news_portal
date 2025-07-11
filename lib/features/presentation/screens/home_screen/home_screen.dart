import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_portal/features/data/data.dart';
import 'package:news_portal/features/data/news.dart';
import 'package:news_portal/features/data/slider_data.dart';
import 'package:news_portal/features/domain/models/article_models.dart';
import 'package:news_portal/features/domain/models/slider_model.dart';
import 'package:news_portal/features/presentation/screens/explore/widgets/explore_container.dart';
import 'package:news_portal/features/presentation/screens/home_screen/widgets/text.dart';
import 'package:news_portal/features/presentation/screens/news_view/news_view.dart';
import 'package:news_portal/features/presentation/screens/slider/widgets/slider_viewall.dart';
import 'package:news_portal/features/presentation/screens/trending_news/widgets/trending_viewall.dart';
import 'package:news_portal/utils/constants/sizes.dart';
import 'package:news_portal/utils/device_utils/device_utilities.dart';
import 'package:news_portal/utils/helper_function/helper_functions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../domain/models/category_models.dart';
import '../explore/widgets/explore_categories.dart';
import '../slider/widgets/slider_container.dart';
import '../trending_news/trending_news.dart';

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
  bool shimmer = true;
  bool carouselShimmer = true;
  bool trendingShimmer = true;
  int activeIndex = 0;

  @override
  void initState() {
    loadShimmer();
    loadCarousel();
    loadTrending();
    categories = getCategories();
    getNews();
    getSliders();
    super.initState();
  }

  loadShimmer() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      shimmer = false;
    });
  }

  loadCarousel() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      carouselShimmer = false;
    });
  }

  loadTrending() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      trendingShimmer = false;
    });
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
      appBar: AppBar(
        centerTitle: true,
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
              'ARTICLES',
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: ZohSizes.md, right: ZohSizes.md),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(title: 'Hottest News', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SliderViewAll()));
                }),
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String? resImage = sliders[index].newsImage;
                    String? resText = sliders[index].newsTitle;
                    return carouselShimmer
                        ? Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.transparent,
                          child: SliderContainer(
                            context: context,
                            sliders: sliders,
                            image: resImage!,
                            index: index,
                            name: resText!,
                          ),
                        )
                        : SliderContainer(
                          context: context,
                          sliders: sliders,
                          image: resImage!,
                          index: index,
                          name: resText!,
                        );
                  },
                  options: CarouselOptions(
                    height: ZohDeviceUtils.getScreenHeight() * .33,
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

                /// Explore Categories
                ExploreCategories(categories: categories, shimmer: shimmer),

                TextWidget(title: 'Trending News', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrendingViewAll()));
                }),

                /// Trending News
                TrendingNews(
                  trendingShimmer: trendingShimmer,
                  articles: articles,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
