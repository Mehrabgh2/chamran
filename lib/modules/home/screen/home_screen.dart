
import 'package:chamran/modules/home/widget/area_temp_widget.dart';
import 'package:chamran/modules/home/widget/widget_container.dart';
import 'package:chamran/modules/main/controller/main_controller.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
                      Expanded(
                        child: WidgetContainer(
                          color: const Color(0xFFFFA674),
                          icon: 'assets/icons/blood_pressure.svg',
                          title: 'فشار خون',
                          value: (mainController.getValueByKey(
                                      'systolic_blood_pressure') ??
                                  '-') +
                              '/' +
                              (mainController.getValueByKey(
                                      'diastolic_blood_pressure') ??
                                  '-'),
                          child: Stack(
                            children: [
                              mainController.bloodpressureChart,
                              mainController.bloodpressure2Chart,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * .04),
                      Expanded(
                        child: WidgetContainer(
                          color: const Color(0xFFFF7674),
                          icon: 'assets/icons/heart_beat.svg',
                          title: 'ضربان قلب',
                          value: mainController.getValueByKey('heart_rate'),
                          sign: 'BPM',
                          child: mainController.heartBeatChart,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  Row(
                    children: [
                      Expanded(
                        child: WidgetContainer(
                          color: const Color(0xFF2FC8BF),
                          icon: 'assets/icons/body_temp.svg',
                          title: 'دما بدن',
                          value: mainController.getValueByKey('body_temp'),
                          sign: 'درجه سانتی گراد',
                          child: mainController.bodyTempChart,
                        ),
                      ),
                      SizedBox(width: size.width * .04),
                      Expanded(
                        child: WidgetContainer(
                          color: const Color(0xFF748AFF),
                          icon: 'assets/icons/blood_o2.svg',
                          title: 'اکسیژن خون',
                          value:
                              (mainController.getValueByKey('blood_oxygen') ??
                                      '-') +
                                  '%',
                          child: mainController.bloodO2Chart,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  AreaTempWidget(
                    value: mainController.getValueByKey(
                      'environment_temp',
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
