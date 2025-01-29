import 'package:flutter/material.dart';

class MovementItem extends StatelessWidget {
  final String description;
  const MovementItem({super.key,required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(description, style: const TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w500)),
    );
  }
}