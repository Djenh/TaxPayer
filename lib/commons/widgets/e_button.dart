import 'package:flutter/material.dart';

class EButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const EButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(15),

      ),
    );
  }
}
