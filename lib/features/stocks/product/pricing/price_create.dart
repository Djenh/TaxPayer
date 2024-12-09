import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';


import '../../../../style/e_style.dart';



class Price_create extends StatelessWidget {
  const Price_create({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: KInput(
                  name: "Min Qty",
                  keyboardType: TextInputType.number,
                  initialValue: '0',
                ),
              ),
              const SizedBox(
                width: PADDING,
              ),
              Expanded(
                child: KInput(
                  name: "Max Qty",
                ),
              ),
            ],
          ),
          const SizedBox(height: PADDING,),
          KInput(
            name: "Price ",
            keyboardType: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
