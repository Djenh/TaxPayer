import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';

class ExportMenu extends StatelessWidget {
  final bool totalInfo;

  const ExportMenu({super.key, this.totalInfo = true});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      totalInfo
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Timonthee James",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      const KtextGray("10/12/2023"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("500 USD",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Unpaid"),
                    ],
                  ),
                ],
              ),
            )
          : const SizedBox(),
      ...ListTile.divideTiles(context: context, tiles: [
        const KMenuItem(
          icon: Icons.picture_as_pdf_outlined,
          title: ("Export PDF"),
          pop: false,
          routed: false,
        ),
        ListTile(
          leading: Icon(
            Icons.email_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: const Text("Send by Email"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.save_alt, color: Theme.of(context).primaryColor),
          title: const Text("Save "),
          onTap: () {},
        ),
      ]),
    ]);
  }
}
