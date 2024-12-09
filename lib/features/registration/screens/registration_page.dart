import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/commons/ui/ui.dart';

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
            const Text(
              "Identifiant Fiscal Unique",
            ),
            const SizedBox(
              height: PADDING * 2,
            ),
            KInput(name: "IFU"),
            const SizedBox(
              height: PADDING * 2,
            ),

            KButton(
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.check),
                    const SizedBox(
                      width: PADDING,
                    ),
                    Text(
                      "Verifier".toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IdentityPage(),
                  )),
            ),

            const SizedBox(
              height: PADDING*2,
            ),
            const Text(
              "En utilisant cette application, vous acceptez les conditions d'utilisation",
            ),
          ],
        ),
      ),
    );
  }
}
