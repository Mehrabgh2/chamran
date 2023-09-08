import 'package:chamran/model/dashboard/dashboard.dart';
import 'package:chamran/modules/main/controller/main_controller.dart';
import 'package:chamran/service/dashboard_service.dart';
import 'package:chamran/util/constants.dart';
import 'package:chamran/util/shared_preferences.dart';
import 'package:chamran/widget/snackbar/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashboardController extends GetxController {
  DashboardController({required this.mainController});
  final MainController mainController;
  final PagingController<int, Dashboard> dashboardPagingController =
      PagingController(firstPageKey: 0);
  bool loading = false;
  bool isEmpty = false;
  int page = 0;

  @override
  void onInit() {
    updateLoading(true);
    initPagingController();
    getData(page, true);
    super.onInit();
  }

  void initPagingController() {
    dashboardPagingController.addPageRequestListener((pageKey) {
      getData(pageKey, false);
    });
  }

  /// reset pagination controller
  void resetPagingControllers() {
    if (dashboardPagingController.itemList != null) {
      dashboardPagingController.itemList!.clear();
    }
    page = 0;
  }

  Future<void> refreshData() async {
    resetPagingControllers();
    dashboardPagingController.removePageRequestListener((pageKey) {});
    initPagingController();
    await getData(page, false);
  }

  Future<void> getData(int pageKey, bool withLoading) async {
    try {
      if (withLoading) {
        updateLoading(false);
      }
      var response = await DashboardService.getDashboards(page);
      if (response.statusCode == 200 && response.dashboards != null) {
        page++;
        final isLastPage =
            response.dashboards!.length < Constants.paginationLimit;
        if (isLastPage) {
          dashboardPagingController.appendLastPage(response.dashboards!);
          updateSelectedDashboard();
        } else {
          final nextPageKey = pageKey + response.dashboards!.length;
          dashboardPagingController.appendPage(
              response.dashboards!, nextPageKey.toInt());
          updateSelectedDashboard();
        }
      }
      CustomSnackbar.showFailure(Get.context!, response.message);
    } catch (error) {
      dashboardPagingController.error = error;
    }
    updateLoading(false);
  }

  void updateSelectedDashboard() {
    dashboardPagingController.itemList?.forEach((element) {
      String? dashboardId = SharedPreferences.getDashboardId();
      if (dashboardId != null && dashboardId == element.id) {
        mainController.selectDashboard(element);
      }
    });
  }

  updateLoading(bool value) {
    loading = value;
    update();
  }
}
