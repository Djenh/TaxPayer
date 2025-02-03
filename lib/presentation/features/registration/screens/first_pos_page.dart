import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../home/screens/home_page.dart';



class FirstPosPage extends StatelessWidget {
  const FirstPosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: KDefaultLayout(
          title: "Félicitations 👏🏾👏🏾",
          subtitle: "OMEGA NUMERIC IT, pour bénéficier du système, vous devez définir une activité, service, magasin ou autre ",
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ajout d'un point vente / service", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,

                ),),
                const SizedBox(height: padding*2,
                ),
                const KInput(name: "Point de vente",
                  prefixIcon: Icon(Iconsax.buliding),

                ),
                const SizedBox(height: padding,
                ),
                const KInput(name: "Téléphone",
                  prefixIcon: Icon(Iconsax.call),
                ),
                const SizedBox(height: padding,),
                const KInput(name: "Email",
                  prefixIcon: Icon(Iconsax.message),
                ),
                const SizedBox(height: padding,),
                const KInput(name: "Localisation",
                  prefixIcon: Icon(Iconsax.location),
                ),
                const SizedBox(height: padding*2,),

                Row(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KButton(
                      child: Row(
                        children: [
                          const Icon(Iconsax.check),
                          const SizedBox(
                            width: padding,
                          ),
                          Text(
                            "Terminer".toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                    ),
                  ],
                ),

              ],
            ),
          ),
    ));
  }
}
