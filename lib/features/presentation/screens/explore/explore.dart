import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/features/data/explore_news.dart';
import 'package:news_portal/features/domain/models/explore_models.dart';
import 'package:news_portal/features/presentation/screens/explore/widgets/explore_news_container.dart';
import 'package:news_portal/features/presentation/screens/explore/widgets/explore_shimmer.dart';
import 'package:news_portal/utils/constants/colors.dart';
import 'package:news_portal/utils/constants/sizes.dart';
import 'package:news_portal/utils/helper_function/helper_functions.dart';

class Explore extends StatefulWidget {
  final String name;

  const Explore({super.key, required this.name});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<ExploreModels> categories = [];
  bool loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    ExploreNews exploreClass = ExploreNews();
    await exploreClass.getCategories(widget.name.toLowerCase());
    categories = exploreClass.categories;
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
          backgroundColor: Colors.white30,
          title: Text(
            widget.name,
            style: const TextStyle(
              color: ZohColors.black,
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
            color: ZohColors.black,
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          width: double.infinity,
          child: loading
              ? ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const ExploreShimmer(),
          )
              : ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            padding: EdgeInsets.only(
                bottom: ZohSizes.defaultSpace),
            itemBuilder: (BuildContext context, int index) {
              return ExploreNewsContainer(
                image: categories[index].newsImage,
                title: categories[index].newsTitle,
                desc: categories[index].newsDesc,
                url: categories[index].newsUrl,
              );
            },
          ),
        ),
      ),
    );
  }
}
