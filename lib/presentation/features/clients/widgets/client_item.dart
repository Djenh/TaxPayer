import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ClientItem extends StatelessWidget {
  final void Function()? onTap;

  const ClientItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const CircleAvatar(
        child: Center(
          child: Icon(Iconsax.building),
        ),
      ),
      title: const Text("Jorge Row"),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("10/23/30"),
          Text("97078697"),
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
