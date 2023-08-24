import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;

  const TextInputField({
    required this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
