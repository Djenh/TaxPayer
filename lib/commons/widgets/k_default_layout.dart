import 'package:flutter/material.dart';

import '../../style/e_style.dart';
import 'k_flag_banner.dart';
import 'logo.dart';

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
          padding: EdgeInsets.all(PADDING * 3),
          child: Container(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Logo(),
                    SizedBox(
                      height: PADDING * 2,
                    ),
                    Text(
                      "$title",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: PADDING,
                    ),
                    Text(
                      "$subtitle",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                    SizedBox(
                      height: PADDING * 2,
                    ),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3,
                        child: FlagBanner()),
                    SizedBox(
                      height: PADDING * 2,
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
