import 'package:flutter/material.dart';
import 'package:invoice_app/features/home/screens/home_page.dart';

import '../../../commons/widgets/kcontainer.dart';
import '../../../commons/widgets/kelevatedbutton.dart';
import '../../../commons/widgets/kinput.dart';

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
          Form(
            child: Column(
              children: [
                KContainer(
                  title: "Company Details",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "TIN",
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(name: "RCCM"),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                          name: "Adresse",
                          keyboardType: TextInputType.streetAddress),
                      const SizedBox(
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
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
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
        child: Text(
          "Next",
        ),
      )),
    );
  }
}
