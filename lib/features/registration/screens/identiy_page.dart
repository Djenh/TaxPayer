
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/widgets/k_default_layout.dart';
import 'package:invoice_app/commons/widgets/logo.dart';
import 'package:invoice_app/features/registration/screens/verifying_page.dart';

import '../../../commons/widgets/e_button.dart';
import '../../../commons/widgets/k_flag_banner.dart';
import '../../../style/e_style.dart';
import 'first_pos_page.dart';


class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      extendBodyBehindAppBar: true,
      body:  KDefaultLayout(
        title: 'Votre Identité Fiscale',
        subtitle: 'Sur la base, des données fournies par la Direction Générale des Impôts ',
        imagePath: "assets/images/3.jpg",
        isReversed: true,
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("IFU"),
                          Text("1234567890123",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: PADDING / 2,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Raison sociale"),
                          Text("OMEGA NUMERIC IT",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: PADDING / 2,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Type"),
                          Text("SOCIETE",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: PADDING / 2,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email"),
                          Text("con**@omeganumeric.tech",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: PADDING / 2,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Téléphone"),
                          Text("67 ** ** 90",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Iconsax.user,
                  size: 60,
                  color: Colors.black45,
                )
              ],
            ),
            SizedBox(
              height: PADDING * 2,
            ),
            Row(
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
                        builder: (context) => VerifyingPage(),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
