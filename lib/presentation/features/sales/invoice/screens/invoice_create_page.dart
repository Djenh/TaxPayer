import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/build_dropdown_str.dart';
import '../../../../_widgets/simple_btn.dart';
import '../../../clients/screens/client_search_page.dart';
import '../security_tax/security_tax_page.dart';
import '../type_invoice/type_invoice_page.dart';
import 'invoice_item_page.dart';



/*class InvoiceCreatePage extends StatelessWidget {
  const InvoiceCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Facture"),
            Row(
              children: [
                const Text("12344"),
                const SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.copy,
                  size: 15,
                  color: Theme.of(context).primaryColor,
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Iconsax.document_download))
        ],
      ),
      body: ListView(
        children: [
          KContainer(
            title: "Invoice",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: KListTile(
                        title: "Type de facture",
                        subtitle: "Facture de vente",
                        onTap: () => Get.to(() => const TypeInvoicePage(),
                            fullscreenDialog: true),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0 * 4,
                    ),
                    Expanded(
                      child: KListTile(
                        title: "Secutrity tax",
                        subtitle: "20%",
                        onTap: () => Get.to(() => const SecurityTaxPage(),
                            fullscreenDialog: true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          KContainer(
            title: "Client",
            child: KListTile(
              title: "Facture adressée à",
              subtitle: "Client Divers",
              onTap: () =>
                  Get.to(() => ClientSearchPage(), fullscreenDialog: true),
            ),
          ),
          KContainer(
            title: "Contenu de la factture",
            action: TextButton(
              onPressed: ()=> Get.to( ()=>const InvoiceItemPage(), fullscreenDialog: true ),
              child: const Text("Ajouter"),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  const KInvoiceItem(),
                  const KInvoiceItem(),
                  const KInvoiceItem(),

                ]),

              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          KContainer(
            title: "Répartiton des taxes",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text(
                          "100.000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Text("Qte: Z"),
                      ],
                    ),
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: KElevatedButton(
                    onPressed: () {},
                    child: const KTextWhite(
                      "Create Invoice",
                    ))),
            const SizedBox(width: 5),
            KOutlinedButton(
              child: const Icon(Icons.more_horiz),
              onPressed: () {
                showMoreMenu(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: const DefaultMenu(),
          ),
        );
      },
    );
  }
}*/


class InvoiceCreatePage extends StatefulWidget {
  const InvoiceCreatePage({super.key});

  @override
  State<InvoiceCreatePage> createState() => _InvoiceCreatePageState();
}

class _InvoiceCreatePageState extends State<InvoiceCreatePage> {

