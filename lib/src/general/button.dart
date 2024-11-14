part of 'general.dart';

/// A widget that displays a button.
///
/// There are 3 types of [ButtonType]:
/// - [ButtonType.primary]
/// - [ButtonType.secondary]
/// - [ButtonType.alt]
///
/// There are 3 variants of [ButtonVariant]:
/// - [ButtonVariant.main]
/// - [ButtonVariant.leadingIcon]
/// - [ButtonVariant.trailingIcon]
///
class GeneralButton extends StatelessWidget {
  /// Creates a [GeneralButton].
  const GeneralButton({
    required this.type,
    required this.variant,
    required this.buttonLabel,
    required this.onPressed,
    required this.fillColor,
    required this.altFillColor,
    super.key,
    this.textStyle,
    this.isDisabled = false,
    this.buttonWidth,
    this.icon,
  });

  /// The type of button.
  final ButtonType type;

  /// The variant of button.
  final ButtonVariant variant;

  /// The label of the button.
  final String buttonLabel;

  /// The style of the text.
  final TextStyle? textStyle;

  /// The function to be called when the button is pressed.
  final void Function() onPressed;

  /// The color of the button.
  final Color fillColor;

  /// The alternative color of the button.
  final Color altFillColor;

  /// Whether the button is disabled.
  final bool isDisabled;

  /// The width of the button.
  final double? buttonWidth;

  /// The icon of the button.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = switch (type) {
      ButtonType.primary => ElevatedButton.styleFrom(
          backgroundColor: fillColor,
        ),
      ButtonType.secondary => ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ButtonType.alt => ElevatedButton.styleFrom(
          backgroundColor: altFillColor,
        ),
    };

    final textStyling = textStyle ??
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: type == ButtonType.secondary ? fillColor : Colors.white,
        );

    final buttonPadding = switch (variant) {
      ButtonVariant.main => const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
      ButtonVariant.leadingIcon => const EdgeInsets.only(
          top: 6,
          bottom: 6,
          left: 12,
          right: 16,
        ),
      ButtonVariant.trailingIcon => const EdgeInsets.only(
          top: 6,
          bottom: 6,
          left: 16,
          right: 12,
        ),
    };

    final child = switch (variant) {
      ButtonVariant.main => Text(
          buttonLabel,
          style: textStyling,
        ),
      ButtonVariant.leadingIcon => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(width: 8),
            Text(
              buttonLabel,
              style: textStyling,
            ),
          ],
        ),
      ButtonVariant.trailingIcon => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonLabel,
              style: textStyling,
            ),
            const SizedBox(width: 8),
            icon ?? const SizedBox.shrink(),
          ],
        ),
    };

    return ElevatedButton(
      style: buttonStyle.copyWith(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: type == ButtonType.secondary
                ? BorderSide(
                    color: fillColor,
                  )
                : BorderSide.none,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        animationDuration: Duration.zero,
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(buttonPadding),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
