import 'package:chamran/modules/dashboard/controller/dashboard_controller.dart';
import 'package:chamran/modules/dashboard/widget/dashboard_list_view.dart';
import 'package:chamran/modules/dashboard/widget/warrior_list_view.dart';
import 'package:chamran/modules/main/controller/main_controller.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.mainController,
    super.key,
  });
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DashboardController>(
      init: DashboardController(mainController: mainController),
      builder: (controller) {
        return Column(
          children: [
            controller.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.progressColor,
                    ),
                  )
                : Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        return await controller.refreshData();
                      },
                      color: Colors.white,
                      backgroundColor: AppTheme.primaryColor,
                      child: controller.dashboardPagingController.itemList !=
                                  null &&
                              controller.dashboardPagingController.itemList!
                                  .isNotEmpty
                          ? DashboardListView(
                              controller: controller.dashboardPagingController,
                              onSelect: mainController.selectDashboard,
                              selected: mainController.selectedDashboard.value,
                            )
                          : Stack(
                              children: [
                                ListView(
                                  physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics(),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'داشبوردی یافت نشد',
                                    style: TextStyle(
                                      fontSize: size.width * .0425,
                                      fontFamily: 'ShabnamBold',
                                      color: const Color(0xFF4F4F4F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
            Container(
              height: 1,
              width: size.width,
              color: const Color(0xFF147D77),
              margin: EdgeInsets.symmetric(vertical: size.height * .01),
            ),
            Obx(
              () => Expanded(
                child: mainController.isWarriorLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.progressColor,
                        ),
                      )
                    : WarriorListView(
                        tabs: mainController.tabs,
                        selectedTab: mainController.selectedTab.value,
                        onSelect: mainController.selectTab,
                      ),
              ),
            ),
            SizedBox(height: size.height * .1),
          ],
        );
      },
    );
  }
}
