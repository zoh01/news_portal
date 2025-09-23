import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:news_portal/features/data/slider_data.dart';
import 'package:news_portal/features/domain/models/slider_model.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_function/helper_functions.dart';
import '../../explore/widgets/explore_news_container.dart';

class SliderViewAll extends StatefulWidget {
  const SliderViewAll({super.key});

  @override
  State<SliderViewAll> createState() => _SliderViewAllState();
}

class _SliderViewAllState extends State<SliderViewAll> {
  List<SliderModel> slider = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getSlider();
  }

  getSlider() async {
    SliderData sliderClass = SliderData();
    await sliderClass.getSliders();
    slider = sliderClass.sliders;
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
          title: Text(
            "Hottest News",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.spaceBtwZoh,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
        ),
        body: loading
            ? _buildShimmerList(context)
            : ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: slider.length,
          padding: EdgeInsets.only(
            bottom: ZohSizes.spaceBtwSections * 3.2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ExploreNewsContainer(
              image: slider[index].newsImage,
              title: slider[index].newsTitle,
              desc: slider[index].newsDesc,
              url: slider[index].newsUrl,
            );
          },
        ),
      ),
    );
  }

  /// Shimmer Skeleton that mimics ExploreNewsContainer
  Widget _buildShimmerList(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: 6, // Number of shimmer placeholders
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(
            left: ZohSizes.md,
            right: ZohSizes.md,
            top: ZohSizes.md,
          ),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(ZohSizes.md),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey.shade500,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ZohSizes.md),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(ZohSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image placeholder
                      ClipRRect(
                        borderRadius: BorderRadius.circular(ZohSizes.md),
                        child: Container(
                          width: double.infinity,
                          height: ZohHelperFunction.screenHeight() * .3,
                          color: Colors.transparent,
                        ),
                      ),
                      const SizedBox(height: ZohSizes.sm),

                      // Title placeholder
                      Container(
                        height: 18,
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                      const SizedBox(height: ZohSizes.xs),

                      // Description placeholders
                      Container(
                        height: 14,
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 14,
                        width: ZohHelperFunction.screenWidth() * 0.7,
                        color: Colors.transparent,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 14,
                        width: ZohHelperFunction.screenWidth() * 0.5,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
