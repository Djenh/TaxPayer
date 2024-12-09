import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../style/e_style.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(

                color: Colors.white
            ),
            child: SvgPicture.asset("assets/images/armoiries.svg", width: 60, height: 60,),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gabon 🇬🇦",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5,),
                const Text("Système Intégré de Facturation Electronique Certifiée")
              ],
            ),
          )
        ],
      ),
    );
  }
}

