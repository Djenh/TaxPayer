import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:toastification/toastification.dart';

class ToastService {
  static void showSuccess(BuildContext context, String title, {String? description}) {
    _showToast(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.success,
      backgroundColor: Colors.green,
    );
  }

  static void showWarning(BuildContext context, String title, {String? description}) {
    _showToast(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.warning,
      backgroundColor: Colors.orange,
    );
  }

  static void showError(BuildContext context, String title, {String? description}) {
    _showToast(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.error,
      backgroundColor: Colors.redAccent,
    );
  }

  static void showInfo(BuildContext context, String title, {String? description}) {
    _showToast(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.info,
      backgroundColor: Colors.blueAccent,
    );
  }

  static void _showToast({
    required BuildContext context,
    required String title,
    String? description,
    required ToastificationType type,
    required Color backgroundColor,
  }) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 10),
      title: buildText(context, title, 14, Colors.white, fontWeight: FontWeight.w700),
      description: buildText(context, description!, 12, Colors.white, fontWeight: FontWeight.w400, maxLine: 3),
      type: type,
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      backgroundColor: backgroundColor,
      icon: _getIconForType(type),
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.transparent),
      boxShadow: [],
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  static Icon _getIconForType(ToastificationType type) {
    switch (type) {
      case ToastificationType.success:
        return const Icon(Icons.check_circle, color: Colors.white);
      case ToastificationType.warning:
        return const Icon(Iconsax.warning_2, color: Colors.white);
      case ToastificationType.error:
        return const Icon(Iconsax.danger, color: Colors.white);
      case ToastificationType.info:
      default:
        return const Icon(Iconsax.info_circle, color: Colors.white);
    }
  }
}
