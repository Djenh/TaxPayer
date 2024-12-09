import 'package:flutter/material.dart';

class KOutlinedButton extends StatelessWidget {
  final Widget child;

  final VoidCallback onPressed;

  const KOutlinedButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 2, // button's elevation when it's pressed
        side: BorderSide( color: Theme.of(context).primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //minimumSize: Size(constraints.maxWidth, 50), // Make it responsive
        padding: const EdgeInsets.all( 10),
      ),
      child: child,
    );
  }
}
