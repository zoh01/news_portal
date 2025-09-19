import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_function/helper_functions.dart';
import '../../news_view/news_view.dart';

class ExploreNewsContainer extends StatelessWidget {
  const ExploreNewsContainer({
    super.key,
    this.image,
    this.title,
    this.desc,
    this.url,
    this.loading = false, // new flag
  });

  final String? image, title, desc, url;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      /// Show shimmer skeleton when loading
      return _buildShimmer(context);
    } else {
      /// Show real news card when data is available
      return _buildNewsCard(context);
    }
  }

  /// 🔹 Real news content
  Widget _buildNewsCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsView(blogUrl: url!),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: ZohSizes.md,
          right: ZohSizes.md,
          top: ZohSizes.md,
        ),
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
                      image: NetworkImage(image ?? ""),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: ZohHelperFunction.screenHeight() * .3,
                    ),
                  ),
                  const SizedBox(height: ZohSizes.sm),
                  Text(
                    title ?? "No Title",
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
                    desc ?? "No Description",
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
    );
  }

  /// Shimmer skeleton layout
  Widget _buildShimmer(BuildContext context) {
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
          highlightColor: Colors.transparent,
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
                  /// Image placeholder
                  Container(
                    width: double.infinity,
                    height: ZohHelperFunction.screenHeight() * .3,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(ZohSizes.md),
                    ),
                  ),
                  const SizedBox(height: ZohSizes.sm),

                  /// Title placeholder
                  Container(
                    height: 16,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                  const SizedBox(height: 8),

                  /// Small line placeholder
                  Container(
                    height: 14,
                    width: ZohHelperFunction.screenWidth() * 0.6,
                    color: Colors.transparent,
                  ),
                  const SizedBox(height: 8),

                  /// Another line placeholder
                  Container(
                    height: 14,
                    width: ZohHelperFunction.screenWidth() * 0.4,
                    color: Colors.transparent,
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
