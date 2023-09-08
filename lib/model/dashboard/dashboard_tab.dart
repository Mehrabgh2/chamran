import 'package:chamran/model/widget/dm_widget.dart';
import 'package:get/get.dart';

class DashboardTab {
  DashboardTab({
    this.id,
    this.title,
    this.widgets,
  });

  String? id;
  String? title;
  RxList<DMWidget?>? widgets;
}
