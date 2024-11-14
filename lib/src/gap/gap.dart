import 'package:flutter/widgets.dart';

/// A widget that provide gap between widgets.
class Gap extends StatelessWidget {
  
  /// Creates a widget that provide gap between widgets.
  const Gap({
    super.key,
    this.height,
    this.width,
  });

  /// Create a vertical gap with height of 2.
  factory Gap.vXxS() => const Gap(height: 2);

  /// Create a vertical gap with height of 4.
  factory Gap.vXs() => const Gap(height: 4);

  /// Create a vertical gap with height of 8.
  factory Gap.vS() => const Gap(height: 8);

  /// Create a vertical gap with height of 12.
  factory Gap.vM() => const Gap(height: 12);

  /// Create a vertical gap with height of 16.
  factory Gap.vL() => const Gap(height: 16);

  /// Create a vertical gap with height of 24.
  factory Gap.vXL() => const Gap(height: 24);

  /// Create a vertical gap with height of 32.
  factory Gap.vXXL() => const Gap(height: 32);

  /// Create a vertical gap with height of 40.
  factory Gap.vXXXL() => const Gap(height: 40);

  /// Create a horizontal gap with width of 2.
  factory Gap.hXxS() => const Gap(width: 2);

  /// Create a horizontal gap with width of 4.
  factory Gap.hXs() => const Gap(width: 4);

  /// Create a horizontal gap with width of 8.
  factory Gap.hS() => const Gap(width: 8);

  /// Create a horizontal gap with width of 12.
  factory Gap.hM() => const Gap(width: 12);

  /// Create a horizontal gap with width of 16.
  factory Gap.hL() => const Gap(width: 16);

  /// Create a horizontal gap with width of 24.
  factory Gap.hXL() => const Gap(width: 24);

  /// Create a horizontal gap with width of 32.
  factory Gap.hXXL() => const Gap(width: 32);

  /// Create a horizontal gap with width of 40.
  factory Gap.hXXXL() => const Gap(width: 40);

  /// The [height] parameter is the height of the gap. For vertical gap.
  final double? height;

  /// The [width] parameter is the width of the gap. For horizontal gap.
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
