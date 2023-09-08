import 'package:chamran/enum/custom_bottom_navigation_type.dart';
import 'package:chamran/widget/custom_bottom_navigation/controller/custom_bottom_navigation_controller.dart';
import 'package:chamran/widget/custom_bottom_navigation/widget/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<CustomBottomNavigationController>(
      init: Get.find<CustomBottomNavigationController>(),
      builder: (controller) {
        return Container(
          height: size.height * .09,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.white.withOpacity(.08)),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x59147d77),
                Color(0x00147d77),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < BottomNavigationType.values.length; i++)
                Expanded(
                  child: CustomBottomNavigationItem(
                    icon: _getIcon(BottomNavigationType.values.elementAt(i),
                        controller.currentTab.value == i),
                    selected: controller.currentTab.value == i,
                    onPressed: () => controller.changeTab(i),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  String _getIcon(BottomNavigationType type, bool selected) {
    switch (type) {
      case BottomNavigationType.statistics:
        return 'assets/icons/bottom_navigation${selected ? '_selected' : ''}_profile.svg';
      case BottomNavigationType.home:
        return 'assets/icons/bottom_navigation${selected ? '_selected' : ''}_home.svg';
      case BottomNavigationType.alarms:
        return 'assets/icons/bottom_navigation${selected ? '_selected' : ''}_notification.svg';
    }
  }
}
