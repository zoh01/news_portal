import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/features/domain/models/article_models.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_function/helper_functions.dart';
import '../../../../data/news.dart';
import '../../explore/widgets/explore_news_container.dart';

class TrendingViewAll extends StatefulWidget {
  const TrendingViewAll({super.key});

  @override
  State<TrendingViewAll> createState() => _TrendingViewAllState();
}

class _TrendingViewAllState extends State<TrendingViewAll> {
  List<ArticleModels> articles = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ZohColors.primaryColor,
          title: const Text(
            "Trending News",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.spaceBtwZoh,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(ZohSizes.md),
              topLeft: Radius.circular(ZohSizes.md),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ZohHelperFunction.screenHeight(),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                      bottom: ZohSizes.spaceBtwSections * 3.2,
                    ),
                    // If still loading → show 5 shimmer placeholders
                    itemCount: loading ? 5 : articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (loading) {
                        return const ExploreNewsContainer(
                          loading: true, // shimmer placeholder
                        );
                      } else {
                        return ExploreNewsContainer(
                          image: articles[index].newsImage,
                          title: articles[index].newsTitle,
                          desc: articles[index].newsDesc,
                          url: articles[index].newsUrl,
                          loading: false, // real content
                        );
                      }
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
}
