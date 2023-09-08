class WidgetValue {
  int? cmdId;
  List<ValueModel>? values;
  WidgetValue({
    this.cmdId,
    this.values,
  });

  factory WidgetValue.fromJson(Map<String, dynamic> json) {
    return WidgetValue(
      cmdId: json['cmdId'],
      values: (json['data']?['data']?[0]?['latest']?['TIME_SERIES']) == null
          ? ((json['update']?[0]?['latest']?['TIME_SERIES']) == null ||
                  (json['update']?[0]?['latest']?['TIME_SERIES']).isEmpty)
              ? (json['data']?['data']?[0]?['latest']?['ENTITY_FIELD']) == null
                  ? (json['update']?[0]?['latest']?['ENTITY_FIELD']) == null
                      ? null
                      : ((json['update']?[0]?['latest']?['ENTITY_FIELD'] as Map)
                              .keys)
                          .map(
                            (e) => ValueModel.fromJson(
                              json['update']?[0]?['latest']?['ENTITY_FIELD']
                                  ?[e],
                              e,
                            ),
                          )
                          .toList()
                  : ((json['data']?['data']?[0]?['latest']?['ENTITY_FIELD']
                              as Map)
                          .keys)
                      .map(
                        (e) => ValueModel.fromJson(
                          json['data']?['data']?[0]?['latest']?['ENTITY_FIELD']
                              ?[e],
                          e,
                        ),
                      )
                      .toList()
              : (json['update']?[0]?['timeseries'] != null)
                  ? ((json['update']?[0]?['timeseries'] as Map).keys)
                      .map(
                        (e) => ValueModel.fromJson(
                          json['update']?[0]?['timeseries']?[e][0],
                          e,
                        ),
                      )
                      .toList()
                  : ((json['update']?[0]?['latest']?['TIME_SERIES'] as Map)
                          .keys)
                      .map(
                        (e) => ValueModel.fromJson(
                          json['update']?[0]?['latest']?['TIME_SERIES']?[e],
                          e,
                        ),
                      )
                      .toList()
          : ((json['data']?['data']?[0]?['latest']?['TIME_SERIES'] as Map).keys)
              .map(
                (e) => ValueModel.fromJson(
                  json['data']?['data']?[0]?['latest']?['TIME_SERIES']?[e],
                  e,
                ),
              )
              .toList(),
    );
  }
}

class ValueModel {
  String? key;
  int? ts;
  dynamic value;

  ValueModel({
    this.key,
    this.ts,
    this.value,
  });

  factory ValueModel.fromJson(Map<String, dynamic> json, String key) {
    return ValueModel(
      key: key,
      ts: json['ts'],
      value: json['value'],
    );
  }
}
