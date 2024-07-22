import 'package:flutter/material.dart';

import 'barGraph.dart';


class BarDiagram extends StatefulWidget {
  const BarDiagram({super.key});

  @override
  State<BarDiagram> createState() => _BarDiagramState();
}

class _BarDiagramState extends State<BarDiagram> {
  List<double> data = [4.40, 70.50, 42.42, 10.50, 100.20, 8.99, 90.10];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: SizedBox(
              height: 400,
              child: BarGraph(data: data,)
          )
      ),
    );
  }
}
