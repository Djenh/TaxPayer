import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class InvoiceItem extends StatelessWidget {
  final void Function()? onTap;
  const InvoiceItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading:  const CircleAvatar(

        child: Center(
          child: Icon(Iconsax.bill),
        ),
      ),
      title: Text(
        "Jorge Row",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
             fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Facture #23322 |  10/23/30",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).dividerColor),
          ),
          Text("Livraison ",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).dividerColor)),
        ],
      ),
      trailing: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("360 USD"),
          Text("Paid"),
        ],
      ),
    );
  }
}
