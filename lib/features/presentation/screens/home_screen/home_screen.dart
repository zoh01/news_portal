import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_portal/features/data/data.dart';
import 'package:news_portal/features/data/news.dart';
import 'package:news_portal/features/data/slider_data.dart';
import 'package:news_portal/features/domain/models/article_models.dart';
import 'package:news_portal/features/domain/models/slider_model.dart';
import 'package:news_portal/features/presentation/screens/home_screen/widgets/text.dart';
import 'package:news_portal/features/presentation/screens/slider/widgets/slider_viewall.dart';
import 'package:news_portal/features/presentation/screens/trending_news/widgets/trending_viewall.dart';
import 'package:news_portal/utils/constants/sizes.dart';
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

  bool shimmer = true;
  bool carouselShimmer = true;
  bool trendingShimmer = true;
  bool newsLoading = true;
  bool sliderLoading = true;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
    getSliders();
    loadShimmer();
  }

  loadShimmer() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      shimmer = false;
    });
  }

  getNews() async {
    try {
      News newsClass = News();
      await newsClass.getNews();
      setState(() {
        articles = newsClass.news;
        newsLoading = false;
      });
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
  }

  getSliders() async {
    try {
      SliderData sliderClass = SliderData();
      await sliderClass.getSliders();
      setState(() {
        sliders = sliderClass.sliders;
        sliderLoading = false;
      });
    } catch (e) {
      debugPrint("Error fetching sliders: $e");
    }
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
      backgroundColor: dark ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await getNews();
              await getSliders();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔥 HOTTEST NEWS
                  TextWidget(
                    title: 'Hottest News',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SliderViewAll()),
                      );
                    },
                  ),

                  /// 📰 SLIDER
                  if (sliderLoading)
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                    )
                  else if (sliders.isNotEmpty)
                    CarouselSlider.builder(
                      itemCount: min(sliders.length, 5),
                      itemBuilder: (context, index, realIndex) {
                        final resImage = sliders[index].newsImage ?? '';
                        final resText  = sliders[index].newsTitle ?? 'Untitled';
                        return SliderContainer(
                          context: context,
                          sliders: sliders,
                          image: resImage,
                          index: index,
                          name: resText,
                        );
                      },
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.3,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() => activeIndex = index);
                        },
                      ),
                    ),

                  const SizedBox(height: ZohSizes.sm),

                  /// 📍 INDICATOR
                  if (sliders.isNotEmpty)
                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: sliders.length > 5 ? 5 : sliders.length,
                        effect: SlideEffect(
                          activeDotColor: ZohColors.primaryColor,
                          dotWidth: ZohSizes.spaceBtwZoh,
                          dotHeight: ZohSizes.sm,
                        ),
                      ),
                    ),

                  const SizedBox(height: ZohSizes.md),

                  /// 🔎 EXPLORE
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: ZohSizes.spaceBtwZoh,
                      fontWeight: FontWeight.bold,
                      color: dark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: ZohSizes.sm),

                  ExploreCategories(categories: categories, shimmer: shimmer),

                  /// 📢 TRENDING NEWS
                  TextWidget(
                    title: 'Trending News',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TrendingViewAll()),
                      );
                    },
                  ),

                  TrendingNews(
                    trendingShimmer: newsLoading,
                    articles: articles,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
