import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final BoxShape shape;
  const DefaultImage({
    required this.height,
    required this.width,
    required this.margin,
    required this.shape,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        shape: shape,
        image: DecorationImage(
          image: AssetImage(imgUserDefault),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
