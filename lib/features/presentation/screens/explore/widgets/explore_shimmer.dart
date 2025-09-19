import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../utils/helper_function/helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';

class ExploreShimmer extends StatelessWidget {
  const ExploreShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(ZohSizes.sm),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(ZohSizes.md),
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(ZohSizes.md),
                      child: Image(
                        image: NetworkImage(""),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: ZohHelperFunction.screenHeight() * .3,
                      ),
                    ),
                    const SizedBox(height: ZohSizes.sm),
                    Text(
                      "No Title",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: ZohSizes.spaceBtwZoh,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: ZohSizes.xs),
                    Text(
                      "No Description",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: ZohSizes.md,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
