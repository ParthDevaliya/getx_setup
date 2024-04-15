import 'package:get/get.dart';
import '../controller/search_screen_controller.dart';

class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchScreenController());
  }
}
