import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/features/dashoard/company/card_company_page.dart';
import 'package:invoice_app/presentation/features/dashoard/company/mouvement_item.dart';
import 'package:invoice_app/presentation/features/dashoard/company/section_item.dart';
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
                  ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: KStyles.textSecondaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const SectionItem(icon: Iconsax.personalcard, title: "Identifiant Fiscal", value: "97092099");
                    },
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

