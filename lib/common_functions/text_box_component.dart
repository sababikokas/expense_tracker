import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBoxComponent extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final String? prefixText;
  final String? suffixText;
  final TextEditingController? controller;
  final String? errorMessage;
  final TextInputType? inputType;
  final int? maxLength;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatter;
  final Color? textBackgroundColor; // New property for text background color
  final bool allowLettersOnly;
  final String? Function(String?)? validator;
  // New parameter for letter-only input

  const TextBoxComponent({
    this.label,
    this.placeholder,
    this.prefixText,
    this.suffixText,
    this.controller,
    this.errorMessage,
    this.inputType,
    this.maxLength,
    this.readOnly = false,
    this.textBackgroundColor,
    this.inputFormatter,
    this.allowLettersOnly = false,
    this.validator, // Initialize new parameter with default value
  });

  @override
  State<TextBoxComponent> createState() => _TextBoxComponentState();
}

class _TextBoxComponentState extends State<TextBoxComponent> {
  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatters = [
      ...(widget.inputFormatter ?? []),
    ];

    if (widget.allowLettersOnly) {
      formatters.add(LetterOnlyTextInputFormatter());
    }

    return Container(
      color: Colors.transparent, // Set the container color as transparent
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff1344054),
                fontWeight: FontWeight.w500,
              ),
            ),
          if (widget.label != null) const SizedBox(height: 5),
          SizedBox(
            height: 55,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                if (widget.prefixText != null)
                  Positioned(
                    left: 12,
                    child: Text(
                      widget.prefixText!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                Container(
                  // Wrap TextFormField with a Container to set its background color
                  decoration: BoxDecoration(
                    color: widget.textBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffD0D5DD),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    validator: widget.validator,
                    inputFormatters: formatters,
                    maxLength: widget.maxLength,
                    controller: widget.controller,
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: false,
                    keyboardType: widget.inputType,
                    readOnly: widget.readOnly ?? false,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: AppColors.grayText),
                      counterText: '',
                      hintText: widget.placeholder,
                      border: InputBorder
                          .none, // Remove border for the TextFormField
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                if (widget.suffixText != null)
                  Positioned(
                    right: 12,
                    child: Text(
                      widget.suffixText!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (widget.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                widget.errorMessage!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xffFF0000),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class LetterOnlyTextInputFormatter extends TextInputFormatter {
  final RegExp regExp =
      RegExp(r'^[a-zA-Z\s]*$'); // Updated to allow letters and spaces

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue.copyWith(
      text: oldValue.text,
      selection: oldValue.selection,
    );
  }
}
