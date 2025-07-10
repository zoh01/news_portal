import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device_utils/device_utilities.dart';
import '../../../../../utils/helper_function/helper_functions.dart';
import '../../../../domain/models/slider_model.dart';
import '../../news_view/news_view.dart';


class SliderContainer extends StatelessWidget {
  const SliderContainer({
    super.key,
    required this.context,
    required this.sliders,
    required this.image,
    required this.index,
    required this.name,
  });

  final BuildContext context;
  final List<SliderModel> sliders;
  final String image;
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsView(blogUrl: sliders[index].newsUrl!),
        ),
      );
    },
    child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ZohSizes.md),
                child: Image(
                  image: NetworkImage(sliders[index].newsImage!),
                  fit: BoxFit.cover,
                  width: ZohDeviceUtils.getScreenWidth(context) * .8,
                  height: ZohHelperFunction.screenHeight() * .17,
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
    ),
  );
}