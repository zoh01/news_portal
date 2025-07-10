import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/helper_function/helper_functions.dart';
import '../../../../domain/models/category_models.dart';
import 'explore_container.dart';


class ExploreCategories extends StatelessWidget {
  const ExploreCategories({
    super.key,
    required this.categories,
    required this.shimmer,
  });

  final List<CategoryModel> categories;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ZohHelperFunction.screenHeight() * .135,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return shimmer
              ? Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.transparent,
            child: ExploreContainer(
              categoryImage: categories[index].categoryImage,
              categoryName: categories[index].categoryName,
            ),
          )
              : ExploreContainer(
            categoryImage: categories[index].categoryImage,
            categoryName: categories[index].categoryName,
          );
        },
      ),
    );
  }
}