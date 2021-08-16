import 'package:flutter/material.dart';

abstract class ArchSize {
  static double relativeHeight(double height, BuildContext context) =>
      MediaQuery.of(context).size.height * (height / 100);
  static double relativeWidth(double width, BuildContext context) =>
      MediaQuery.of(context).size.width * (width / 100);
}
