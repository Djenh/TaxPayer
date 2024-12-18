import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/_widgets/simple_btn.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_create_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';


/*class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding),
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.only(bottom: padding), child: ProductItem(
            onTap:  () {
              Get.to(() => const ProductDetailPage());
            },
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Iconsax.add),
        onPressed: () => Get.to(() => const ProductCreatePage()),
      ),
    );
  }
}*/


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  TextEditingController? searchController;
  final List<Map<String, String>> productList = const [
    {"type": "Biens/marchandises", "name": "Lait Javo", "desc": "Produit Laitier", "stk": "Disponible en stocks"},
    {"type": "Services", "name": "Honnoraire Cours SPCT", "desc": "Cours universitaire", "stk": ""},
    {"type": "Biens/marchandises", "name": "Lait Javo", "desc": "Produit Laitier", "stk": "Disponible en stocks"},
    {"type": "Services", "name": "Honnoraire Cours SPCT", "desc": "Cours universitaire", "stk": ""},
    {"type": "Biens/marchandises", "name": "Lait Javo", "desc": "Produit Laitier", "stk": "Disponible en stocks"},
    {"type": "Services", "name": "Honnoraire Cours SPCT", "desc": "Cours universitaire", "stk": ""},
  ];



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


  Widget _buildProductList() {
    return ListView.separated(
      itemCount: productList.length,
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Divider(
            height: 1, thickness: 1),
      ),
      itemBuilder: (BuildContext context, int prd){
        final prod = productList[prd];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              Get.back(result: prod["name"]);
              //Get.to(() => const ProductDetailPage());
            },
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 110,
                        width: 90,
                        decoration: BoxDecoration(
                            color: KStyles.textLightColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(padding)),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: KStyles.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: buildText(context, prod["type"]!, 10,
                                KStyles.primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 4),
                          buildText(context, prod["name"]!, 14,
                              Colors.black, fontWeight: FontWeight.w600),
                          const SizedBox(height: 6),
                          buildText(context, prod["desc"]!, 14,
                              Colors.grey, fontWeight: FontWeight.w400),
                          const SizedBox(height: 4),
                          buildText(context, prod["stk"]!, 14,
                              Colors.grey, fontWeight: FontWeight.w400)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: padding),
                const Column(
                  children: [
                    Icon(Iconsax.box, color: Colors.grey),
                    SizedBox(height: padding),
                    Text("9/20"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _noItem(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Iconsax.document_text, color: KStyles.icColors, size: 64),
        const SizedBox(height: 10),
        buildText(context, "Aucun résultat", 18, Colors.black,
            fontWeight: FontWeight.w400),
        const SizedBox(height: 10),
        buildText(context, "Il n'existe aucun produit portant ce nom.",
            12, Colors.black, fontWeight: FontWeight.w300,
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width/2+50,
          child: SimpleBtn(
            titleBtn: "Créer un produit",
            sizeFont: 14,
            onPressed: () async {
              await Get.to(() => const ProductCreatePage(),
                  fullscreenDialog: true);
            },
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Sélectionner un produit"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Rechercher produit",
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
            //child: _noItem(),
            child: _buildProductList(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: KStyles.primaryColor,
        child: const Icon(Iconsax.add, color: Colors.white),
        onPressed: () async {
          await Get.to(() => const ProductCreatePage(),
              fullscreenDialog: true);
        },
      ),
    );
  }


}
