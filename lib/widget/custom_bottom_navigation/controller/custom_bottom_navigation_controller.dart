import 'package:get/get.dart';

class CustomBottomNavigationController extends GetxController {
  var currentTab = 1.obs;

  void changeTab(int newTab) {
    currentTab.value = newTab;
    currentTab.refresh();
    update();
  }
}
