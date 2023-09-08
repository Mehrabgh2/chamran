import 'package:chamran/modules/biometric/widget/map_widget.dart';
import 'package:chamran/modules/home/widget/widget_container.dart';
import 'package:chamran/modules/main/controller/main_controller.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({
    required this.mainController,
    super.key,
  });
  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
      () => mainController.isDashboardLoading.value
          ? const Center(
              child: CircularProgressIndicator(color: AppTheme.progressColor),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              child: Column(
                children: [
                  SizedBox(height: size.height * .012),
                  Row(
                    children: [
                      const Expanded(
                        child: WidgetContainer(
                          color: Color(0xFFFFA674),
                          icon: 'assets/icons/weight.svg',
                          title: 'وزن',
                          value: '70',
                          sign: 'کیلوگرم',
                        ),
                      ),
                      SizedBox(width: size.width * .04),
                      const Expanded(
                        child: WidgetContainer(
                          color: Color(0xFFFF7674),
                          icon: 'assets/icons/height.svg',
                          title: 'قد',
                          value: '170',
                          sign: 'سانتی متر',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  Row(
                    children: [
                      const Expanded(
                        child: WidgetContainer(
                          color: Color(0xFF2FC8BF),
                          icon: 'assets/icons/bmi.svg',
                          title: 'بی ام آی',
                          value: '25.5',
                          sign: 'kg/m²',
                        ),
                      ),
                      SizedBox(width: size.width * .04),
                      const Expanded(
                        child: WidgetContainer(
                          color: Color(0xFF748AFF),
                          icon: 'assets/icons/year.svg',
                          title: 'سن',
                          value: '27',
                          sign: 'سال',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  MapWidget(
                    latitude: mainController.getValueByKey('latitude'),
                    longitude: mainController.getValueByKey('longitude'),
                  ),
                ],
              ),
            ),
    );
  }
}
