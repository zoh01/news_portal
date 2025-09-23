import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device_utils/device_utilities.dart';
import '../../../../utils/helper_function/helper_functions.dart';
import '../../../domain/models/article_models.dart';
import '../news_view/news_view.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({
    super.key,
    required this.trendingShimmer,
    required this.articles,
  });

  final bool trendingShimmer;
  final List<ArticleModels> articles;

  @override
  Widget build(BuildContext context) {
    return trendingShimmer
        ? _buildShimmerList(context)
        : _buildNewsList(context);
  }

  /// Shimmer Skeleton Layout
  Widget _buildShimmerList(BuildContext context) {
    final shimmerCount = articles.isEmpty
        ? 10
        : (articles.length > 10 ? 10 : articles.length);

    return ListView.builder(
      itemCount: shimmerCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(ZohSizes.sm),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(15),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔘 Image placeholder
                    Container(
                      width: ZohHelperFunction.screenWidth() * .4,
                      height: ZohHelperFunction.screenHeight() * .20,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(width: ZohSizes.sm),

                    // Text placeholders
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 16,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 16,
                            width: ZohHelperFunction.screenWidth() * 0.3,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 14,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 14,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 14,
                            width: ZohHelperFunction.screenWidth() * 0.4,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: ZohSizes.sm),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 🔹 Actual News Layout
  Widget _buildNewsList(BuildContext context) {
    final itemCount = articles.length > 10 ? 10 : articles.length;

    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(ZohSizes.sm),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: ZohDeviceUtils.getScreenWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(articles[index].newsImage ?? ""),
                        width: ZohHelperFunction.screenWidth() * .4,
                        fit: BoxFit.cover,
                        height: ZohHelperFunction.screenHeight() * .20,
                      ),
                    ),
                    const SizedBox(width: ZohSizes.sm),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            articles[index].newsTitle ?? "No title",
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ZohSizes.md,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                          Text(
                            articles[index].newsDesc ?? "No description",
                            style: const TextStyle(
                              fontFamily: 'IBM_Plex_Sans',
                              fontSize: ZohSizes.fontSizeSm,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 4,
                          ),
                          const SizedBox(height: ZohSizes.xs),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => NewsView(
                                        blogUrl: articles[index].newsUrl!,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(ZohSizes.sm),
                                  backgroundColor: ZohColors.primaryOpacity,
                                  side: const BorderSide(
                                    color: ZohColors.primaryOpacity,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: ZohSizes.md,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
