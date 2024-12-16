import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/style/e_style.dart';
import 'app_circular_progress.dart';


class ActionBtn extends StatelessWidget {
  const ActionBtn({
    super.key,
    required this.title,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.isBlack = false,
    this.onPressed,
    required this.loading,
  });

  final String title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isBlack;
  final VoidCallback? onPressed;
  final RxBool loading;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ElevatedButton(
        onPressed: () {
          Get.focusScope?.unfocus();
          if (loading.isFalse) {
            onPressed?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: KStyles.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: RepaintBoundary(
          child: loading.isTrue
              ? const SizedBox.square(
            dimension: 26,
            child: AppCircularProgress(
              backgroundColor: Colors.black54,
              color: Colors.white,
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*if (icon != null) ...[
                Icon(icon),
                const SizedBox(width: padding),
              ],*/
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
