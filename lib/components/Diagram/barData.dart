import 'individualBar.dart';

class BarData{
  final double sum;
  final double mon;
  final double tue;
  final double wed;
  final double thur;
  final double fri;
  final double sat;

  BarData({
    required this.sum,
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thur,
    required this.fri,
    required this.sat
  });

  List<Individualbar> barData = [];

  void initializeBarDar(){
    barData = [
      Individualbar(x: 0, y: sum),
      Individualbar(x: 1, y: mon),
      Individualbar(x: 2, y: tue),
      Individualbar(x: 3, y: wed),
      Individualbar(x: 4, y: thur),
      Individualbar(x: 5, y: fri),
      Individualbar(x: 6, y: sat),
    ];
  }
}