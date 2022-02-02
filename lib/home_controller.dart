import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var count = (Get.find<SharedPreferences>().getInt("count") ?? 0).obs;

  void increment() {
    count++;
    Get.find<SharedPreferences>().setInt("count", count.value);
  }
}
