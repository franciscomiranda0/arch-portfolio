import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:flutter/material.dart';

class ShowcaseTagItem extends StatelessWidget {
  const ShowcaseTagItem(
    this.content, {
    Key? key,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ArchSize.relativeWidth(1, context),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ArchPalette.primary,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: ArchPalette.accent,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: ArchSize.relativeWidth(2, context)),
        child: ArchText(
          content,
          color: ArchPalette.accent,
        ),
      ),
    );
  }
}
