part of 'image.dart';

/// A widget that displays an SVG image loaded from an asset bundle.
class SvgImage extends StatelessWidget {
  /// Creates a widget that displays an SVG image loaded from an asset bundle.
  const SvgImage({
    required this.assetName,
    super.key,
    this.width,
    this.height,
    this.colorFilter,
    this.fit,
  });

  /// The name of the asset to be loaded.
  final String assetName;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The [ColorFilter] to apply to the image.
  final ColorFilter? colorFilter;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(
        assetName,
      ),
      width: width,
      height: height,
      colorFilter: colorFilter,
      fit: fit ?? BoxFit.contain,
    );
  }
}
