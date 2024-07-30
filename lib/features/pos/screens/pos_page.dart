import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/features/pos/screens/pos_detail.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Points de vente"),

      ),
      body: ListView.builder(itemBuilder: (context, index) => ListTile(
        onTap: (){

          Get.to(()=>PosDetail());
        },
        leading: CircleAvatar(child: Icon(Iconsax.building_3)),
        title: Text("Erevan Akpkpa"),
        subtitle: Text("Cotonou - PTT "),
        trailing: Icon(Iconsax.arrow_right_3),

      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Iconsax.add),
      ),
    );
  }
}


