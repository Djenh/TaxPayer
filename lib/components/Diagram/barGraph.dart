import 'package:bes_mobile/components/Diagram/barData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final List data;
  BarGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    BarData myBardata = BarData(
        sum: data[0],
        mon: data[1],
        tue: data[2],
        wed: data[3],
        thur: data[4],
        fri: data[5],
        sat: data[6]);
    myBardata.initializeBarDar();
    return BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
            border: Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1))),
        titlesData: FlTitlesData(
            rightTitles: AxisTitles(drawBelowEverything: false),
            topTitles: AxisTitles(drawBelowEverything: false),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles))
        ),
        barGroups: myBardata.barData
            .map((e) => BarChartGroupData(x: e.x, barRods: [
                  BarChartRodData(
                      toY: e.y,
                      width: 25,
                      borderRadius: BorderRadius.circular(1)),
                ]))
            .toList()));
  }
}

Widget getBottomTitles(double values, TitleMeta meta) {
  const style = TextStyle( fontSize: 14);

  Widget text;
  switch (values.toInt()) {
    case 0:
      text = const Text(
        "Sun",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "Mon",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "Thu",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "Wed",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "The",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "Fri",
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "Sat",
        style: style,
      );
      break;
    default:
      text = const Text('', style: style);
  }

  return SideTitleWidget(child: (text), axisSide: meta.axisSide);
}
