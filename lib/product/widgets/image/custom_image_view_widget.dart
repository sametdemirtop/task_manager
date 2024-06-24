import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImageView extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Color? placeholderColor;

  const CustomImageView({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.placeholderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) => Container(
                width: width,
                height: height,
                color: placeholderColor,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                color: placeholderColor,
                child: const Icon(
                  Icons.error,
                  color: Colors.black,
                ),
              ),
            )
          : Container(
              width: width,
              height: height,
              color: placeholderColor,
              child: const Icon(
                Icons.error,
                color: Colors.black,
              ),
            ),
    );
  }
}
