import 'package:bes_mobile/screens/homeScreen.dart';
import 'package:bes_mobile/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/imagePickerComponent.dart';
import '../components/inputComponent.dart';
import '../components/buttonComponent.dart';

class CreateCompanyScreen extends StatefulWidget {
  const CreateCompanyScreen({super.key});

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      appBar: AppBar(
        title: Text("Create a Corporate Profile"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            color: whiteColor,
            child: ImagePickerComponent(
              labelImage: "Add Company Logo",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(15),
            color: whiteColor,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Company details",
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  InputComponent(label: "Full Name"),
                  InputComponent(label: "Company Name"),
                  InputComponent(label: "Address"),
                  InputComponent(label: "Mail"),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(15),
            color: whiteColor,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  InputComponent(label: "Company Name"),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: whiteColor,
            child: ButtonComponent(labelButton: "Next",),
          )
        ],
      ),
    );
  }
}
