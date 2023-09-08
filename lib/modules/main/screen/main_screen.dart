import 'package:chamran/modules/biometric/screen/biometric_screen.dart';
import 'package:chamran/modules/dashboard/screen/dashboard_screen.dart';
import 'package:chamran/modules/home/screen/home_screen.dart';
import 'package:chamran/modules/main/controller/main_controller.dart';
import 'package:chamran/modules/main/widget/home_app_bar.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:chamran/widget/custom_bottom_navigation/controller/custom_bottom_navigation_controller.dart';
import 'package:chamran/widget/custom_bottom_navigation/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CustomBottomNavigationController customBottomNavigationController =
        Get.find<CustomBottomNavigationController>();
    return GetBuilder<MainController>(
      init: MainController(context: context),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          appBar: HomeAppBar(
            sos: controller.getValueByKey('sos') == '1',
            battery:
                num.tryParse(controller.getValueByKey('battery_value') ?? ''),
            antena:
                num.tryParse(controller.getValueByKey('signal_value') ?? ''),
          ),
          body: Stack(
            children: [
              Obx(
                () => Positioned.fill(
                  child: IndexedStack(
                    index: customBottomNavigationController.currentTab.value,
                    children: [
                      BiometricScreen(mainController: controller),
                      HomeScreen(mainController: controller),
                      DashboardScreen(mainController: controller),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * .01,
                left: size.width * .02,
                right: size.width * .02,
                child: const CustomBottomNavigation(),
              ),
            ],
          ),
        );
      },
    );
  }
}
