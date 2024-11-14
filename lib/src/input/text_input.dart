part of 'input.dart';

/// Custom Input Widget
class CustomInput extends StatefulWidget {
  /// Custom Input Widget
  const CustomInput({
    this.isRequired = false,
    this.isInputArea = false,
    this.isDisabled = false,
    this.withCounter = false,
    this.keyboardType = TextInputType.text,
    this.secureText = false,
    super.key,
    this.controller,
    this.placeholder,
    this.label,
    this.initialValue,
    this.counterValue,
    this.counterText,
    this.leadingIcon,
    this.onSubmit,
    this.onChanged,
    this.contentPadding,
    this.formatter,
    this.validator,
    this.border,
    this.node,
    this.errorMessage,
    this.helperText,
    this.removeTopPadding = false,
    this.counterTextStyle,
    this.errorMessageTextStyle,
    this.helperTextStyle,
    this.placeHolderStyle,
    this.disabledPasswordIcon,
    this.enabledPasswordIcon,
    this.disabledBgColor = const Color(0xFFE6E6E6),
    this.enabledBgColor = const Color(0xFFFAFAFA),
  });

  /// A [TextEditingController] to control the text being input
  final TextEditingController? controller;

  /// A [String] to display as a placeholder
  final String? placeholder;

  /// A [TextStyle] for the placeholder
  final TextStyle? placeHolderStyle;

  /// A [String] to display as a label
  final String? label;

  /// A [String] to display initial value
  final String? initialValue;

  /// A [String] to display as a counter value
  final String? counterValue;

  /// A [String] to display as a counter text
  final String? counterText;

  /// A [TextStyle] for counter text
  final TextStyle? counterTextStyle;

  /// A [String] to display as an error message
  final String? errorMessage;

  /// A [TextStyle] for the error message
  final TextStyle? errorMessageTextStyle;

  /// A [String] to display as a helper text
  final String? helperText;

  /// A [TextStyle] for the helper text
  final TextStyle? helperTextStyle;

  /// To determine if the input is a password
  final bool secureText;

  /// To determine if the input is required
  final bool isRequired;

  /// To determine if the input is a text area
  final bool isInputArea;

  /// To determine if the input is disabled
  final bool isDisabled;

  /// To determine if the input has a counter
  final bool withCounter;

  /// A [Widget] to display as a leading icon
  final Widget? leadingIcon;

  /// A [Function] to handle the submit event
  final void Function(String value)? onSubmit;

  /// A [Function] to handle the change event
  final void Function(String value)? onChanged;

  /// To determine the keyboard type
  /// Default to [TextInputType.text]
  final TextInputType? keyboardType;

  /// To determine the content padding
  final EdgeInsets? contentPadding;

  /// A [InputBorder] to set the border
  final InputBorder? border;

  /// A [FocusNode] to set the focus node
  final FocusNode? node;

  /// To remove the current set top padding,
  /// if working with Column in a Row
  final bool removeTopPadding;

  /// List of [TextInputFormatter] to format the input
  final List<TextInputFormatter>? formatter;

  /// Validator function to validate the input
  final String? Function(String?)? validator;

  /// Asset [String] path to disabled password icon
  final String? disabledPasswordIcon;

  /// Asset [String] path to enabled password icon
  final String? enabledPasswordIcon;

  /// The color of the fill when the input is disabled
  final Color? disabledBgColor;

  /// The color of the fill when the input is enabled
  final Color? enabledBgColor;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isFocused = false;
  bool showValue = true;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.node ?? FocusNode();

