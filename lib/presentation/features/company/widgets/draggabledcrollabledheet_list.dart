import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/presentation/features/company/widgets/card_company_page.dart';
import 'package:invoice_app/presentation/features/company/widgets/mouvement_item.dart';
import 'package:invoice_app/presentation/features/company/widgets/section_item.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';



class CompanyDetails extends StatelessWidget {
  final ScrollController controller;
  const CompanyDetails(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CompanyCard(
                    showAction: false
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),

            // TabBar
            const TabBar(
              indicatorColor: KStyles.primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(text: "Infos Générales"),
                Tab(text: "Mouvements"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: padding,right: padding),
                    child: ListView(
                      children: [
                        const SizedBox(height: padding15),
                        SectionItem(icon: Iconsax.personalcard, title: "Identifiant Fiscal", value: AppServices.instance.currentCompany.value?.tin??""),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SectionItem(icon: Iconsax.barcode, title: "Registre de commerce", value: AppServices.instance.currentCompany.value?.tradeNo??""),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SectionItem(icon: Iconsax.shop, title: "Secteur", value: AppServices.instance.currentCompany.value?.sectors?.first.name??""),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SectionItem(icon: Iconsax.call, title: "Télephone", value: AppServices.instance.currentCompany.value?.contact?.phoneNumber??""),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SectionItem(icon: Iconsax.sms, title: "Email", value: AppServices.instance.currentCompany.value?.contact?.email??""),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SectionItem(icon: Iconsax.map, title: "Adresse", value: AppServices.instance.currentCompany.value?.address?.description??""),
                        const SizedBox(height: padding15),
                      ],
                    ),
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: KStyles.textSecondaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MovementItem(
                        description: "Agence cadjehoun ${index + 1}"
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

