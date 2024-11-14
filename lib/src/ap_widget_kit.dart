import 'package:ap_widget_kit/src/enum/enum.dart';
import 'package:ap_widget_kit/src/general/general.dart';
import 'package:ap_widget_kit/src/input/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    bool isDisabled = false,
  }) {
    return GeneralSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      isDisabled: isDisabled,
    );
  }

  /// Build GeneralCheckbox
  static Widget generalCheckbox({
    required bool value,
    required ValueChanged<bool?> onChanged,
    Color activeColor = const Color(0xFF007AFF),
    Color inactiveColor = const Color(0xFFE6E6E6),
    bool isDisabled = false,
    Color inactiveDisabledColor = const Color(0xFFF0F0F0),
  }) {
    return GeneralCheckbox(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      isDisabled: isDisabled,
      inactiveDisabledColor: inactiveDisabledColor,
    );
  }

  /// Build GeneralButton
  static Widget generalButton({
    required String buttonLabel,
    void Function()? onPressed,
    Color fillColor = Colors.blueGrey,
    Color altFillColor = Colors.grey,
    ButtonType type = ButtonType.primary,
    ButtonVariant variant = ButtonVariant.main,
    TextStyle? textStyle,
    Widget? icon,
  }) {
    return GeneralButton(
      type: type,
      variant: variant,
      buttonLabel: buttonLabel,
      onPressed: onPressed,
      fillColor: fillColor,
      altFillColor: altFillColor,
      textStyle: textStyle,
      icon: icon,
    );
  }

  /// Build CustomInput
  static Widget customInput({
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool isDisabled = false,
    bool isRequired = false,
    bool isSecure = false,
    bool isInputArea = false,
    bool withCounter = false,
    String? placeholder,
    String? label,
    String? initialValue,
    String? errorMessage,
    String? counterValue,
    String? counterText,
    TextStyle? errorMessageTextStyle,
    List<TextInputFormatter>? formatter,
    FocusNode? focusNode,
    EdgeInsets? contentPadding,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return CustomInput(
      controller: controller,
      keyboardType: keyboardType,
      isDisabled: isDisabled,
      isRequired: isRequired,
      isInputArea: isInputArea,
      withCounter: withCounter,
      validator: validator,
      onChanged: onChanged,
      placeholder: placeholder,
      secureText: isSecure,
      errorMessage: errorMessage,
      errorMessageTextStyle: errorMessageTextStyle,
      label: label,
      initialValue: initialValue,
      counterValue: counterValue,
      counterText: counterText,
      formatter: formatter,
      node: focusNode,
      contentPadding: contentPadding,
    );
  }
}
