import 'package:flutter/material.dart';

class TextDesign extends StatelessWidget {
  const TextDesign(
      {super.key,
      required this.text,
      this.style,
      this.overflow,
      this.maxLines});
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, overflow: overflow, maxLines: maxLines);
  }
}
