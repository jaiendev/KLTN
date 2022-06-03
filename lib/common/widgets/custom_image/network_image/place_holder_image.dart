import 'package:app_kltn_trunghoan/common/widgets/shimmers/fade_simmer.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';

class PlaceHolderImage extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape shape;
  const PlaceHolderImage(
      {required this.height, required this.width, required this.shape});
  @override
  Widget build(BuildContext context) {
    return shape == BoxShape.circle
        ? FadeShimmer.round(
            size: height,
            highlightColor: colorWhite1,
            baseColor: colorGray3,
          )
        : FadeShimmer(
            width: width,
            height: height,
            highlightColor: colorWhite1,
            baseColor: colorGray3,
          );
  }
}
