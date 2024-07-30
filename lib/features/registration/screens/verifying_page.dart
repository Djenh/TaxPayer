import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/widgets/k_default_layout.dart';
import 'package:invoice_app/commons/widgets/kinput.dart';
import 'package:invoice_app/features/home/screens/home_page.dart';

import '../../../commons/widgets/e_button.dart';
import '../../../style/e_style.dart';
import 'identiy_page.dart';

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
        subtitle:
        "Bonjour OMEGA NUMERIC IT",
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
                        child: TabBar(tabs: [
                          Tab(
                            text: "Téléphone",
                          ),
                          Tab(
                            text: "Email",
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: PADDING,
                      ),
                      Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start
                                        ,
                                        children: [
                                          Text(
                                              "Whatsapp", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold
                                          ),),
                                          SizedBox(
                                            height: PADDING/2,
                                          ),
                                          Text(
                                              "Un code vous a été envoyé",style: Theme.of(context).textTheme.bodySmall!.copyWith(

                                          ),),
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
                                              children:[
                                                Container(

                                                  height: MediaQuery.of(context).size.height/4,

                                                  child: ListView(
                                                    children: [
                                                      "SMS",
                                                      "Whatsapp"
                                                    ].map((e) => ListTile(
                                                      title: Text("$e"),

                                                      subtitle: Text("Les coûts supplementaires peuvent s'appliquer"),
                                                      onTap: (){

                                                      },
                                                      leading: CircleAvatar(),
                                                    )).toList(),
                                                  ),
                                                )
                                              ]
                                          ,
                                            );
                                          }, context: context,);
                                        },
                                        child: Text("Changer de canal")),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: PADDING,
                              ),
                              Row(
                                children: [
                                  Expanded(child: KInput(name: "")),
                                  SizedBox(
                                    width: PADDING / 2,
                                  ),
                                  Expanded(child: KInput(name: "")),
                                  SizedBox(
                                    width: PADDING / 2,
                                  ),
                                  Expanded(child: KInput(name: "")),
                                  SizedBox(
                                    width: PADDING / 2,
                                  ),
                                  Expanded(child: KInput(name: "")),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  TextButton(onPressed: () {

                                  }, child: Text("Renvoyer le code")),
                                  Text("00:90 "),
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
              onPressed: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage( ),
                      )),
            ),
            SizedBox(
              height: PADDING * 2,
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
