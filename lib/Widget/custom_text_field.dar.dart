import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    required this.initialValue,
    this.onChange,
  });

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final String initialValue;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChange,
        initialValue: initialValue,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(hintText: hintText, labelText: labelText),
      ),
    );
  }
}
