import 'package:chamran/enum/custom_bottom_navigation_type.dart';
import 'package:chamran/modules/main/widget/home_app_bar_item.dart';
import 'package:chamran/modules/main/widget/logout_confirmation_dialog.dart';
import 'package:chamran/modules/main/widget/sos_button.dart';
import 'package:chamran/service/auth_service.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:chamran/util/app_util.dart';
import 'package:chamran/widget/custom_bottom_navigation/controller/custom_bottom_navigation_controller.dart';
import 'package:chamran/widget/svg_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    required this.sos,
    required this.battery,
    required this.antena,
    super.key,
  });
  bool? sos;
  num? battery;
  num? antena;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CustomBottomNavigationController customBottomNavigationController =
        Get.find<CustomBottomNavigationController>();
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        right: size.width * .02,
        left: size.width * .02,
      ),
      height: size.height * .115,
      color: AppTheme.backgroundColor,
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                width: size.height * .055,
                height: size.height * .055,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      updateIsLogouting(false);
                      showLogoutDialog();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(size.height * .0135),
                      child: const SvgWidget(
                        path: 'assets/icons/app_bar_history.svg',
                        color: Colors.white,
                        fastLoad: true,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * .01),
              SosButton(isOn: sos ?? false),
              SizedBox(width: size.width * .03),
              HomeAppBarItem(
                icon: 'assets/icons/battery_${mapBattery()}.svg',
                value: battery,
              ),
              SizedBox(width: size.width * .03),
              HomeAppBarItem(
                icon: 'assets/icons/antena_${mapAntena()}.svg',
                value: antena,
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => Text(
                _getTitle(BottomNavigationType.values.elementAt(
                    customBottomNavigationController.currentTab.value)),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * .0475,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int mapBattery() {
    int value = (0 + ((5 - 0) / (100 - 0)) * ((battery ?? 0) - 0)).round();
    return value > 5 ? 5 : value;
  }

  int mapAntena() {
    int value = (0 + ((4 - 0) / (100 - 0)) * ((antena ?? 0) - 0)).round();
    return value > 4 ? 4 : value;
  }

  final RxBool isLogouting = false.obs;

  void showLogoutDialog() async {
    updateIsLogouting(false);
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (ctx) => LogoutConfirmationDialog(
        isLoading: isLogouting,
        submit: () async {
          updateIsLogouting(true);
          await AuthService.logout();
          AppUtil.signOut();
          Get.back();
        },
      ),
    );
  }

  updateIsLogouting(bool value) {
    isLogouting.value = value;
    isLogouting.refresh();
  }

  String _getTitle(BottomNavigationType type) {
    switch (type) {
      case BottomNavigationType.statistics:
        return 'آمار';
      case BottomNavigationType.home:
        return 'مشخصات';
      case BottomNavigationType.alarms:
        return 'ها${Unicode.FSI}هشدار';
    }
  }

  @override
  Size get preferredSize => Size(Get.width, Get.height * .115);
}
