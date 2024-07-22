import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Try extends StatefulWidget {
  const Try({super.key});
  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  late List<Data> _chartData;
  @override
  void initState(){
    super.initState();
    _chartData = getChartData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SfCircularChart(
        title: ChartTitle(text: "Mon diagramme"),
        legend: Legend(isVisible: true),
        series: <CircularSeries>[
          PieSeries<Data, String>(
            dataSource: _chartData,
            xValueMapper: (Data data, _) => data.jour,
            yValueMapper: (Data data, _) => data.totalVente,
            dataLabelSettings: DataLabelSettings(isVisible: true, ),
          )
        ],
      ),
    ));
  }

  List<Data> getChartData(){
    final List<Data> chartData=[
      Data("Sun", 50),
      Data("Mon", 90),
      Data("Tue", 120),
      Data("Wed", 63),
      Data("Thu", 25),
      Data("Fri", 17),
      Data("Sat", 14),
    ];
    return chartData;
}
}

class Data{
  Data(this.jour, this.totalVente);

  final String jour;
  final int totalVente;
}