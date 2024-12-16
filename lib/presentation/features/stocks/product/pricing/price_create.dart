import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';





class PriceCreate extends StatelessWidget {
  const PriceCreate({super.key});


  @override
  Widget build(BuildContext context) {
    return const Form(
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
              SizedBox(
                width: padding,
              ),
              Expanded(
                child: KInput(
                  name: "Max Qty",
                ),
              ),
            ],
          ),
          SizedBox(height: padding,),
          KInput(
            name: "Price ",
            keyboardType: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
