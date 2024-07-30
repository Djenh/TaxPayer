import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/widgets/k_default_layout.dart';
import 'package:invoice_app/commons/widgets/kelevatedbutton.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';
import 'package:invoice_app/features/home/screens/home_page.dart';
import 'package:invoice_app/style/e_style.dart';

import '../../../commons/widgets/e_button.dart';

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
                SizedBox(height: PADDING*2,
                ),
                KInput(name: "Point de vente",
                  prefixIcon: Icon(Iconsax.buliding),

                ),
                SizedBox(height: PADDING,
                ),
                KInput(name: "Téléphone",
                  prefixIcon: Icon(Iconsax.call),
                ),
                SizedBox(height: PADDING,),
                KInput(name: "Email",
                  prefixIcon: Icon(Iconsax.message),
                ),
                SizedBox(height: PADDING,),
                KInput(name: "Localisation",
                  prefixIcon: Icon(Iconsax.location),
                ),
                SizedBox(height: PADDING*2,),

                Row(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EButton(
                      child: Row(
                        children: [
                          Icon(Iconsax.check),
                          SizedBox(
                            width: PADDING,
                          ),
                          Text(
                            "Terminer".toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
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