  String typeInvoice = "Choisir facture";
  String typeTax = "Choisir...";
  String typeCustomer = "Choisir un client";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Widget _buildBtnAddInvoice(){
    return Container(
      height: 100,
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SimpleBtn(titleBtn: "Créer une facture", sizeFont: 14,
                  onPressed: (){}),
              ),
              const SizedBox(width: 16),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: KStyles.primaryColor),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // TODO: Action de l'icône
                    debugPrint("Bouton d'option cliqué");
                  },
                  icon: const Icon(Iconsax.more, color: KStyles.primaryColor,
                    size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  /// item produit/service facture
  final List<Map<String, dynamic>> _items = [
    {"title": "Exonéré", "subtitle": "Honoraire du consultants", "price": 2000, "quantity": 10},
    {"title": "Riz Gino", "subtitle": "Honoraire du consultants", "price": 5000, "quantity": 10},
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _items[index]["quantity"] += 1;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_items[index]["quantity"] > 1) {
        _items[index]["quantity"] -= 1;
      }
    });
  }


  Widget _buildProductRow({
    required int index,
    required String title,
    required String subtitle,
    required int price,
    required int quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(context, title, 14, Colors.black54,
             fontWeight: FontWeight.w400),
         Row(
           children: [
             Expanded(
               child: buildText(context, subtitle, 12, Colors.black,
                   fontWeight: FontWeight.w600, maxLine: 3),
             ),
             //const SizedBox(width: 8),
             Row(
               children: [
                 IconButton(
                   icon: const Icon(Icons.remove, size: 20),
                   onPressed: () => _decrementQuantity(index),
                 ),
                 Container(
                   width: 30,
                   height: 30,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey.shade400),
                     borderRadius: BorderRadius.circular(4),
                   ),
                   child: Text(
                     "$quantity",
                     style: const TextStyle(fontSize: 14),
                   ),
                 ),
                 IconButton(
                   icon: const Icon(Icons.add, size: 20),
                   onPressed: () => _incrementQuantity(index),
                 ),
               ],
             ),
             const SizedBox(width: 8),
             buildText(context, "${price * quantity} Fcfa", 12, Colors.black,
                fontWeight: FontWeight.w300),
             /*IconButton(
               icon: const Icon(Icons.more_horiz, color: Colors.black54),
               onPressed: () => _removeItem(index),
             ),*/
           ],
         )
        ],
      ),
    );
  }

  Widget _itemServiceProd(){
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (context, index) =>
        const Divider(thickness: 1, height: 1),
        itemBuilder: (context, index) {
          final item = _items[index];
          return _buildProductRow(
            index: index,
            title: item["title"],
            subtitle: item["subtitle"],
            price: item["price"],
            quantity: item["quantity"],
          );
        },
      ),
    );
  }

  Widget _noItems(){
    return Column(
      children: [
        Center(
          child: buildText(context, "Aucun item ne figure sur cette facture", 12,
              Colors.black, fontWeight: FontWeight.w300, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 10),
        SimpleBtn(titleBtn: "Ajouter un item", sizeFont: 12, onPressed:(){
          Get.to( ()=>const InvoiceItemPage(), fullscreenDialog: true );
        })
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Créer une facture", actionList: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Iconsax.document_download),
            )
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            buildText(context, "Facture", 14, Colors.black,
                 fontWeight: FontWeight.w600),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: BuildDropdownString(
                    label: "Type de facture",
                    hint: typeInvoice,
                    items: const [],
                    onTap: () async {
                      await Get.to(() => const TypeInvoicePage(),
                          fullscreenDialog: true)?.then((val){
                            setState(() {
                              typeInvoice = val;
                            });
                      });
                    }
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BuildDropdownString(
                    label: "Taxe de sécurité",
                    hint: typeTax,
                    items: const [],
                    onTap: () async {
                      await Get.to(() => const SecurityTaxPage(),
                          fullscreenDialog: true)?.then((val){
                            setState(() {
                              typeTax = val;
                            });
                      });
                    }
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            BuildDropdownString(
              label: "Client concerné",
              hint: typeCustomer,
              items: const [],
              onTap: () async {
                await Get.to(() => const ClientSearchPage(),
                    fullscreenDialog: true)?.then((val){
                      setState(() {
                        typeCustomer = val;
                      });
                });
              }
            ),
            const SizedBox(height: 40),
            buildText(context, "Items de la facture", 14, Colors.black,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 20),
            //_noItems(),
            _itemServiceProd(),
            const SizedBox(height: 40),
            buildText(context, "Détails de la facture", 14, Colors.black,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                  bottom: 15, top: 15
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(context, "Total Hors Taxes (Total HT)",
                      14, Colors.black, fontWeight: FontWeight.w300),
                  buildText(context, "00 Fcfa", 14, Colors.black,
                      fontWeight: FontWeight.w300),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                bottom: 15, top: 15
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(context, "Total appliquées",
                      14, Colors.black, fontWeight: FontWeight.w300),
                  buildText(context, "00 Fcfa", 14,
                      Colors.black, fontWeight: FontWeight.w300),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText(context, "Grand total",
                    14, Colors.black, fontWeight: FontWeight.w600),
                buildText(context, "00 Fcfa", 14, Colors.black,
                    fontWeight: FontWeight.w300),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBtnAddInvoice(),
    );
  }
}
