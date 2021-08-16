import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:flutter/material.dart';

class ArchPillButton extends StatelessWidget {
  const ArchPillButton({
    Key? key,
    this.alignment = Alignment.center,
    this.backgroundColor = ArchPalette.accent,
    required this.child,
    this.elevation = 0,
    required this.onPressed,
    this.padding,
  }) : super(key: key);

  final AlignmentGeometry alignment;
  final Color backgroundColor;
  final Widget child;
  final double elevation;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  EdgeInsets _defaultPadding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: ArchSize.relativeWidth(4, context),
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      style: ButtonStyle(
        alignment: this.alignment,
        backgroundColor: MaterialStateProperty.all(this.backgroundColor),
        elevation: MaterialStateProperty.all(this.elevation),
        padding: MaterialStateProperty.all(
          this.padding ?? _defaultPadding(context),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: this.child,
    );
  }
}
