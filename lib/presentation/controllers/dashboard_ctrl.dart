import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DashboardCtrl extends GetxController {
  RxInt currentIndex = 0.obs;
  DateTime selectedStartDate = DateTime(2024, 10, 10);
  DateTime selectedEndDate = DateTime(2025, 1, 18);


  void pickDateRange(BuildContext context,bool isStartedDate) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: DateTimeRange(
        start: selectedStartDate,
        end: selectedEndDate,
      ),
    );
    if (picked != null) {
      isStartedDate ? selectedStartDate = picked.start : selectedEndDate = picked.end;
      update();
    }
  }
  void onTabTapped(int value) => currentIndex.value = value;


}