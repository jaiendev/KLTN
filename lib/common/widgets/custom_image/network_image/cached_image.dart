import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/default_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/place_holder_image.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? urlToImage;
  final double? height;
  final double? width;
  final BoxShape shape;
  final BoxFit? fit;
  final EdgeInsetsGeometry? margin;
  const CustomNetworkImage({
    required this.urlToImage,
    this.shape = BoxShape.circle,
    this.height,
    this.width,
    this.margin,
    this.fit = BoxFit.cover,
  }) : assert(height != null || width != null);
  @override
  Widget build(BuildContext context) {
    return urlToImage == null
        ? DefaultImage(
            height: height ?? width!,
            width: height ?? width!,
            margin: margin,
            shape: shape,
          )
        : CachedNetworkImage(
            placeholderFadeInDuration: Duration(milliseconds: DELAY_200_MS),
            fadeInDuration: Duration(milliseconds: DELAY_200_MS),
            fadeOutDuration: Duration(milliseconds: DELAY_200_MS),
            imageUrl: urlToImage!,
            imageBuilder: (context, imageProvider) => Container(
              height: height ?? width!,
              width: height ?? width!,
              margin: margin,
              decoration: BoxDecoration(
                shape: shape,
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              margin: margin,
              child: PlaceHolderImage(
                height: height ?? width!,
                width: height ?? width!,
                shape: shape,
              ),
            ),
            errorWidget: (context, url, error) => DefaultImage(
              height: height ?? width!,
              width: height ?? width!,
              margin: margin,
              shape: shape,
            ),
          );
  }
}
