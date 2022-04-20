import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:trendy_fits/app/data/constants.dart';
import 'package:trendy_fits/app/modules/auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.find<HomeController>();
  final AuthController authController = Get.find<AuthController>();
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  Map<String, String> userActions = {
    "pending@gmail.com": "Pending",
    "processing@gmail.com": "Processing",
    "cad@gmail.com": "Cad",
    "cutting@gmail.com": "Cutting",
    "sewing@gmail.com": "Sewing",
    "finishing@gmail.com": "Finishing",
    "readytoship@gmail.com": "Ready to Ship",
    "delivered@gmail.com": "Delivered",
    "shipped@gmail.com": "Shipped",
  };

  void _onQRViewCreated(QRViewController controller) {
    qrController = controller;
    HomeController homeController = Get.find<HomeController>();
    controller.scannedDataStream.listen((scanData) {
      homeController.result.value = scanData;
    });
    if (homeController.result.value != null) {
      qrController?.dispose();
    }
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trendy Fits"),
        centerTitle: true,
        backgroundColor: accentColor,
        actions: [
          IconButton(
            onPressed: () => authController.signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.userRole[authController.email]} Sector",
                style: Get.textTheme.headline4?.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 40,
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
              Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: controller.result.value != null ? 0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                            overlay: QrScannerOverlayShape(
                              borderColor: Colors.red,
                              borderRadius: 10,
                              borderLength: 30,
                              borderWidth: 10,
                              cutOutSize: (MediaQuery.of(context).size.width <
                                          400 ||
                                      MediaQuery.of(context).size.height < 400)
                                  ? 200.0
                                  : 400.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: controller.result.value == null ? 0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.done,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx(() {
                if (controller.result.value != null) {
                  return Column(
                    children: [
                      Text(
                        "Are you sure you want to mark it as ${getActionString() ?? 'Done'}",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.red,
                              side: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              controller.result.value = null;
                            },
                            child: const Text("No"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.updatedProductStatus();
                            },
                            child: const Text("Yes"),
                          ),
                          if (controller.isLoading.value)
                            Container(
                              height: 10,
                              width: 10,
                              margin: const EdgeInsets.all(20),
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  String? getActionString() {
    AuthController authController = Get.find<AuthController>();
    String? email = authController.email;
    String? action = userActions[email];
    return action;
  }
}
