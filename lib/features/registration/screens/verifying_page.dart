import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/layout/layout.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/features/home/screens/home_page.dart';

import '../../../style/e_style.dart';


class VerifyingPage extends StatelessWidget {
  VerifyingPage({super.key});

  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: KDefaultLayout(
        isReversed: false,
        title: 'Vérifier votre Identité  ',
        subtitle: "Bonjour OMEGA NUMERIC IT",
        imagePath: "assets/images/3.jpg",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        child: const TabBar(tabs: [
                          Tab(
                            text: "Téléphone",
                          ),
                          Tab(
                            text: "Email",
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: PADDING,
                      ),
                      SizedBox(
                        height: 220,
                        child: TabBarView(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Whatsapp",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: PADDING / 2,
                                      ),
                                      Text(
                                        "Un code vous a été envoyé",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(),
                                      ),
                                    ],
                                  )),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          showBottomSheet(
                                            enableDrag: true,
                                            elevation: 2,
                                            builder: (context) {
                                              return Wrap(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                    child: ListView(
                                                      children: [
                                                        "SMS",
                                                        "Whatsapp"
                                                      ]
                                                          .map((e) => ListTile(
                                                                title:
                                                                    Text(e),
                                                                subtitle: const Text(
                                                                    "Les coûts supplementaires peuvent s'appliquer"),
                                                                onTap: () {},
                                                                leading:
                                                                    const CircleAvatar(),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                            context: context,
                                          );
                                        },
                                        child: const Text("Changer de canal")),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: PADDING,
                              ),
                              Row(
                                children: [
                                  Expanded(child: KInput(name: "")),
                                  const SizedBox(
                                    width: PADDING / 2,
                                  ),
                                  Expanded(child: KInput(name: "")),
                                  const SizedBox(
                                    width: PADDING / 2,
                                  ),
                                  Expanded(child: KInput(name: "")),
                                  const SizedBox(
                                    width: PADDING / 2,
                                  ),
                                  Expanded(child: KInput(name: "")),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("Renvoyer le code")),
                                  const Text("00:90 "),
                                ],
                              )
                            ],
                          ),
                          Container()
                        ]),
                      )
                    ],
                  )),
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
                    builder: (context) => HomePage(),
                  )),
            ),
            const SizedBox(
              height: PADDING * 2,
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
