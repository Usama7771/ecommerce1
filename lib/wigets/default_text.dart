import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultText extends StatelessWidget {
  String text;
  Color? color;
  double fontSize;
  FontStyle? fontStyle;
  DefaultText(
      {super.key, required this.text, this.color, required this.fontSize, this.fontStyle});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize, fontStyle: fontStyle),
    );
  }
}
