import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../../commons/ui/kinput.dart';
import '../components/category_list.dart';


class CategorySeachPage extends StatelessWidget {
  const CategorySeachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: padding*2,vertical: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catégorie",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height:padding,),
            KInput(name: "Search", suffixIcon: IconButton(
              onPressed: () {

              },
              icon: const Icon(Iconsax.search_normal_1),
            ),),
            const SizedBox(height:padding,),
            const Expanded(child: KCategoryList())
          ],
        ),
      ),
    );
  }
}
