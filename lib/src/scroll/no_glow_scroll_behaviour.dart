part of 'scroll.dart';

/// A [ScrollBehavior] that does not apply a glow effect when its scroll
class NoGlowScrollBehaviour extends ScrollBehavior {
  /// Creates a [NoGlowScrollBehaviour]
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
