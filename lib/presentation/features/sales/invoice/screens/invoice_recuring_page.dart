import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';



class InvoiceRecurringPage extends StatefulWidget {
  const InvoiceRecurringPage({super.key});

  @override
  State<InvoiceRecurringPage> createState() => _InvoiceRecurringPageState();
}

class _InvoiceRecurringPageState extends State<InvoiceRecurringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make a recurring "),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))],
      ),
      body: ListView(
        children: [
          KContainer(
              title: "Reminder",
              child: Column(
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const KtextGray("Date"),
                    trailing: const SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("20/12/23"),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                    ),
                    onTap: () {
                      openDateModal();
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const KtextGray("Time"),
                    trailing: const SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("10:10"), Icon(Icons.navigate_next)],
                      ),
                    ),
                    onTap: () {
                      openTimeModal();
                    },
                  ),
                  const SizedBox()
                ]).toList(),
              )),
          const SizedBox(
            height: 10,
          ),
          KContainer(
              title: "Repeat",
              child: Column(children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Every Day"),
                    trailing: const Icon(Icons.check),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Every Week"),
                    trailing: const Icon(Icons.check),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Every Month"),
                    trailing: const Icon(Icons.check),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Every year"),
                    trailing: const Icon(Icons.check),
                    onTap: () {},
                  ),
                  const SizedBox(),
                ]),
              ])),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send Invoice Automatically",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const KtextGray(
                          "Send Invoice in perfect period  to this client \nunless stop manually"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: KElevatedButton(
          onPressed: () {},
          child: const Text("Save"),
        ),
      ),
    );
  }

  void openDateModal() {
    showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));
  }

  void openTimeModal() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
