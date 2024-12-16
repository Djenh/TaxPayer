import 'package:flutter/material.dart';

Widget buildText(BuildContext context, String text, double fontSize,
    Color color, {FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}
