import 'package:get/get.dart';

class HomeController extends GetxController {
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
}
