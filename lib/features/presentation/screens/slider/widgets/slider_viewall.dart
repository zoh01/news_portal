import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    getSlider();
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ZohColors.primaryColor,
        title: Text(
          "Hottest News",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.spaceBtwZoh
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
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ZohHelperFunction.screenHeight(),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: slider.length,
                  padding: EdgeInsets.only(bottom: ZohSizes.spaceBtwSections*3.2),
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
            ],
          ),
        ),
      ),
    );
  }
}
