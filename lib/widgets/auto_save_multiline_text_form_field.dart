import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../repositories/BaseDataRepository.dart';
import '../styles/colors.dart';

class AutoSaveMultilineTextFormField<T extends BaseDataRepository>
    extends StatefulWidget {
  final String id;
  final String keyToUpdate;

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final T dataRepository;

  const AutoSaveMultilineTextFormField(
      {super.key,
      required this.id,
      required this.keyToUpdate,
      required this.label,
      this.controller,
      this.validator,
      required this.dataRepository});

  @override
  State<AutoSaveMultilineTextFormField> createState() =>
      _AutoSaveTextFormFieldState();
}

class _AutoSaveTextFormFieldState<T extends BaseDataRepository>
    extends State<AutoSaveMultilineTextFormField> {
  late Timer _debounce;

  @override
  void initState() {
    super.initState();
    _debounce = Timer(const Duration(seconds: 2), () {});
  }

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
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(
            decoration:
                TextDecoration.none, // This should remove underline from text
          ),
          onChanged: (text) {
            _debounce.cancel();
            _debounce = Timer(
              const Duration(seconds: 2),
                  () {
                final String text = widget.controller!.text.toString();
                safePrint('your text: $text');
                widget.dataRepository
                    .autoUpdateField(widget.id, widget.keyToUpdate, text);
              },
            );
          },
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
