import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:trendy_fits/app/data/utils.dart';
import 'package:trendy_fits/app/modules/auth/controllers/auth_controller.dart';
import 'package:trendy_fits/app/modules/home/providers/home_providers.dart';

class HomeController extends GetxController {
  Rxn<Barcode?> result = Rxn<Barcode?>(null);
  RxBool isLoading = RxBool(false);
  Map<String, String> actions = {
    "Pending": "1",
    "Processing": "2",
    "Cad": "3",
    "Cutting": "4",
    "Sewing": "5",
    "Finishing": "6",
    "Ready to Ship": "7",
    "Delivered": "8",
    "Shiped": "9",
  };

  Map<String, String> userRole = {
    "pending@gmail.com": "Pending",
    "processing@gmail.com": "Processing",
    "cad@gmail.com": "Cad",
    "cutting@gmail.com": "Cutting",
    "sewing@gmail.com": "Sewing",
    "finishing@gmail.com": "Finishing",
    "readytoship@gmail.com": "Ready to Ship",
    "delivered@gmail.com": "Delivered",
    "shipped@gmail.com": "Shiped"
  };

  Future<void> updatedProductStatus() async {
    if (result.value == null) {
      showSnackBar(title: "Invalid barcode");
    } else {
      isLoading.value = true;
      var role = userRole[Get.find<AuthController>().email];
      var status = actions[role];
      Map<String, dynamic> data = {
        "action": "update_order_status",
        "orderid": result.value!.code,
        "status": status
      };
      try {
        await HomeProviders().updateOrderStatus(data);
        showSnackBar(title: "Product status updated successfully");
      } catch (e) {
        showSnackBar(title: "Sorry Couldn't update order status");
      } finally {
        result.value = null;
        isLoading.value = false;
      }
    }
  }
}
