import 'package:flutter/material.dart';
import 'package:news_portal/features/data/explore_news.dart';
import 'package:news_portal/features/domain/models/explore_models.dart';
import 'package:news_portal/features/presentation/screens/news_view/news_view.dart';
import 'package:news_portal/utils/constants/colors.dart';
import 'package:news_portal/utils/constants/image_strings.dart';
import 'package:news_portal/utils/constants/sizes.dart';
import 'package:news_portal/utils/device_utils/device_utilities.dart';
import 'package:news_portal/utils/helper_function/helper_functions.dart';
import 'package:get/get.dart';

class Explore extends StatefulWidget {
  String name;

  Explore({super.key, required this.name});

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
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: ZohColors.primaryColor,
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(ZohSizes.md),
            topLeft: Radius.circular(ZohSizes.md),
          ),
          color: Color(0xE0FAF7F6),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: ZohSizes.md,
              right: ZohSizes.md,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: ZohHelperFunction.screenHeight(),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: categories.length,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExploreNewsContainer extends StatelessWidget {
  const ExploreNewsContainer({
    super.key,
    this.image,
    this.title,
    this.desc,
    this.url,
  });

  final image, title, desc, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsView(blogUrl: url,)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: ZohSizes.md),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(ZohSizes.md),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ZohSizes.md),
            ),
            child: Padding(
              padding: const EdgeInsets.all(ZohSizes.md),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZohSizes.md),
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: ZohHelperFunction.screenHeight() * .3,
                    ),
                  ),
                  SizedBox(height: ZohSizes.sm),
                  Text(
                    title,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: ZohSizes.spaceBtwZoh,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: ZohSizes.xs),
                  Text(
                    desc,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: ZohSizes.md,
                      color: Colors.black
                    ),
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
