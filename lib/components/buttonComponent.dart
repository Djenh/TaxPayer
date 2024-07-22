import 'package:flutter/material.dart';

import '../themes/theme.dart';

class ButtonComponent extends StatelessWidget {
  String? labelButton;
  ButtonComponent({super.key, required this.labelButton,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: Text('$labelButton',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white
          ),
        ),
      )
    );
  }
}
