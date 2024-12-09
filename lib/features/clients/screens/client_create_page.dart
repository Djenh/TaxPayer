import 'package:flutter/material.dart';
import 'package:invoice_app/commons/ui/ui.dart';

class ClientCreatePage extends StatelessWidget {
  const ClientCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Creation"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))],
      ),
      body: ListView(
        children: [
          Form(
            child: Column(
              children: [
                KContainer(
                  title: "Client Details",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KInput(
                        name: "Tin ",
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: KInput(
                              name: "First Name ",
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Expanded(
                              child: KInput(
                            name: "Last Name",
                            keyboardType: TextInputType.name,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                          name: "Email",
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(name: "Phone", keyboardType: TextInputType.phone),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                KContainer(
                  title: "Address Details",
                  child: Column(
                    children: [
                      KInput(
                        name: "Address",
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "City",
                        keyboardType: TextInputType.streetAddress,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "State",
                        keyboardType: TextInputType.streetAddress,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      KInput(
                        name: "Country",
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child:KElevatedButton(
          child: const Text("Add client", style: TextStyle(color: Colors.white),),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
