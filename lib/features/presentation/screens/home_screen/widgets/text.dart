import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.spaceBtwZoh,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            'View All',
            style: TextStyle(
              color: ZohColors.primaryColor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.iconXs,
            ),
          ),
        ),
      ],
    );
  }
}