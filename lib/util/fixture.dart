import 'package:chamran/model/widget/dm_widget.dart';

class Fixture {
  static Map<String, dynamic> createWebsocketCommand(String deviceId) => {
        "attrSubCmds": [],
        "tsSubCmds": [
          {
            "entityType": "DEVICE",
            "entityId": deviceId,
            "scope": "LATEST_TELEMETRY",
            "cmdId": 1
          }
        ],
        "historyCmds": [],
        "entityDataCmds": [],
        "entityDataUnsubscribeCmds": [],
        "alarmDataCmds": [],
        "alarmDataUnsubscribeCmds": []
      };

  static Map<String, dynamic> createInitDashboard(DMWidget widget) => {
        "query": {
          "entityFilter": {
            "type": "entityList",
            "resolveMultiple": true,
            "entityType": "DEVICE",
            "entityList": [widget.deviceId]
          },
          "pageLink": {
            "pageSize": 1000,
            "page": 0,
            "sortOrder": {
              "key": {"type": "ENTITY_FIELD", "key": "createdTime"},
              "direction": "DESC"
            }
          },
          "entityFields": [
            {"type": "ENTITY_FIELD", "key": "name"},
            {"type": "ENTITY_FIELD", "key": "label"},
            {"type": "ENTITY_FIELD", "key": "additionalInfo"}
          ],
          "latestValues": widget.dataKeys?.map((e) => e.toJson()).toList()
        },
        "cmdId": widget.cmdId,
      };

  static Map<String, dynamic> createFinalInitDashboard(List widgets) => {
        "attrSubCmds": [],
        "tsSubCmds": [],
        "historyCmds": [],
        "entityDataCmds": widgets,
        "entityDataUnsubscribeCmds": [],
        "alarmDataCmds": [],
        "alarmDataUnsubscribeCmds": []
      };

  static Map<String, dynamic> createSecondLatestDashboard(DMWidget widget) => {
        "attrSubCmds": [],
        "tsSubCmds": [],
        "historyCmds": [],
        "entityDataCmds": [
          {
            'cmdId': widget.cmdId,
            'latestCmd': {
              'keys': widget.dataKeys?.map((e) => e.toJson()).toList()
            }
          }
        ],
        "entityDataUnsubscribeCmds": [],
        "alarmDataCmds": [],
        "alarmDataUnsubscribeCmds": []
      };

  static Map<String, dynamic> createSecondHistoryDashboard(DMWidget widget) => {
        "attrSubCmds": [],
        "tsSubCmds": [],
        "historyCmds": [],
        "entityDataCmds": [
          {
            "cmdId": widget.cmdId,
            "historyCmd": {
              "keys": widget.dataKeys?.map((e) => e.key).toList(),
              "startTs":
                  DateTime.now().millisecondsSinceEpoch - widget.interval!,
              "endTs": DateTime.now().millisecondsSinceEpoch,
              "interval": widget.interval,
              "limit": 25000,
              "agg": "AVG"
            }
          }
        ],
        "entityDataUnsubscribeCmds": [],
        "alarmDataCmds": [],
        "alarmDataUnsubscribeCmds": []
      };
}
