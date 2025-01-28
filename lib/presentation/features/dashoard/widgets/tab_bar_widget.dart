import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

Widget buildTabBarWidget({VoidCallback? opTap,String? title,bool? isSelected,int? selectedValue}) {
  return Flexible(
    child: GestureDetector(
      onTap: opTap,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Text(title!, style: TextStyle(color: isSelected! ?KStyles.tabColor: KStyles.unselectTabBarColor,fontWeight: FontWeight.w500,fontSize: 12)),
            const SizedBox(height: 2),
            if(isSelected)
              Padding(
                padding: EdgeInsets.only(left: selectedValue == 0 ? 10 : 5,right: selectedValue == 0 ? 10 : 5),
                child: Container(
                  color: KStyles.tabColor,
                  height: 3,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}