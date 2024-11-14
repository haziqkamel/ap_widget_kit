part of 'general.dart';

/// A general checkbox that can be used in any context.
class GeneralCheckbox extends StatelessWidget {
  /// Creates a general checkbox that can be used in any context.
  const GeneralCheckbox({
    required this.value,
    required this.onChanged,
    required this.isDisabled,
    super.key,
    this.activeColor = const Color(0xFF007AFF),
    this.inactiveColor = const Color(0xFFE6E6E6),
    this.inactiveDisabledColor = const Color(0xFFF0F0F0),
  });

  /// The [value] parameter is the value of the checkbox.
  final bool value;

  /// The [onChanged] parameter is the callback when the checkbox is changed.
  final ValueChanged<bool?> onChanged;

  /// The [activeColor] parameter is the color of the checkbox
  /// when it is active.
  final Color activeColor;

  /// The [inactiveColor] parameter is the color of the checkbox
  final Color inactiveColor;

  /// The [isDisabled] parameter is the state of the checkbox.
  final bool isDisabled;

  /// The [inactiveDisabledColor] parameter is the color of the checkbox
  final Color? inactiveDisabledColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoCheckbox(
      value: value,
      onChanged: onChanged,
      activeColor: isDisabled ? activeColor.withOpacity(0.25) : activeColor,
      inactiveColor: isDisabled ? inactiveDisabledColor : inactiveColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(
        color: (isDisabled && value)
            ? activeColor.withOpacity(0)
            : (!value)
                ? const Color(0xFFE6E6E6)
                : activeColor,
        width: 1.5,
      ),
    );
  }
}
