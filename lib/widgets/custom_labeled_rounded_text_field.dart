import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomLabeledRoundedTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomLabeledRoundedTextField(
      {super.key, required this.label, this.controller, this.validator,});

  @override
  State<CustomLabeledRoundedTextField> createState() =>
      _CustomLabeledRoundedTextFieldState();
}

class _CustomLabeledRoundedTextFieldState
    extends State<CustomLabeledRoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 16, color: AppColor.whiteColor),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Name input box
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(
            decoration:
                TextDecoration.none, // This should remove underline from text
          ),
          validator: widget.validator,
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            // Adjust the vertical padding
            filled: true,
            fillColor: AppColor.whiteColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide.none,
            ),
            // Add errorBorder to show a red border when there is an error
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide(color: Colors.red),
            ),
            hintStyle: TextStyle(decoration: TextDecoration.none),
          ),
        ),
      ],
    );
  }
}
