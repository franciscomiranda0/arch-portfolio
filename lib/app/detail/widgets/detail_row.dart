import 'package:arch/src/arch_font_size.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: ArchSize.relativeWidth(4, context),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topLeft,
            child: ArchText(
              '$title: ',
              color: ArchPalette.accent,
              fontWeight: FontWeight.w500,
              fontSize: ArchFontSize.heading4,
              textAlign: TextAlign.start,
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          width: ArchSize.relativeWidth(2, context),
        ),
        Expanded(
          flex: 5,
          child: ArchText(
            content,
            color: ArchPalette.accent.withOpacity(.8),
            fontSize: ArchFontSize.heading4,
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          width: ArchSize.relativeWidth(2, context),
        ),
      ],
    );
  }
}
