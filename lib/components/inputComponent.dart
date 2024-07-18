import 'package:flutter/material.dart';
import '../themes/theme.dart';

class InputComponent extends StatelessWidget {
  String? label;
  var a;
  InputComponent({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(
            "$label",
            style: TextStyle(
              color: greyColor,
              fontSize: 18
            ),
          ),
        ),
        onSaved: (data) {
          a = data;
        },
        validator: (value) {
          if(value == null || value.isEmpty){
            return 'Remplissez le champs';
          }
        },
      ),
    );
  }
}
