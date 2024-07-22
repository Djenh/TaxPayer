import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

  String? companyName;
  String? companyAddress;
  InfoCard({super.key, required this.companyAddress, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/companyIcon.png",
                height: 50,
              ),
            ),
            SizedBox(width: 16),
            Expanded(child:  Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$companyName", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 20,),
                        Text("$companyAddress", style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                ],
              ),
            ), ),

          ],
        ),
      ),
    );
  }
}
