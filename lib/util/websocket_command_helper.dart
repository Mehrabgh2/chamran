import 'package:chamran/model/widget/dm_widget.dart';
import 'package:chamran/util/fixture.dart';

class WebsocketCommandHelper {
  static Map firstCommand(List<DMWidget> widgets) {
    List widgetsCommands = List.empty(growable: true);
    for (var element in widgets) {
      widgetsCommands.add(Fixture.createInitDashboard(element));
    }
    return Fixture.createFinalInitDashboard(widgetsCommands);
  }

  static Map secondCommand(DMWidget widget) {
    return widget.interval != null
        ? Fixture.createSecondHistoryDashboard(widget)
        : Fixture.createSecondLatestDashboard(widget);
  }
}
