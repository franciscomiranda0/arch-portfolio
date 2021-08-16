import 'package:arch/src/arch_font_size.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:flutter/material.dart';

class ShowcaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  ShowcaseAppBar({
    Key? key,
    required this.title,
    this.toolbarHeight,
    this.bottom,
  })  : preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  final PreferredSizeWidget? bottom;
  final Size preferredSize;
  final String title;
  final double? toolbarHeight;

  @override
  _ShowcaseAppBarState createState() => _ShowcaseAppBarState();
}

class _ShowcaseAppBarState extends State<ShowcaseAppBar> {
  void _onPressedBack() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ArchPalette.black,
      centerTitle: true,
      elevation: 2,
      leading: IconButton(
        onPressed: _onPressedBack,
        icon: Icon(
          Icons.chevron_left_sharp,
          color: ArchPalette.accent,
        ),
      ),
      shadowColor: ArchPalette.accent,
      toolbarHeight: ArchSize.relativeHeight(16, context),
      title: ArchText(
        widget.title,
        color: ArchPalette.accent,
        fontSize: ArchFontSize.heading2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
