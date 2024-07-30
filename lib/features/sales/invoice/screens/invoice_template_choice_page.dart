import 'package:flutter/material.dart';

class InvoiceTemplateChoicePage extends StatelessWidget {
  const InvoiceTemplateChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Template"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose a template",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
