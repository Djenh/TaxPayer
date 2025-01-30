import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/presentation/features/agency/screens/agency_detail_page.dart';


class AgencyItem extends StatelessWidget {
  final PosDataResponse dataAgency;
  const AgencyItem({super.key,required this.dataAgency});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => AgencyDetailPage(dataAgency: dataAgency)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  "Nom de l’agence",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "Ville",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  "Chiffre d’affaire",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(dataAgency.name??"",
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(dataAgency.address?.locality?.name??"",
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                ),
              ),
              const Flexible(
                flex: 2,
                child: Text("1.200.000",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
        ],
      ),
    );
  }
}
