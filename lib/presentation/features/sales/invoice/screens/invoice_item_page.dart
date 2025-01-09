import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/domain/entities/invoice/tax_group_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_page.dart';
import 'package:invoice_app/presentation/features/stocks/product/screens/product_search.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../../../../../domain/entities/product/product_response.dart';
import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/build_dropdown_str.dart';
import '../../../../_widgets/simple_btn.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';
import '../../../stocks/product/taxgroup/tax_group.dart';


/*class InvoiceItemPage extends StatelessWidget {
  const InvoiceItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Item Detail",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const KtextGray(
                    "Produuct",
                  ),
                  subtitle: const Text("Select a product",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_drop_down),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductCreatePage(),
                          fullscreenDialog: true
                        ));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: KInput(
                        name: "Quantity",
                        keyboardType: TextInputType.number,
                        initialValue: '0',
                      ),
                    ),
                    SizedBox(
                      width: 10 * 2.5,
                    ),
                    Expanded(
                      child: KInput(
                        name: "Price",
                        initialValue: '0',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Taxe Description",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text("Tax Group"),
                  trailing: const Icon(Icons.arrow_drop_down),
                  subtitle: const KtextGray("A-ex (0%) -EXONERATE"),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaxgroupPage(),
                            fullscreenDialog: true
                        ));
                  },
                ),
                const KInput(
                  name: "Additional Tax",
                  keyboardType: TextInputType.number,
                  initialValue: '0',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Subtotal",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KtextGray("Subtotal"),
                        Text("Qte: Z"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KtextGray("Total Amount"),
                Text(
                  "2000",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              width: 10 * 3,
            ),
            Expanded(
              child: KElevatedButton(
                  child: const Text(
                    "Add item",
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}*/


class InvoiceItemPage extends StatefulWidget {
  const InvoiceItemPage({super.key});

  @override
  State<InvoiceItemPage> createState() => _InvoiceItemPageState();
}


class _InvoiceItemPageState extends State<InvoiceItemPage> {


  ProductResponse? dataProductSelect;
  String hintProductSelect = "Selectionner";
  TextEditingController? qteController;
  TextEditingController? priceController;
  TaxGroupEntities? dataTaxGroup;
  String hintTypeTax = "Selectionner une taxe";
  TextEditingController? additionalTaxController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    additionalTaxController = TextEditingController();
    qteController = TextEditingController();
    priceController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    additionalTaxController?.dispose();
    qteController?.dispose();
    priceController?.dispose();
  }


  Widget padChild({required Widget child}){
    return Padding(
      padding: const EdgeInsets.all(4.0).copyWith(bottom: 15, top: 15),
      child: child,
    );
  }


  Widget _buildItemDetail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padChild(child: buildText(context, "Item Detail", 14, Colors.black,
            fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        BuildDropdownString(
            label: "Produit",
            hint: (dataProductSelect != null) ? dataProductSelect!.name! : hintProductSelect,
            items: const [],
            onTap: () async {
              await Get.to(() => const ProductPage(isManage: false),
                  fullscreenDialog: true)?.then((val){
                    if(val is ProductResponse){
                      setState(() {
                        dataProductSelect = val;
                      });
                    }
              });
            }
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: qteController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(labelText: "Quantité"),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: priceController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                inputFormatters: noSpaceNoEmoji,
                decoration: AppInputStyles.defaultInputDecoration(labelText: "Prix"),
              ),
            ),
          ],
        )
      ],
    );
  }


  Widget _buildAdditionalTax(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padChild(child: buildText(context, "Taxe description", 14, Colors.black,
            fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        BuildDropdownString(
            label: "Groupe de taxation",
            hint: (dataTaxGroup != null) ? dataTaxGroup!.name! : hintTypeTax,
            items: const [],
            onTap: () async {
              await Get.to(() => const TaxGroupPage(),
                  fullscreenDialog: true)?.then((val){
                  if(val is TaxGroupEntities){
                    setState(() {
                      dataTaxGroup = val;
                    });
                  }
              });
            }
        ),
        const SizedBox(height: 20),
        buildText(context, "Additional Taxe", 14, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: 10),
        TextFormField(
          controller: additionalTaxController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          inputFormatters: noSpaceNoEmoji,
          decoration: AppInputStyles.defaultInputDecoration(labelText: ""),
        )
      ],
    );
  }


  Widget _buildAmountContainer(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padChild(child: buildText(context, "Montant", 14, Colors.black,
            fontWeight: FontWeight.w600)),
        padChild(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Total Hors Taxes",
                  14, Colors.black, fontWeight: FontWeight.w300),
              buildText(context, "0", 14, Colors.black,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        padChild(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Total appliquées",
                  14, Colors.black, fontWeight: FontWeight.w300),
              buildText(context, "0", 14,
                  Colors.black, fontWeight: FontWeight.w600),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1),
        padChild(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(context, "Grand total",
                  14, Colors.black, fontWeight: FontWeight.w600),
              buildText(context, "0", 14, Colors.black,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Ajouter un item"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemDetail(),
            const SizedBox(height: 20),
            _buildAdditionalTax(),
            const SizedBox(height: 20),
           // _buildAmountContainer()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.all(12),
        color: KStyles.primaryColor.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Column(
              children: [
                buildText(context, "Total", 14, Colors.black, fontWeight: FontWeight.w400),
                const SizedBox(height: 10),
                buildText(context, "0 XOF", 14, Colors.black, fontWeight: FontWeight.bold),
              ],
            ),*/
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 + 50,
              child: SimpleBtn(
                    titleBtn: "Ajouter",
                    sizeFont: 12,
                    onPressed:(){})
            )
          ],
        ),
      ),
    );
  }


}
