import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;
  const CustomText(
      {super.key,
      required this.title,
      this.style,
      this.maxLines,
      this.overflow,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
);
}
}