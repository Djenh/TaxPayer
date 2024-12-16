import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/assets/app_assets.dart';


class KDefaultLayout extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String subtitle;
  final Widget child;
  final bool isReversed;

  const KDefaultLayout({
    super.key,
    this.imagePath,
    this.isReversed = false,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = Container(
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        image: imagePath != null
            ? DecorationImage(image: AssetImage('$imagePath'), fit: BoxFit.fitHeight)
            : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.7),
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );

    final contentWidget = Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset($appAssets.imgs.imgLogoHeader),
                const SizedBox(height: 20),
                child,
              ],
            ),
          ],
        ),
      ),
    );

    return Row(
      children: isReversed
          ? [contentWidget, imageWidget]
          : [imageWidget, contentWidget],
    );
  }
}

