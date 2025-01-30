import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../_widgets/app_bar_custom.dart';
import '../../../res/style/e_style.dart';
import 'complaint_detail_page.dart';



class ComplaintSearchPage extends StatefulWidget {
  const ComplaintSearchPage({super.key});

  @override
  State<ComplaintSearchPage> createState() => _ComplaintSearchPageState();
}

class _ComplaintSearchPageState extends State<ComplaintSearchPage> {

  TextEditingController? searchController;



  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    searchController?.dispose();
  }


  Widget _buildInvoiceList(){
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int complaint){
          return GestureDetector(
            onTap: () => Get.to(() => ComplaintDetailPage()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("")),
                ],
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Rechercher une plainte"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Rechercher",
                suffixIcon: IconButton(
                  icon: const Icon(Iconsax.search_normal),
                  onPressed: () {

                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: KStyles.primaryColor,
                      width: 0.5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildInvoiceList(),
          )
        ],
      ),
    );
  }
}
