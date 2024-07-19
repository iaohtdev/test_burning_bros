import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:test_burning_bros/presentation/widgets/app_loading.dart';

class ImageHelper {
  static Widget getNetworkImg({
    required String? imageUrl,
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
  }) {
    return CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: fit ?? BoxFit.cover,
        color: color,
        width: width,
        placeholder: (context, url) => const AppLoading(),
        errorWidget: (context, url, error) => const Icon(Icons.error));
  }
}
