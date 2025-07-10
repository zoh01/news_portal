import 'package:flutter/material.dart';

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
        margin: EdgeInsets.only(left: ZohSizes.md, right: ZohSizes.md, top: ZohSizes.md),
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