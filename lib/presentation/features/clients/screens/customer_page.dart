import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../_widgets/app_bar_custom.dart';
import '../../../_widgets/build_text.dart';
import '../../../res/style/e_style.dart';
import 'add_customer_page.dart';
import 'client_detail_page.dart';


class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOther(context, "Clients",
          actionList: [
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
            IconButton(
                onPressed: () => Get.to(() => const AddCustomerPage()),
                icon: const Icon(CupertinoIcons.add_circled_solid,
                    color: KStyles.primaryColor, size: 32)
            ),
          ],
      ),
      body: ListView.separated(
        itemCount: 8,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
              height: 1, thickness: 1),
        ),
        itemBuilder: (BuildContext context, int cus){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Get.to(() => const ClientDetailPage());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(context, "Ola Soft Company", 14, Colors.black,
                      fontWeight: FontWeight.w500),
                  const SizedBox(height: 6),
                  buildText(context, "IFU : 24987940022", 12, Colors.grey,
                      fontWeight: FontWeight.w400),
                  const SizedBox(height: 6),
                  buildText(context, "Ilot 357-6889", 12, Colors.grey,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
