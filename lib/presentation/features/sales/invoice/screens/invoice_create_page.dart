import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../clients/screens/client_search_page.dart';
import '../security_tax/security_tax_page.dart';
import '../type_invoice/type_invoice_page.dart';



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



  Widget _buildDropdown({
    required String label,
    required String hint,
    required List<String> items,
    required Function()? onTap
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(context, label, 12, Colors.grey, fontWeight: FontWeight.w400),
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            child: DropdownButtonFormField<String>(
              hint: buildText(context, hint, 12, Colors.black54,
                  fontWeight: FontWeight.w600),
              isExpanded: true,
              decoration: AppInputStyles.dropDownInputDecoration(),
              value: null,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: buildText(context, value, 12, Colors.black54),
                );
              }).toList(),
              onChanged: (String? value) {
                // TODO : Ajouter la logique pour la sélection
              },
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey, size: 32),
            ),
          ),
        ),
      ],
    );
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
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Action du bouton
                    debugPrint("Créer une facture");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KStyles.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                  child: buildText(context, "Créer une facture",
                      16, Colors.white, fontWeight: FontWeight.w500),
                ),
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
                  child: _buildDropdown(
                    label: "Type de facture",
                    hint: typeInvoice,
                    items: [],
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
                  child: _buildDropdown(
                    label: "Taxe de sécurité",
                    hint: typeTax,
                    items: [],
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
            _buildDropdown(
              label: "Client concerné",
              hint: typeCustomer,
              items: [],
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
            buildText(context, "Produit/Service de la facture", 14, Colors.black,
                fontWeight: FontWeight.w600),
            const SizedBox(height: 20),
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
