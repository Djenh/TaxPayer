import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../screens/invoice_create_page.dart';
import '../screens/invoice_detail_page.dart';
import 'invoice_item.dart';


class InvoiceList extends StatefulWidget {
  const InvoiceList({super.key});

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {

  final List<String> filters = ["factures de ventes", "factures d’avoir", "payées"];
  int selectedFilter = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Chip(
          label: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected ? Colors.white : Colors.black54,
                fontSize: 12, fontWeight: FontWeight.w400
            ),
          ),
          backgroundColor: isSelected ? KStyles.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: isSelected ? KStyles.primaryColor : Colors.grey),
          ),
        ),
      ),
    );
  }


  Widget itemList(){
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int inv){
          return InvoiceItem(
            onTap: () => Get.to(() => const InvoiceDetailPage()),
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarHome(context, "Les Factures",
          actionList: [
          IconButton(
              onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          IconButton(
              onPressed: () => Get.to(() => const InvoiceCreatePage()),
              icon: const Icon(CupertinoIcons.add_circled_solid,
                  color: KStyles.primaryColor, size: 32)
          ),
        ],
          bottomWidget: const TabBar(
            indicatorColor: KStyles.primaryColor,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Ventes"),
              Tab(text: "Achats"),
            ],
          )
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final String filter = entry.value;

                  return _buildFilterChip(
                    filter,
                    selectedFilter == index,
                    () {
                      setState(() {
                        selectedFilter = index;
                      });
                      // TODO : Ajouter l'action pour filtrer les données
                      debugPrint("Filtre sélectionné : Index $index, Valeur $filter");
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: itemList(),
            )
          ],
        ),
      )
    );
  }
}
