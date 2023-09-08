import 'package:chamran/widget/custom_bottom_navigation/controller/custom_bottom_navigation_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomBottomNavigationController());
  }
}
