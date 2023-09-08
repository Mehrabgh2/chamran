import 'package:chamran/model/dashboard/dashboard.dart';
import 'package:chamran/model/dashboard/dashboard_tab.dart';
import 'package:chamran/model/widget/dm_widget.dart';
import 'package:chamran/model/widget/widget_value.dart';
import 'package:chamran/modules/home/widget/live_chart.dart';
import 'package:chamran/service/auth_service.dart';
import 'package:chamran/service/dashboard_service.dart';
import 'package:chamran/util/shared_preferences.dart';
import 'package:chamran/util/websocket_controller.dart';
import 'package:chamran/widget/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController({required this.context});
  WebSocketController? webSocketController;
  BuildContext context;
  RxList<DMWidget?> widgets = RxList([]);
  RxList<DashboardTab?> tabs = RxList([]);
  Rx<DashboardTab?> selectedTab = Rx(null);
  Rx<Dashboard?> selectedDashboard = Rx(null);
  LiveSPLineChart bloodpressureChart =
      LiveSPLineChart(color: const Color(0xFFFFA674));
  LiveSPLineChart bloodpressure2Chart =
      LiveSPLineChart(color: const Color(0xFFFFD074));
  LiveSPLineChart heartBeatChart =
      LiveSPLineChart(color: const Color(0xFFFF7674));
  LiveSPLineChart bodyTempChart =
      LiveSPLineChart(color: const Color(0xFF259993));
  LiveSPLineChart bloodO2Chart =
      LiveSPLineChart(color: const Color(0xFF748AFF));

  var isDashboardLoading = false.obs;
  var isWarriorLoading = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    String? dashboardId = SharedPreferences.getDashboardId();
    if (dashboardId == null) {
      return;
    }
    updateIsDashboardLoading(true);
    updateIsWarriorLoading(true);
    var response = await DashboardService.getOneDashboard(dashboardId);
    updateIsDashboardLoading(false);
    if (response.statusCode == 200) {
      widgets.value = response.widgets ?? [];
      createTabs();
      widgets.refresh();
      var tokenResponse = await AuthService.getSocketToken();
      if (tokenResponse.statusCode == 200) {
        webSocketController = Get.put(WebSocketController());
        webSocketController!.init(
          response.widgets,
          tokenResponse.socketToken,
          (value) {
            if (value != null &&
                value.values != null &&
                value.values!.isNotEmpty) {
              // ignore: invalid_use_of_protected_member
              for (var element in widgets.value) {
                if (element != null) {
                  if (element.cmdId == value.cmdId) {
                    element.value!.value = value;
                    element.value!.refresh();
                  }
                }
              }
            }
            if (value != null &&
                value.values != null &&
                value.values!.isNotEmpty) {
              // ignore: invalid_use_of_protected_member
              for (var element in widgets.value) {
                if (element != null) {
                  if (element.value!.value.values != null) {
                    for (var e2 in element.value!.value.values!) {
                      if (e2.key == 'systolic_blood_pressure') {
                        bloodpressureChart.addLine(double.tryParse(e2.value));
                      }
                      if (e2.key == 'diastolic_blood_pressure') {
                        bloodpressure2Chart.addLine(double.tryParse(e2.value));
                      }
                      if (e2.key == 'heart_rate') {
                        heartBeatChart.addLine(double.tryParse(e2.value));
                      }
                      if (e2.key == 'body_temp') {
                        bodyTempChart.addLine(double.tryParse(e2.value));
                      }
                      if (e2.key == 'blood_oxygen') {
                        bloodO2Chart.addLine(double.tryParse(e2.value));
                      }
                    }
                  }
                }
              }
            }
            updateIsWarriorLoading(false);
            createTabs();
            update();
          },
        );
      }
    } else {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showFailure(context, 'داشبورد یافت نشد');
      update();
    }
  }

  void createTabs() {
    // ignore: invalid_use_of_protected_member
    tabs.value.clear();
    // ignore: invalid_use_of_protected_member
    for (var element in widgets.value) {
      DashboardTab? tab =
          // ignore: invalid_use_of_protected_member
          tabs.value.firstWhereOrNull((e1) => e1?.id == element?.deviceId);
      if (tab != null) {
        tab.widgets ??= RxList([]);
        tab.title ??= getTitle(tab);
        tab.widgets!.add(element);
      } else {
        // ignore: invalid_use_of_protected_member
        tabs.add(DashboardTab(
          id: element?.deviceId,
          widgets: RxList([element]),
        ));
      }
    }
    updateSelectedDashboardTab();
  }

  void updateSelectedDashboardTab() {
    // ignore: invalid_use_of_protected_member
    for (var element in tabs.value) {
      String? deviceId = SharedPreferences.getDeviceId();
      if (deviceId != null && deviceId == element?.id) {
        selectedTab(element);
      }
    }
  }

  String? getTitle(DashboardTab tab) {
    String? title;
    if (tab.widgets != null) {
      // ignore: invalid_use_of_protected_member
      for (DMWidget? e1 in tab.widgets!.value) {
        if (e1?.value?.value.values != null) {
          for (ValueModel? e2 in e1!.value!.value.values!) {
            if (e2 != null && e2.key == 'name') {
              title = e2.value;
            }
          }
        }
      }
    }
    return title;
  }

  void selectDashboard(Dashboard dashboard) {
    if (dashboard.id != null) {
      SharedPreferences.setDashboardId(dashboard.id!);
      init();
      // ignore: invalid_use_of_protected_member
      widgets.value.clear();
      // ignore: invalid_use_of_protected_member
      tabs.value.clear();
      selectedTab.value = null;
      selectedTab.refresh();
      selectedDashboard.value = dashboard;
      selectedDashboard.refresh();
      update();
    }
  }

  void selectTab(DashboardTab? tab) {
    if (tab?.id != null) {
      selectedTab.value = tab;
      selectedTab.refresh();
      SharedPreferences.setDeviceId(tab!.id!);
      update();
    }
  }

  void updateIsDashboardLoading(bool value) {
    isDashboardLoading.value = value;
    isDashboardLoading.refresh();
  }

  void updateIsWarriorLoading(bool value) {
    isWarriorLoading.value = value;
    isWarriorLoading.refresh();
  }

  getValueByKey(String key) {
    var value;
    if (selectedTab.value != null) {
      if (selectedTab.value!.widgets != null) {
        // ignore: invalid_use_of_protected_member
        for (DMWidget? e1 in selectedTab.value!.widgets!.value) {
          if (e1?.value?.value.values != null) {
            for (ValueModel? e2 in e1!.value!.value.values!) {
              if (e2 != null && e2.key == key) {
                value = e2.value;
              }
            }
          }
        }
      }
    }
    return value;
  }
}
