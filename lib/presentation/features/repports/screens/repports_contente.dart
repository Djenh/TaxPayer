import 'package:flutter/material.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/presentation/controllers/dashboard_ctrl.dart';
import 'package:invoice_app/presentation/features/repports/screens/repports_revenue.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class RepportsContente extends StatelessWidget {
  RepportsContente({super.key});
  final dashboardCtr = locator<DashboardCtrl>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Situation",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: KStyles.blackColor),
                    ),
                    const SizedBox(
                      height: padding5,
                    ),
                    Text(
                      "Période : ${dashboardCtr.selectedStartDate.toString().split(' ')[0]} au ${dashboardCtr.selectedEndDate.toString().split(' ')[0]}",
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
            ),
            GestureDetector(
              onTap: (){
                dashboardCtr.pickDateRange(context,false);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: KStyles.dropDownBorderColor)
                ),
                child: const Padding(
                    padding: EdgeInsets.all(padding5),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_outlined, color: KStyles.blackColor, size: 25),
                        SizedBox(
                          width: padding5,
                        ),
                        Icon(Icons.keyboard_arrow_down, color: KStyles.blackColor, size: 25)
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        buildRepportSection(title: "Situation", items: ["Vente", "Achats"]),//
        const SizedBox(height: 20),
        buildRepportSection(title: "Chiffre d’affaire", items: ["Quotidien", "Hebdomadaire", "Mensuel", "Annuel"]),
      ],
    );
  }
}
