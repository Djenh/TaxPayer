import 'package:flutter/material.dart';


class Indicator extends StatelessWidget {
  final BoxShape shp;
  final Color color;
  final double wdt;
  final double hgt;

  const Indicator({super.key, required this.shp, required this.color,
    required this.wdt, required this.hgt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wdt,
      height: hgt,
      decoration: BoxDecoration(color: color, shape: shp),
    );
  }
}