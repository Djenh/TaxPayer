import 'package:flutter/material.dart';

class FlagBanner extends StatelessWidget {
  const FlagBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        ),

        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(color: Colors.black45),
          ),
        ),
        Expanded(
          child: Container(
            height: 7,
            decoration: BoxDecoration(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
