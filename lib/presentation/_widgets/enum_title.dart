import 'package:flutter/material.dart';



class EnumTitle extends StatelessWidget {
  const EnumTitle({
    super.key,
    required this.title,
    required this.value,
    this.style1,
    this.style2,
  });
  final String title;
  final String value;
  final TextStyle? style1;
  final TextStyle? style2;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text.rich(
        TextSpan(
          text: "$title\n",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(height: 1.5)
              .merge(style1),
          children: <InlineSpan>[
            TextSpan(
              text: value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                    //color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ).merge(style2),
            ),
          ],
        ),
      ),
    );
  }
}
