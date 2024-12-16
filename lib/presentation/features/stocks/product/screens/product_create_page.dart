import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../category/screens/category_search_page.dart';



class ProductCreatePage extends StatelessWidget {
  const ProductCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Creation"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding),
        child: Form(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.width / 2,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0XFFEEEEEE),
                    borderRadius: BorderRadius.circular(padding),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(

                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Iconsax.trash,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.image),
                          SizedBox(
                            height: padding,
                          ),
                          Text("Ajouter une image"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: padding,
              ),
              Text(
                "Désignation",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: padding,
              ),
              const KInput(
                name: "Name ",
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Iconsax.menu_board),
              ),
              const SizedBox(
                height: padding,
              ),
              Text(
                "Unité de mesure",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: padding,
              ),
              const KInput(
                name: "Unité de mesure",
                keyboardType: TextInputType.number,
                initialValue: '0',
                prefixIcon: Icon(Iconsax.icon),
              ),
              const SizedBox(
                height: padding,
              ),
              Text(
                "Catégorie",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: padding,
              ),
              Container(
                padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  border: Border.all( color: Theme.of(context).unselectedWidgetColor),
                  borderRadius: BorderRadius.circular(padding)
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Iconsax.import_2),
                  title: const Text(
                    "Non défini",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Sélectionner une categorie"),
                  trailing: const Icon(Iconsax.arrow_down_14),
                  onTap: () {
                    Get.to(() => const CategorySeachPage(), fullscreenDialog: true);
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
          child: const Text(
            "Ajouter",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
