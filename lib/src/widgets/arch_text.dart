import 'package:arch/src/arch_font_size.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:flutter/material.dart';

class ArchText extends StatelessWidget {
  const ArchText(
    this.content, {
    Key? key,
    this.color = ArchPalette.black,
    this.fontSize = ArchFontSize.heading5,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    this.softWrap = false,
  }) : super(key: key);

  final String content;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.content,
      softWrap: this.softWrap,
      style: TextStyle(
        color: this.color,
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
      ),
      textAlign: this.textAlign,
    );
  }
}
