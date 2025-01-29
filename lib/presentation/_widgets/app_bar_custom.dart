import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../res/app_input_styles.dart';
import '../res/input_formaters.dart';
import '../res/style/e_style.dart';

PreferredSizeWidget appBarHome(BuildContext context, String title,
    {List<Widget>? actionList, PreferredSizeWidget? bottomWidget, Color? bgColor}){
  return AppBar(
    elevation: 0,
    backgroundColor: bgColor ?? Colors.transparent,
    shadowColor: Theme.of(context).shadowColor,
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)
    ),
    actions: actionList ?? [],
    bottom: bottomWidget,
  );
}



PreferredSizeWidget appBarOther(BuildContext context, String title,
    {List<Widget>? actionList}){
  return AppBar(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    shadowColor: Colors.black.withOpacity(0.2),
    centerTitle: false,
    title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)
    ),
    actions: actionList ?? [],
  );
}


PreferredSizeWidget appBarAgence(BuildContext context, String title1, String title2,
    {List<Widget>? actionList, PreferredSizeWidget? bottomWidget}){
  return AppBar(
    /*backgroundColor : Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    shadowColor: Colors.black.withOpacity(0.2),*/
    elevation: 2,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: Theme.of(context).shadowColor,
    automaticallyImplyLeading: false,
    centerTitle: false,
    leading: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const CircleAvatar(
                child: Center(
                  child: Icon(Iconsax.user),
                ),
              ), onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ],
    ),
    title: Text.rich(
      TextSpan(
          text: "${title1}\n",
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15,),
          children: <TextSpan>[
            TextSpan(text: title2,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black),
            )
          ]
      ),
    ),
    actions: actionList ??
        [SizedBox(
          height: 40,
          width: 135,
          child: TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            inputFormatters: noSpaceNoEmoji,
            autofocus: false,
            onTap: () async {},
            decoration: AppInputStyles.defaultInputDecoration(
                labelText: "Agences",
                // hintText: "Agences",
                suffixIcon: const Icon(Icons.arrow_drop_down_sharp, size: 24)
            ),
          ),
        ),
          IconButton(
              onPressed: () {
                // Get.to(() => const ScanVerifyPage());
              }, icon: const CircleAvatar(child: Icon(Iconsax.scan, size:18))
          ),
          IconButton(
              onPressed: () async {},
              icon: const Icon(CupertinoIcons.add_circled_solid,
                  color: KStyles.primaryColor, size: 36)
          ),],
    bottom: bottomWidget,
  );
}