import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_fits/app/modules/auth/controllers/auth_controller.dart';
import 'package:trendy_fits/app/modules/auth/views/auth_view.dart';
import 'package:trendy_fits/app/modules/home/controllers/home_controller.dart';
import 'package:trendy_fits/app/modules/home/views/home_view.dart';

class RootView extends GetView<AuthController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user.value == null) {
        return const AuthView();
      } else {
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
        return const HomeView();
      }
    });
  }
}
