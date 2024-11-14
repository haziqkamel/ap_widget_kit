part of 'general.dart';

/// A divider that can be used in any context.
class GeneralDivider extends StatelessWidget {
  /// Creates a divider that can be used in any context.
  const GeneralDivider({
    this.dividerColor = Colors.grey,
    this.dividerHeight = 1.0,
    this.dividerThickness = 1.0,
    super.key,
  });

  /// The [dividerColor] parameter is the color of the divider.
  /// Defaults to [Colors.grey].
  final Color dividerColor;

  /// The [dividerColor] parameter is the color of the divider.
  /// Defaults to is 1.0.
  final double dividerHeight;

  /// The [dividerThickness] parameter is the thickness of the divider.
  /// Defaults to is 1.0.
  final double dividerThickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: dividerColor,
      height: dividerHeight,
      thickness: dividerThickness,
    );
  }
}
