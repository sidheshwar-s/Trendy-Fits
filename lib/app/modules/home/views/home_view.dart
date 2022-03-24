import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Sidhesh",
                style: Get.textTheme.headline4?.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please scan the QR code to continue",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("தொடர QR குறியீட்டை ஸ்கேன் செய்யவும்"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
