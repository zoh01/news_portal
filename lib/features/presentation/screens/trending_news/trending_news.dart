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
    return SizedBox(
      height: ZohDeviceUtils.getScreenHeight(),
      child: trendingShimmer ? Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.transparent,
          child: ListView.builder(
            itemCount: articles.length,
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(ZohSizes.sm),
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
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: NetworkImage(
                                articles[index].newsImage!,
                              ),
                              width:
                              ZohHelperFunction.screenWidth() * .4,
                              fit: BoxFit.cover,
                              height:
                              ZohHelperFunction.screenHeight() *
                                  .20,
                            ),
                          ),
                          SizedBox(width: ZohSizes.sm),
                          Flexible(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  articles[index].newsTitle!,
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
                                Text(
                                  articles[index].newsDesc!,
                                  style: TextStyle(
                                    fontFamily: 'IBM_Plex_Sans',
                                    fontSize: ZohSizes.fontSizeSm,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 4,
                                ),
                                SizedBox(height: ZohSizes.xs),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => NewsView(
                                              blogUrl:
                                              articles[index]
                                                  .newsUrl!,
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                          ZohSizes.sm,
                                        ),
                                        backgroundColor:
                                        ZohColors.primaryOpacity,
                                        side: BorderSide(
                                          color:
                                          ZohColors.primaryOpacity,
                                        ),
                                      ),
                                      child: Icon(
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
          )
      ) : ListView.builder(
        itemCount: articles.length,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(ZohSizes.sm),
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
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: NetworkImage(
                            articles[index].newsImage!,
                          ),
                          width:
                          ZohHelperFunction.screenWidth() * .4,
                          fit: BoxFit.cover,
                          height:
                          ZohHelperFunction.screenHeight() *
                              .20,
                        ),
                      ),
                      SizedBox(width: ZohSizes.sm),
                      Flexible(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              articles[index].newsTitle!,
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
                            Text(
                              articles[index].newsDesc!,
                              style: TextStyle(
                                fontFamily: 'IBM_Plex_Sans',
                                fontSize: ZohSizes.fontSizeSm,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 4,
                            ),
                            SizedBox(height: ZohSizes.xs),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => NewsView(
                                          blogUrl:
                                          articles[index]
                                              .newsUrl!,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(
                                      ZohSizes.sm,
                                    ),
                                    backgroundColor:
                                    ZohColors.primaryOpacity,
                                    side: BorderSide(
                                      color:
                                      ZohColors.primaryOpacity,
                                    ),
                                  ),
                                  child: Icon(
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
      ),
    );
  }
}