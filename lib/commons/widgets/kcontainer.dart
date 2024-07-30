import 'package:flutter/material.dart';

class KContainer extends StatelessWidget {
  late Widget child;
  final String? title;
  final Color? color;

  KContainer({super.key, required this.child, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
   /* //      color: color == null ? Colors.white : color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 0.5, blurRadius: 5)
          ]*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700),
                )
              : SizedBox.shrink(),
          Container(width: double.infinity, child: child)
        ],
      ),
    );
  }
}
