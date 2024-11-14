part of 'general.dart';

/// A switch that can be used in any context.
class GeneralSwitch extends StatelessWidget {
  /// Creates a switch that can be used in any context.
  const GeneralSwitch({
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    super.key,
  });

  /// The [value] parameter is the current value of the switch.
  final bool value;

  /// The [onChanged] parameter is the callback that is called
  /// when the switch is toggled.
  final ValueChanged<bool> onChanged;

  /// The [activeColor] parameter is the color of the switch when it is on.
  final Color? activeColor;

  /// The [inactiveColor] parameter is the color of the switch when it is off.
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      inactiveTrackColor: inactiveColor,
    );
  }
}
