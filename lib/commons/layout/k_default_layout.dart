import 'package:flutter/material.dart';

import '../../style/e_style.dart';

import '../ui/logo.dart';

class KDefaultLayout extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String subtitle;
  final Widget child;
  final bool isReversed;

  const KDefaultLayout({super.key,
    this.imagePath,
    this.isReversed=false,
    required this.title,
    required this.subtitle,
    required this.child});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets= [
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 4,
        decoration: BoxDecoration(
          image: imagePath != null
              ? DecorationImage(
              image: AssetImage(
                '$imagePath',
              ),
              fit: BoxFit.fitHeight)
              : null,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(0.7),
              Colors.black.withOpacity(0.7),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10 * 3),
          child: Container(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Logo(),
                    
                    const SizedBox(
                      height: 10 * 2,
                    ),
                    child ?? Container()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ];
    return Row(
      children: isReversed? widgets.reversed.toList():widgets,
    );

  }

}
