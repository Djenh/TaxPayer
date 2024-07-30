import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/widgets/k_default_layout.dart';
import 'package:invoice_app/commons/widgets/k_flag_banner.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';
import 'package:invoice_app/commons/widgets/logo.dart';

import '../../../commons/widgets/e_button.dart';
import '../../../style/e_style.dart';
import 'identiy_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body:  KDefaultLayout(
        isReversed: false,
        title: 'Vérifier votre Identité fiscale',
        subtitle: "Vos données seront vérifiées à partie de votre identité fiscale",
        imagePath: "assets/images/3.jpg",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Identifiant Fiscal Unique",
            ),
            SizedBox(
              height: PADDING * 2,
            ),
            KInput(name: "IFU"),
            SizedBox(
              height: PADDING * 2,
            ),

            EButton(
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.check),
                    SizedBox(
                      width: PADDING,
                    ),
                    Text(
                      "Verifier".toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdentityPage(),
                  )),
            ),

            SizedBox(
              height: PADDING*2,
            ),
            Text(
              "En utilisant cette application, vous acceptez les conditions d'utilisation",
            ),
          ],
        ),
      ),
    );
  }
}
