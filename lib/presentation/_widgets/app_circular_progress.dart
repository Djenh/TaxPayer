import 'package:flutter/material.dart';

class AppCircularProgress extends StatelessWidget {
  const AppCircularProgress(
      {super.key,
      this.value,
      this.backgroundColor,
      this.color,
      this.valueColor,
      this.strokeWidth = 4.0,
      this.strokeAlign,
      this.semanticsValue,
      this.strokeCap,
      this.semanticsLabel});

  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double strokeWidth;

  final double? strokeAlign;

  final String? semanticsLabel;
  final String? semanticsValue;
  final StrokeCap? strokeCap;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CircularProgressIndicator(
        value: value,
        backgroundColor: backgroundColor,
        color: color,
        valueColor: valueColor,
        strokeWidth: strokeWidth,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        strokeCap: strokeCap,
      ),
    );
  }
}
