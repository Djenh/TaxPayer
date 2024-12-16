import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


import '../../../_widgets/app_bar_custom.dart';



class ClientSearchPage extends StatefulWidget {
  const ClientSearchPage({super.key});

  @override
  State<ClientSearchPage> createState() => _ClientSearchPageState();
}


class _ClientSearchPageState extends State<ClientSearchPage> {


  TextEditingController? searchController;
  final List<Map<String, String>> clients = const [
    {"id": "+229 0166789007", "name": "Byte Innov IT", "type": "Entreprise"},
    {"id": "+229 0162346312", "name": "Clients Divers", "type": "Particulier"},
    {"id": "+229 0151234890", "name": "Byte Innov IT", "type": "Entreprise"},
    {"id": "+229 01970104030", "name": "Clients Divers", "type": "Particulier"},
    {"id": "+229 0166789007", "name": "Byte Innov IT", "type": "Entreprise"},
    {"id": "+229 01970104030", "name": "Clients Divers", "type": "Particulier"},
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarOther(context, "Sélectionner un client"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Rechercher client",
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
              itemCount: clients.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(
                  height: 1, thickness: 1),
              ),
              itemBuilder: (BuildContext context, int cst){
                final customer = clients[cst];
                return ListTile(
                  leading: const Icon(Iconsax.courthouse, color: Colors.black54),
                  title: Text(
                    customer["id"]!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  subtitle: Text(
                    customer["name"]!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: KStyles.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      customer["type"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: KStyles.primaryColor,
                      ),
                    ),
                  ),
                  onTap: () {
                    // TODO: Implémenter la logique de sélection
                    debugPrint("Client sélectionné : ${customer['name']}");
                    Get.back(result: "${customer['name']}");
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
