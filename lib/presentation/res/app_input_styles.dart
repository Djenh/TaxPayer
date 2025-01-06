import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';


class AppInputStyles {

  static InputDecoration defaultInputDecoration(
      {String? hintText,
      String? labelText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      double? radius,
      String? errorText,
      TextStyle? hintStyle,
      Color? fillColor}) {
    return InputDecoration(
      hintText: hintText,
      label: Text(labelText ?? ""),
      fillColor: fillColor ?? Colors.transparent,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
      errorMaxLines: 2,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: KStyles.fieldGrey, width: 1.5)
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: KStyles.primaryColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.5)),
    );
  }

  static InputDecoration authInputDecoration({
    String? hintText,
    String? errorText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    RxBool? show,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: hintText,
      fillColor: Colors.transparent,
      suffixIcon: suffixIcon ??
          (show != null
              ? IconButton(
            icon: Icon(show.isTrue
                ? Iconsax.lock
                : Iconsax.unlock),
            color: Colors.grey,
            onPressed: () => show.toggle(),
          )
              : null),
      prefixIcon: prefixIcon,
      errorText: errorText,
      errorMaxLines: 2,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: KStyles.fieldGrey, width: 1.5)
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: KStyles.primaryColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.5)),
    );
  }


  static InputDecoration dropDownInputDecoration() {
    return const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    );
  }

  static InputDecoration dropDownInputDecoration1() {
    return  InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: KStyles.fieldGrey, width: 1.5)
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: KStyles.primaryColor)),
    );
  }

}

