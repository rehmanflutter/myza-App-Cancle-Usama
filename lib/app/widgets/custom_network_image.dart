import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String img;
  final double? height;
  final double? width;

  const CustomNetworkImage(
      {super.key, required this.img, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: img,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            strokeWidth: 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
