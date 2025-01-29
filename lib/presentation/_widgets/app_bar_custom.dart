import 'package:flutter/material.dart';

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