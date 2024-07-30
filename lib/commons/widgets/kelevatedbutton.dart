import 'package:flutter/material.dart';

class KElevatedButton extends StatelessWidget {
  final Widget child;

  final VoidCallback onPressed;

  KElevatedButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        elevation: 2, // button's elevation when it's pressed
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        textStyle: TextStyle(  fontSize: 16),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        //minimumSize: Size(constraints.maxWidth, 50), // Make it responsive
      //  padding: EdgeInsets.all( 10),
      ),
    );
  }
}
