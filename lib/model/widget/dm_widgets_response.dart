import 'dart:convert';

import 'package:chamran/model/widget/dm_widget.dart';

DMWidgetsResponse dMWidgetsResponseFromJson(String str) =>
    DMWidgetsResponse.fromJson(json.decode(str));

class DMWidgetsResponse {
  List<DMWidget>? widgets;
  int? statusCode;
  DMWidgetsResponse({
    this.widgets,
    this.statusCode,
  });

  factory DMWidgetsResponse.fromJson(Map<String, dynamic> json) {
    List<DMWidget> widgets = List.empty(growable: true);
    int cmdId = 1;
    for (var widgetId
        in (json['result']['configuration']['widgets'] as Map).keys) {
      Map<String, dynamic> widget =
          json['result']['configuration']['widgets'][widgetId];
      widgets.add(DMWidget.fromJson(
          widget, cmdId++, json['result']['configuration']['entityAliases']));
    }
    return DMWidgetsResponse(widgets: widgets);
  }
}
