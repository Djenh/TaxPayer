
import 'package:bes_mobile/themes/theme.dart';
import 'package:flutter/material.dart';
import '../components/buttonComponent.dart';
import '../screens/createCompanyScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Image(image: AssetImage("assets/images/logo.png")),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Create Innovoice on the go!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Quick and easy way to create your invoice on the fly and share with your clients instantly",
              style: TextStyle(color: greyColor, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCompanyScreen(),));
          },
          child: ButtonComponent(
        labelButton: "Get Started",
      )),
    );
  }
}
