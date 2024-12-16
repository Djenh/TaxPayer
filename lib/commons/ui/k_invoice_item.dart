import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KInvoiceItem extends StatelessWidget {
  final VoidCallback? onTap;

  const KInvoiceItem({super.key, this.onTap });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Exonere',
              ),
              GestureDetector(
                  onTap: onTap,
                  child: const Icon(
                    Iconsax.more,
                    size: 16,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Text(
                  'Amior premium',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    const Icon(Iconsax.minus),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(fontWeight: FontWeight.w200),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    const Icon(Iconsax.add)
                  ],
                ),
              ),
              const Expanded(
                child: Text(
                  '200.000',
                  style: TextStyle(fontWeight: FontWeight.w200),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
