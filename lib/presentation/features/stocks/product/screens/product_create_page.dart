import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';
import '../../../../_widgets/simple_btn.dart';
import '../../../../res/app_input_styles.dart';
import '../../../../res/input_formaters.dart';
import '../category/screens/category_page.dart';
import '../category/screens/category_search_page.dart';


/*class ProductCreatePage extends StatelessWidget {
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
}*/

class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key});

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  bool goods = false;
  bool services = false;
  TextEditingController? codeController;
  TextEditingController? nameProdController;
  TextEditingController? ctgController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameProdController = TextEditingController();
    ctgController = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    codeController?.dispose();
    nameProdController?.dispose();
    ctgController?.dispose();
  }



  /// Fonction pour sélectionner une image
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  /// Fonction pour supprimer l'image avec animation
  void _deleteImage() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _selectedImage = null;
      });
    });
  }


  Widget _buildSelectionCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? KStyles.primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? KStyles.primaryColor : Colors.grey,
              size: 18,
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(context, title, 14,
                    isSelected ? KStyles.primaryColor : Colors.black,
                    fontWeight: FontWeight.w500),
                const SizedBox(height: 4),
                buildText(context, subtitle, 12,
                    isSelected ? KStyles.primaryColor : Colors.black,
                    fontWeight: FontWeight.w300),
              ],
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Créer un produit"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _selectedImage == null
                      ? GestureDetector(
                    onTap: _pickImage,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.gallery_add, size: 40,
                            color: Colors.black),
                        const SizedBox(height: 8),
                        buildText(context, "Ajouter une image du produit",
                            14, Colors.black, fontWeight: FontWeight.w400),
                      ],
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                if (_selectedImage != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.red.shade100,
                      radius: 18,
                      child: IconButton(
                        icon: const Icon(Iconsax.trash,
                            color: Colors.red, size: 18),
                        onPressed: _deleteImage,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildSelectionCard(
                    title: "Biens",
                    subtitle: "Les tangibles",
                    isSelected: goods,
                    onTap: () {
                      setState(() {
                        goods = !goods;
                        services = false;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSelectionCard(
                    title: "Services",
                    subtitle: "Les immatériels",
                    isSelected: services,
                    onTap: () {
                      setState(() {
                        services = !services;
                        goods = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: codeController,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              inputFormatters: noSpaceNoEmoji,
              decoration: AppInputStyles.defaultInputDecoration(
                labelText: "Code",
                prefixIcon: const Icon(Iconsax.note_2)
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameProdController,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              inputFormatters: noSpaceNoEmoji,
              decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "Nom",
                  prefixIcon: const Icon(Iconsax.clipboard)
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ctgController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              inputFormatters: noSpaceNoEmoji,
              onTap: () async {
                await Get.to(() => const CategoryPage())?.then((val){
                      setState(() {
                        ctgController?.text = val;
                      });
                });
              },
              decoration: AppInputStyles.defaultInputDecoration(
                  labelText: "Categorie",
                  hintText: "Selectionner une catégorie",
                  prefixIcon: const Icon(Iconsax.category_2),
                  suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 42)
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        color: KStyles.primaryColor.withOpacity(0.2),
        child: SimpleBtn(
            titleBtn: "Ajouter",
            sizeFont: 16,
            onPressed:(){}),
      ),
    );
  }


}
