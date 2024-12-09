import 'package:flutter/material.dart';

class KInput extends StatelessWidget {
  final String? name;
  final TextInputType? keyboardType;
  final bool showclearButton;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final dynamic initialValue;

  const KInput(
      {super.key,
      required this.name,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      this.showclearButton = false,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(fontWeight: FontWeight.w600),

      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,

      //  contentPadding: EdgeInsets.zero,
          label: Text("$name"),
       //   filled: true,
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          ),
          suffixIcon: showclearButton ? const Icon(Icons.close) : suffixIcon),
    );
  }
}
