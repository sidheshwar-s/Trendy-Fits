import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_fits/app/data/constants.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/track tech solution.png',
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Login Now",
                  style: Get.textTheme.headline2?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Please enter the details below to conitinue"),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: () => controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value,
                        icon: controller.isPasswordHidden.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.signInWithEmail();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("LOGIN"),
                            if (controller.isLoading.value)
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: accentColor,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
