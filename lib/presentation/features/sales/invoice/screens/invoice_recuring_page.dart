import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

import '../../../../_widgets/app_bar_custom.dart';



/*class InvoiceRecurringPage extends StatefulWidget {
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
}*/


class InvoiceRecurringPage extends StatefulWidget {
  const InvoiceRecurringPage({super.key});

  @override
  State<InvoiceRecurringPage> createState() => _InvoiceRecurringPageState();
}

class _InvoiceRecurringPageState extends State<InvoiceRecurringPage> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool weekly = false;
  bool biweekly = false;
  bool monthly = true;
  bool autoSend = true;


  Widget _buildListTile(String title, String value, IconData icon, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(context, title, 14, Colors.black, fontWeight: FontWeight.w300),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildText(context, value, 14, Colors.black, fontWeight: FontWeight.w400),
              const SizedBox(width: 8),
              Icon(icon, color: Colors.black54, size: 18),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCheckboxTile(String title, bool value,
      Function(bool?) onChanged, {bool isDense = false, ListTileControlAffinity? controlAffinity}) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      dense: isDense,
      title: buildText(context, title, 14, Colors.black, maxLine: 3, fontWeight: FontWeight.w300),
      value: value,
      onChanged: onChanged,
      controlAffinity: controlAffinity ?? ListTileControlAffinity.trailing,
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      locale: const Locale('fr', "FR")
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  String _formatTime(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOther(context, "Définir une récurrence", actionList: []),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(context, "Rappel", 14, Colors.black, fontWeight: FontWeight.w700),
            const SizedBox(height: 20),
            _buildListTile("Date", _formatDate(selectedDate), Icons.arrow_forward_ios_rounded, () {
              _selectDate(context);
            }),
            const Divider(thickness: 1, color: KStyles.fieldGrey),
            const SizedBox(height: 10),
            _buildListTile("Heure", _formatTime(selectedTime), Icons.arrow_forward_ios_rounded, () {
              _selectTime(context);
            }),
            const Divider(thickness: 1, color: KStyles.fieldGrey),
            const SizedBox(height: 30),
            buildText(context, "Repeter", 14, Colors.black, fontWeight: FontWeight.w700),
            const SizedBox(height: 20),
            _buildCheckboxTile("Chaque semaine", weekly, (value) {
              setState(() {
                weekly = value!;
                biweekly = false;
                monthly = false;
              });
            }),
            const Divider(thickness: 1, color: KStyles.fieldGrey),
            _buildCheckboxTile("Chaque quinzaine", biweekly, (value) {
              setState(() {
                weekly = false;
                biweekly = value!;
                monthly = false;
              });
            }),
            const Divider(thickness: 1, color: KStyles.fieldGrey),
            _buildCheckboxTile("Chaque mois", monthly, (value) {
              setState(() {
                weekly = false;
                biweekly = false;
                monthly = value!;
              });
            }),
            const SizedBox(height: 30),
            Center(
                child: buildText(context, "Envoyer la facture automatiquement",
                    14, Colors.black, fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center)
            ),
            const SizedBox(height: 8),
            _buildCheckboxTile(
              "Envoyer la facture dans la période parfaite à ce client à moins de l'arrêter manuellement",
              autoSend,
              (value) {
                setState(() {
                  autoSend = value!;
                });
              },
              //isDense: true,
              controlAffinity: ListTileControlAffinity.leading
            ),
          ],
        ),
      ),
    );
  }

}
