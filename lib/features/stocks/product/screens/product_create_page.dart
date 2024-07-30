import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/features/stocks/product/category/screens/category_search_page.dart';
import 'package:invoice_app/style/e_style.dart';

import '../../../../commons/widgets/kelevatedbutton.dart';
import '../../../../commons/widgets/kinput.dart';

class ProductCreatePage extends StatelessWidget {
  ProductCreatePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Creation"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: PADDING * 2, vertical: PADDING),
        child: Form(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.width / 2,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFFEEEEEE),
                    borderRadius: BorderRadius.circular(PADDING),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(

                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Iconsax.trash,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.image),
                          SizedBox(
                            height: PADDING,
                          ),
                          Text("Ajouter une image"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: PADDING,
              ),
              Text(
                "Désignation",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: PADDING,
              ),
              KInput(
                name: "Name ",
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Iconsax.menu_board),
              ),
              SizedBox(
                height: PADDING,
              ),
              Text(
                "Unité de mesure",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: PADDING,
              ),
              KInput(
                name: "Unité de mesure",
                keyboardType: TextInputType.number,
                initialValue: '0',
                prefixIcon: Icon(Iconsax.icon),
              ),
              SizedBox(
                height: PADDING,
              ),
              Text(
                "Catégorie",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: PADDING,
              ),
              Container(
                padding: EdgeInsets.all(PADDING),
                decoration: BoxDecoration(
                  border: Border.all( color: Theme.of(context).unselectedWidgetColor),
                  borderRadius: BorderRadius.circular(PADDING)
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Iconsax.import_2),
                  title: Text(
                    "Non défini",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Sélectionner une categorie"),
                  trailing: Icon(Iconsax.arrow_down_14),
                  onTap: () {
                    Get.to(() => CategorySeachPage(), fullscreenDialog: true);
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: KElevatedButton(
          child: Text(
            "Ajouter",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
    ;
  }
}
