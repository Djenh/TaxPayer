import 'package:flutter/material.dart';

import '../res/app_input_styles.dart';
import 'build_text.dart';

class BuildDropdownString extends StatelessWidget {
  const BuildDropdownString({super.key, required this.label, required this.hint,
    required this.items, required this.onTap});

  final String label;
  final String hint;
  final List<String> items;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(context, label, 12, Colors.grey, fontWeight: FontWeight.w400),
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            child: DropdownButtonFormField<String>(
              hint: buildText(context, hint, 12, Colors.black54,
                  fontWeight: FontWeight.w600),
              isExpanded: true,
              decoration: AppInputStyles.dropDownInputDecoration1(),
              value: null,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: buildText(context, value, 12, Colors.black54),
                );
              }).toList(),
              onChanged: (String? value) {
                // TODO : Ajouter la logique pour la sélection
              },
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey, size: 22),
            ),
          ),
        ),
      ],
    );
  }
}