    _focusNode?.addListener(() {
      if (mounted) {
        setState(() {
          isFocused = _focusNode?.hasFocus ?? false;
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.node == null) {
      _focusNode?.dispose();
    }
    super.dispose();
  }

  bool get isError =>
      widget.errorMessage != null &&
      (widget.errorMessage?.trim().isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Label Widget
        if (label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (widget.isRequired)
                    RichText(
                      text: TextSpan(
                        text: label,
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: const Color(0xFF969696)),
                        children: [
                          TextSpan(
                            text: ' *',
                            style: theme.textTheme.labelMedium
                                ?.copyWith(color: const Color(0xFF969696)),
                          ),
                        ],
                      ),
                    )
                  else
                    Text(
                      label,
                      style: theme.textTheme.labelMedium
                          ?.copyWith(color: const Color(0xFF969696)),
                    ),
                ],
              ),
            ],
          ),
        ],
        if (!widget.removeTopPadding) Gap.vM(),
        // TextFormField Widget
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: getInputBackgroundColor(),
              borderRadius: BorderRadius.circular(8),
              border: widget.border != null
                  ? null
                  : Border.all(
                      color: borderColor,
                      width: borderWidth,
                    ),
            ),
            padding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              focusNode: _focusNode,
              autocorrect: false,
              validator: widget.validator,
              initialValue: widget.initialValue,
              enabled: !widget.isDisabled,
              onChanged: widget.onChanged,
              obscureText: widget.secureText ? showValue : !showValue,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              onFieldSubmitted: widget.onSubmit,
              inputFormatters: widget.formatter,
              minLines: 1,
              maxLines: widget.isInputArea ? 3 : 1,
              style: theme.textTheme.labelLarge?.copyWith(
                color: labelColor(),
                // decorationStyle: TextDecorationStyle.dashed,
              ),
              decoration: InputDecoration(
                labelStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: labelColor(),
                  height: 0,
                ),
                suffixIconConstraints: const BoxConstraints(),
                prefixIconConstraints: const BoxConstraints(),
                hintText: isFocused ? null : widget.placeholder,
                hintStyle: widget.placeHolderStyle,
                contentPadding: widget.isInputArea
                    ? const EdgeInsets.symmetric(vertical: 10)
                    : widget.contentPadding ?? const EdgeInsets.only(bottom: 2),
                border: widget.border ?? InputBorder.none,
                prefixIcon: widget.leadingIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: widget.leadingIcon,
                      )
                    : null,
                suffixIcon: widget.secureText
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            showValue = !showValue;
                          });
                        },
                        child: (widget.disabledPasswordIcon == null ||
                                widget.enabledPasswordIcon == null)
                            ? Icon(
                                showValue
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              )
                            : SvgImage(
                                assetName: showValue
                                    ? widget.disabledPasswordIcon!
                                    : widget.enabledPasswordIcon!,
                                fit: BoxFit.scaleDown,
                                // colorFilter: theme.isLightTheme
                                //     ? const ColorFilter.mode(
                                //         AppColors.nero,
                                //         BlendMode.srcIn,
                                //       )
                                //     : null,
                              ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        // Error Widget
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: isError && widget.errorMessage != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.vS(),
                  Text(
                    widget.errorMessage ?? '',
                    style: widget.errorMessageTextStyle,
                  ),
                ],
              ),
            ),
            // Counter Widget
            if (widget.withCounter) ...[
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${widget.counterValue ?? ''}${widget.counterText ?? ''}',
                    style: widget.counterTextStyle,
                  ),
                ),
              ),
            ],
          ],
        ),
        // Helper Text Widget
        if (widget.helperText != null) ...[
          Gap.vS(),
          Text(
            widget.helperText ?? '',
            style: widget.helperTextStyle,
          ),
        ],
      ],
    );
  }

  Color? getInputBackgroundColor() =>
      widget.isDisabled ? widget.disabledBgColor : widget.enabledBgColor;

  Color get borderColor {
    if (isError) return Colors.red;
    if (isFocused) return Colors.black;
    if (widget.isDisabled) {
      return const Color(0xFFE6E6E6);
    }
    return const Color(0xFFDCDCDC);
  }

  Color labelColor() {
    if (widget.isDisabled) {
      return Colors.white;
    }
    if (isFocused) {
      return Colors.black;
    }
    return Colors.black;
  }

  double get borderWidth => 1;
}
