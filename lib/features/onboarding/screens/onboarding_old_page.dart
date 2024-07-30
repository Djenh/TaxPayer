/*
import 'package:e_voting/commons/e_button.dart';
import 'package:e_voting/commons/logo.dart';
import 'package:e_voting/features/registration/screens/registration_page.dart';
import 'package:e_voting/style/e_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  extendBodyBehindAppBar: true,

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/2.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.56,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    gradient: FLAG_GRADIENT),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 7,
                    decoration: BoxDecoration(color: Color(0XFF0E6258)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 7,
                    decoration: BoxDecoration(color: Color(0XFFFFBE00)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 7,
                    decoration: BoxDecoration(color: Color(0XFFEB0000)),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              color: Colors.white.withOpacity(0.95),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Logo(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Le vote est un devoir".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Chaque citoyen·ne a le devoir de prendre part à la vie politique en général.",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.how_to_vote,
                            size: 70, color: Color(0XFF0E6258))
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: EButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage(),));

        }, child: Text("CONTINUER AVEC SON NPI"),),
      ),
    );
  }
}
*/
