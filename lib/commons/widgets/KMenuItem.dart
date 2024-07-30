import 'package:flutter/material.dart';

class KMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  final VoidCallback? onTap;
  final bool routed;
  final bool pop;

  /*
  @next represent the nex widget
   */
  final Widget? next;

  KMenuItem(
      {super.key,
      required this.icon,
      this.color,
      required this.title,
      this.onTap,
      this.routed = true,
      this.pop = true,
      this.next});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Icon(icon,
          color: color != null ? color : Theme.of(context).primaryColor),
      title: Text("$title".trim()),
      onTap: () {
        if (pop) {
          Navigator.pop(context);
        }
        print(routed);
        if (routed) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SizedBox(
                  child: next,
                ),
              ));
        } else {
          onTap;
        }
      },
    );
  }
}
