import 'package:flutter/material.dart';

class KContainer extends StatelessWidget {
  final Widget child;
  final Widget? action;
  final String? title;
  final Color? color;

  KContainer({super.key, required this.child,    this.title, this.color, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
   /* //      color: color == null ? Colors.white : color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 0.5, blurRadius: 5)
          ]*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           if (title != null) Text(
             title ?? "",
             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                 color: Theme.of(context).primaryColor,
                 fontWeight: FontWeight.w700),
           ) else const SizedBox.shrink(),
           if (action!= null) SizedBox(child: action,) else const SizedBox.shrink(),
         ],),
          SizedBox(width: double.infinity, child: child)
        ],
      ),
    );
  }
}
