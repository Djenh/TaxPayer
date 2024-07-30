import 'package:flutter/material.dart';
import 'package:invoice_app/commons/widgets/kTextgray.dart';
import 'package:invoice_app/commons/widgets/kcontainer.dart';

import '../../../../commons/widgets/kelevatedbutton.dart';


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
        title: Text("Make a recurring "),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: ListView(
        children: [
          KContainer(
              title: "Reminder",
              child: Column(
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: KtextGray("Date"),
                    trailing: Container(
                      child: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("20/12/23"),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      openDateModal();
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: KtextGray("Time"),
                    trailing: Container(
                      child: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text("10:10"), Icon(Icons.navigate_next)],
                        ),
                      ),
                    ),
                    onTap: () {
                      openTimeModal();
                    },
                  ),
                  SizedBox()
                ]).toList(),
              )),
          SizedBox(
            height: 10,
          ),
          KContainer(
              title: "Repeat",
              child: Column(children: [
                ...ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Every Day"),
                    trailing: Icon(Icons.check),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Every Week"),
                    trailing: Icon(Icons.check),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Every Month"),
                    trailing: Icon(Icons.check),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Every year"),
                    trailing: Icon(Icons.check),
                    onTap: () {},
                  ),
                  SizedBox(),
                ]).toList(),
              ])),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
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
                      KtextGray(
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
          child: Text("Save"),
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
