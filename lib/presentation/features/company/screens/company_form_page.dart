import 'package:flutter/material.dart';

import 'package:invoice_app/commons/ui/ui.dart';

import '../../home/screens/home_page.dart';

class CompanyFormPage extends StatelessWidget {
  const CompanyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company "),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Material(
            color: Colors.grey,
            child: InkWell(
              onTap: () {},
              child: KContainer(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Add company Logo ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Form(
            child: Column(
              children: [
                KContainer(
                  title: "Company Details",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "TIN",
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      KInput(name: "RCCM"),
                      SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                          name: "Adresse",
                          keyboardType: TextInputType.streetAddress),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                KContainer(
                  title: "Company Details",
                  child: Column(
                    children: [
                      KInput(
                        name: "Phone Number",
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                          name: "Full Name", keyboardType: TextInputType.name),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: KElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false);
        },
        child: const Text(
          "Next",
        ),
      )),
    );
  }
}
