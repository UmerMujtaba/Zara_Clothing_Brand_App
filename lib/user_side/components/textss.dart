import 'dart:ui';

import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.size,
      required this.text,
      this.fontWeight,
      this.textAlign,
        this.fontFamily,
        this.fontStyle,
      this.letterSpacing,
      required this.color});

  final double size;
  final String text;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? letterSpacing;
String? fontFamily;
  TextAlign? textAlign;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
      ),
      textAlign: textAlign,
    );
  }
}
