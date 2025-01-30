import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/kagencycard.dart';
import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/presentation/features/agency/screens/agency_item.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

// ignore: must_be_immutable
class AgencyPage extends StatelessWidget {
  List<PosDataResponse>? dataAgency;
  AgencyPage({super.key,this.dataAgency});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Situation : 2025", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: KStyles.blackColor),),
                  Text("10 agences",style: TextStyle(color: KStyles.blackColor)),
                ],
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: KStyles.dropDownBorderColor)
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(padding5),
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt_outlined, color: KStyles.blackColor, size: 25),
                          SizedBox(
                            width: padding5,
                          ),
                          Text("Année 2025",style: TextStyle(color: KStyles.blackColor)),
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: KAgencycard(
                  title: "Chiffre d'affaires",
                  subTitle: "1 500 FCFA",
                  onPressed: (){

                  },
                  borderColor: KStyles.primaryColor,
                  icon: Iconsax.wallet,
                ),
              ),

              const SizedBox(
                width: padding,
              ),
              Flexible(
                child: KAgencycard(
                  title: "Factures",
                  subTitle: "200 000 FCFA",
                  onPressed: (){

                  },
                  borderColor: KStyles.secondaryColor,
                  icon: Iconsax.bill,
                ),
              ),

              const SizedBox(
                width: padding,
              ),
              Flexible(
                child: KAgencycard(
                  title: "Total Agence",
                  subTitle: "10",
                  onPressed: (){

                  },
                  borderColor: KStyles.textSecondaryColor,
                  icon: Iconsax.home,
                ),
              ),

            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Liste des agences",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: KStyles.blackColor),
          ),
          const SizedBox(height: 5),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dataAgency!.length,
            itemBuilder: (BuildContext context, int ps){
              return AgencyItem(dataAgency: dataAgency![ps]);
            },
          ),
        ],
      ),
    );
  }
}




