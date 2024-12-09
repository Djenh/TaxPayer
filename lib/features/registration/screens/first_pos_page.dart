import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/features/home/screens/home_page.dart';
import 'package:invoice_app/style/e_style.dart';



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
                const SizedBox(height: PADDING*2,
                ),
                KInput(name: "Point de vente",
                  prefixIcon: const Icon(Iconsax.buliding),

                ),
                const SizedBox(height: PADDING,
                ),
                KInput(name: "Téléphone",
                  prefixIcon: const Icon(Iconsax.call),
                ),
                const SizedBox(height: PADDING,),
                KInput(name: "Email",
                  prefixIcon: const Icon(Iconsax.message),
                ),
                const SizedBox(height: PADDING,),
                KInput(name: "Localisation",
                  prefixIcon: const Icon(Iconsax.location),
                ),
                const SizedBox(height: PADDING*2,),

                Row(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KButton(
                      child: Row(
                        children: [
                          const Icon(Iconsax.check),
                          const SizedBox(
                            width: PADDING,
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
