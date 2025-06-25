import 'package:flutter/material.dart';
import 'package:news_portal/features/presentation/screens/explore/explore.dart';
import 'package:news_portal/utils/device_utils/device_utilities.dart';

import '../../../../../utils/constants/sizes.dart';

class ExploreContainer extends StatelessWidget {
  final categoryImage, categoryName;

  const ExploreContainer({super.key, this.categoryImage, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Explore(name: categoryName)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: ZohSizes.sm),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ZohSizes.md),
              child: Image(
                image: AssetImage(categoryImage),
                height: 70,
                width: ZohDeviceUtils.getScreenWidth(context) * .2,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              categoryName,
              style: TextStyle(fontSize: ZohSizes.md, fontFamily: 'Inter'),
            ),
          ],
        ),
      ),
    );
  }
}
