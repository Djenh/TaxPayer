import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../_widgets/app_bar_custom.dart';
import '../../../../../res/style/e_style.dart';
import '../components/category_list.dart';
import 'add_category_page.dart';
import 'category_search_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarOther(context, "Catégorie de produit",
          actionList: [
            IconButton(
                onPressed: () {
                  Get.to(() => const CategorySearchPage(isManage: true));
                }, icon: const Icon(Iconsax.search_normal)),
            IconButton(
                onPressed: () => Get.to(() => const AddCategoryPage()),
                icon: const Icon(CupertinoIcons.add_circled_solid,
                    color: KStyles.primaryColor, size: 32)
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: 8,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(
                height: 1, thickness: 1, color: Colors.grey.shade300),
          ),
          itemBuilder: (BuildContext context, int ctg){
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: KStyles.primaryColor.withOpacity(0.2),
                child: const Icon(Iconsax.building, color: KStyles.primaryColor),
              ),
              title: Text(
                "Catégorie $ctg",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Get.back(result: "Catégorie $ctg");
              },
            );
          },
        )
    );
  }

}
