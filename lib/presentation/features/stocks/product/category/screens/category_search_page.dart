import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../../_widgets/app_bar_custom.dart';


/*class CategorySeachPage extends StatelessWidget {
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
}*/

class CategorySearchPage extends StatefulWidget {
  const CategorySearchPage({super.key, required this.isManage});

  final bool isManage;

  @override
  State<CategorySearchPage> createState() => _CategorySearchPageState();
}

class _CategorySearchPageState extends State<CategorySearchPage> {

  TextEditingController? searchController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController?.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, widget.isManage
          ? "Rechercher une categorie"
          : "Choisir une catégorie"
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: widget.isManage ? "Recherhcer": "Rechercher categorie",
                //prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Iconsax.search_normal),
                  onPressed: () {
                    // TODO: Implémenter la recherche
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
            child: ListView.separated(
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
                    if(!widget.isManage){
                      Get.back(result: "Catégorie $ctg");
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }


}
