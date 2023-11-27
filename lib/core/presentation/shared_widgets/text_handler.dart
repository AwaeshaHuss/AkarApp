import 'package:flutter/material.dart';

class TextHandler extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const TextHandler(this.text, {
    super.key,
    required this.style,
     this.overflow,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,

    );
  }
}
