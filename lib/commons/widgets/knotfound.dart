import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kcontainer.dart';

class KnotFound extends StatelessWidget {

  final Widget child;

  KnotFound({super.key,  required this.child});

  @override
  Widget build(BuildContext context) {
    return KContainer(
      child: Column(
        children: [
          Icon(Icons.receipt_long_outlined,
              color: Theme.of(context).primaryColor, size: 60),
          SizedBox(
            height: 10,
          ),
          Text(
            "Not found",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "we can't found any items matching your search",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).dividerColor

            ),
          ),
          SizedBox(
            height: 10,
          ),
          child
        ],
      ),
    );
  }
}
