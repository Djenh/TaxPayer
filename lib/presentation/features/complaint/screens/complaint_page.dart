import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/paged_first_error.dart';
import 'package:invoice_app/presentation/_widgets/paged_new_page_error.dart';
import 'package:invoice_app/presentation/controllers/invoice_ctrl.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../_widgets/app_bar_custom.dart';
import 'complaint_create_page.dart';
import 'complaint_search_page.dart';


class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {

  // final complaintCtr = locator<ComplaintCtrl>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarHome(context, "Plaintes",
          actionList: [
            IconButton(
                onPressed: () {
                  Get.to(() => const ComplaintSearchPage());
                }, icon: const Icon(Iconsax.search_normal)),
            IconButton(
                onPressed: () => Get.to(() => const ComplaintCreatePage()),
                icon: const Icon(CupertinoIcons.add_circled_solid,
                    color: KStyles.primaryColor, size: 32)
            ),
          ],
            bgColor: Colors.white
        ),
      body: RefreshIndicator(
        onRefresh: ()=> Future.sync(() => []),
        child: Container(),
      ),
    );
  }

}
