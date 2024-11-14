import 'package:ap_widget_kit/src/general/general.dart';
import 'package:flutter/material.dart';

/// {@template ap_widget_kit}
/// Alphapod Widget Kit
/// {@endtemplate}
class ApWidgetKit {
  /// {@macro ap_widget_kit}
  const ApWidgetKit();

  /// The current version of the package.
  static const version = '0.0.1';

  /// Build GeneralDivider
  static Widget generalDivider({
    Color dividerColor = Colors.grey,
    double dividerHeight = 1.0,
    double dividerThickness = 1.0,
  }) {
    return GeneralDivider(
      dividerColor: dividerColor,
      dividerHeight: dividerHeight,
      dividerThickness: dividerThickness,
    );
  }

  /// Build GeneralSwitch
  static Widget generalSwitch({
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return GeneralSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
    );
  }
}
