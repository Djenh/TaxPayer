import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';
import 'package:invoice_app/features/stocks/product/category/components/category_list.dart';
import 'package:invoice_app/style/e_style.dart';

class CategorySeachPage extends StatelessWidget {
  const CategorySeachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: PADDING*2,vertical: PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catégorie",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height:PADDING,),
            KInput(name: "Search", suffixIcon: IconButton(
              onPressed: () {

              },
              icon: Icon(Iconsax.search_normal_1),
            ),),
            SizedBox(height:PADDING,),
            Expanded(child: KCategoryList())
          ],
        ),
      ),
    );
  }
}
