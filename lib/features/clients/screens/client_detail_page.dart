import 'package:flutter/material.dart';

import '../../../commons/widgets/kcontainer.dart';

class ClientDetailPage extends StatelessWidget {
  const ClientDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jean Louis"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: ListView(
        children: [
          KContainer(
            title: "Clients",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Client"),
                        Text("Jean louis"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date"),
                        Text("10/34/23"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Client To"),
                    Text("10/34/23"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          KContainer(
            title: "Client Items",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Lait djado"),
                  subtitle: Text("Qte: Z"),
                  trailing: Text("2000 XOD"),
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  title: Text("Lait djado"),
                  subtitle: Text("Qte: Z"),
                  trailing: Text("2000 XOD"),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          KContainer(
title: "Subtotal",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text("Qte: Z"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text("Qte: Z"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text("Qte: Z"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
