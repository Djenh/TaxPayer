import 'package:flutter/material.dart';

double PADDING = 10;
Color PRIMARY=Colors.black;

LinearGradient FLAG_GRADIENT = LinearGradient(

    colors: [
  Color(0XFF0E6258).withOpacity(0.5),
  Color(0XFFFFBE00).withOpacity(0.5),
  Color(0XFFEB0000).withOpacity(0.5),

],
begin: Alignment.centerLeft,
  end: Alignment.centerRight
);

LinearGradient FLAG_GRADIENT_HIGH_COLOR = LinearGradient(colors: [
  Color(0XFF0E6258),
  Color(0XFFFFBE00),
  Color(0XFFEB0000),
]);

LinearGradient BLUE_GREEN = LinearGradient(colors: [
  Color(0XFF0E6258).withOpacity(0.5),
  Color(0XFF043D6BFF).withOpacity(0.5),
]);
