import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../style/e_style.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: PADDING*7,
      width: PADDING*7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(PADDING*1.5),
        border:
        Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),

      child: Center(
        child: Icon(Iconsax.wallet_3, size: 40,),
      ),
    );
  }
}
