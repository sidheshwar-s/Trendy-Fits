import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_fits/app/data/constants.dart';
import 'package:trendy_fits/app/routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 100,
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
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: accentColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.HOME);
                      },
                      child: const Text("LOGIN"),
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
    );
  }
}
