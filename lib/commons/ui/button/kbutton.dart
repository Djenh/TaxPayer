import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const KButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(15),

      ),
      child: child,
    );
  }
}
