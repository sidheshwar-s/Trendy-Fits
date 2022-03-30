import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar({
  String? title,
  String? message,
  Color? backgroundColor,
  Color? foregroundColor,
}) {
  Get.snackbar(
    title ?? '',
    message ?? '',
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(20),
    backgroundColor: backgroundColor,
    colorText: foregroundColor,
  );
}
