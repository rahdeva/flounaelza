import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';

enum PlaceholderShape { square, rectangle, circle }

/// A reusable widget for loading images with network support, dynamic placeholders, 
/// and customizable shapes.
///
/// ## Features
/// - Supports network images.
/// - Dynamically displays placeholders for square, rectangle, or circle shapes.
/// - Handles errors gracefully with fallback images.
///
/// ## Example Usage:
/// ### Square Placeholder
/// ```dart
/// ImageLoad(
///   imageUrl: 'https://example.com/sample-square-image.jpg',
///   placeholderShape: PlaceholderShape.square,
///   width: 100,
///   height: 100,
/// );
/// ```
///
/// ### Rectangle Placeholder
/// ```dart
/// ImageLoad(
///   imageUrl: 'https://example.com/sample-rectangle-image.jpg',
///   placeholderShape: PlaceholderShape.rectangle,
///   width: 200,
///   height: 100,
/// );
/// ```
///
/// ### Circle Placeholder
/// ```dart
/// ImageLoad(
///   imageUrl: 'https://example.com/sample-circle-image.jpg',
///   placeholderShape: PlaceholderShape.circle,
///   width: 100,
///   height: 100,
/// );
/// ```
class ImageLoad extends StatelessWidget {
  final String imageUrl;
  final PlaceholderShape placeholderShape;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageLoad({
    super.key,
    required this.imageUrl,
    this.placeholderShape = PlaceholderShape.rectangle,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  String _getPlaceholderAsset() {
    switch (placeholderShape) {
      case PlaceholderShape.square:
        return ImageAssetConstant.placeholderSquareImage;
      case PlaceholderShape.circle:
        return ImageAssetConstant.placeholderCircleImage;
      case PlaceholderShape.rectangle:
        return ImageAssetConstant.placeholderRectangleImage;
      default:
        return ImageAssetConstant.placeholderRectangleImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    final placeholderAsset = _getPlaceholderAsset();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: placeholderShape == PlaceholderShape.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: placeholderShape == PlaceholderShape.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage(placeholderAsset),
            fit: fit,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: placeholderShape == PlaceholderShape.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage(placeholderAsset),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
