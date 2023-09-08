import 'package:chamran/model/widget/widget_value.dart';
import 'package:get/state_manager.dart';

class DMWidget {
  String? id;
  String? deviceId;
  String? aliasId;
  int? cmdId;
  String? type;
  String? title;
  int? interval;
  List<DataKey>? dataKeys;
  Rx<WidgetValue>? value;

  DMWidget({
    this.id,
    this.deviceId,
    this.aliasId,
    this.cmdId,
    this.type,
    this.title,
    this.interval,
    this.dataKeys,
    this.value,
  });

  factory DMWidget.fromJson(
      Map<String, dynamic> json, int cmdId, Map<String, dynamic>? aliases) {
    List<DataKey> dataKeys = List.empty(growable: true);
    for (var dataKey
        in List.from(json['config']?['datasources']?[0]?['dataKeys'])) {
      dataKeys.add(DataKey(type: dataKey['type'], key: dataKey['name']));
    }
    String? deviceId =
        aliases?[json['config']?['datasources']?[0]?['entityAliasId']]
            ?['filter']?['entityList']?[0];
    return DMWidget(
      id: json['id'],
      deviceId: deviceId,
      aliasId: json['config']?['datasources']?[0]?['entityAliasId'],
      cmdId: cmdId,
      type: json['type'],
      title: json['title'],
      interval: json['config']?['timewindow']?['history']?['interval'],
      dataKeys: dataKeys,
      value: Rx(WidgetValue()),
    );
  }
}

class DataKey {
  String? type;
  String? key;

  DataKey({this.type, this.key});

  factory DataKey.fromJson(Map<String, dynamic> json) {
    return DataKey(
      type: json['label'] as String?,
      key: json['deviceProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type == 'timeseries'
            ? 'TIME_SERIES'
            : type == 'attributes'
                ? 'ATTRIBUTE'
                : '',
        'key': key,
      };
}
