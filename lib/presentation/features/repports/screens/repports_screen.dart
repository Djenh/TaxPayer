import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/features/repports/screens/repports_contente.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class RepportPage extends StatelessWidget {
  RepportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            "Rapports",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: padding,right: padding,top: padding),
        child: RepportsContente(),
      ),
    );
  }
}


