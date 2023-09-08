import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Device extends Equatable {
  String? id;
  String? createdTime;
  String? name;
  String? label;
  String? deviceProfileName;
  String? deviceProfileId;
  dynamic gateway;
  dynamic customer;
  bool? public;
  String? type;
  String? type2;
  String? description;
  Map? meta;

  Device({
    this.id,
    this.createdTime,
    this.name,
    this.label,
    this.deviceProfileName,
    this.deviceProfileId,
    this.gateway,
    this.customer,
    this.public,
    this.type,
    this.type2,
    this.description,
    this.meta,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json['id'] is Map
            ? json['id']['id'] as String?
            : json['id'] as String?,
        createdTime: json['createdTime'] is int
            ? json['createdTime'].toString()
            : json['createdTime'] as String?,
        name: json['name'] as String?,
        label: json['label'] as String?,
        deviceProfileName: json['deviceProfileName'] as String?,
        deviceProfileId: json['deviceProfileId'] is Map
            ? json['deviceProfileId']['id'] as String?
            : json['deviceProfileId'] as String?,
        gateway: json['gateway'] as dynamic,
        customer: json['customer'] as dynamic,
        public: json['public'] as bool?,
        type: json['type'] as String?,
        type2: json['_type'] as String?,
        description: json['description'] as String?,
        meta: json['metadata'] as Map?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdTime': createdTime,
        'name': name,
        'label': label,
        'deviceProfileName': deviceProfileName,
        'deviceProfileId': deviceProfileId,
        'gateway': gateway,
        'customer': customer,
        'public': public,
        'type': type,
        '_type': type2,
        'description': description,
        'metadata': meta,
      };

  Device copyWith({
    String? id,
    String? createdTime,
    String? name,
    String? label,
    String? deviceProfileName,
    String? deviceProfileId,
    dynamic gateway,
    dynamic customer,
    bool? public,
    String? type,
    String? type2,
    String? description,
    Map? meta,
  }) {
    return Device(
      id: id ?? this.id,
      createdTime: createdTime ?? this.createdTime,
      name: name ?? this.name,
      label: label ?? this.label,
      deviceProfileName: deviceProfileName ?? this.deviceProfileName,
      deviceProfileId: deviceProfileId ?? this.deviceProfileId,
      gateway: gateway ?? this.gateway,
      customer: customer ?? this.customer,
      public: public ?? this.public,
      type: type ?? this.type,
      type2: type2 ?? this.type2,
      description: description ?? this.description,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      createdTime,
      name,
      label,
      deviceProfileName,
      deviceProfileId,
      gateway,
      customer,
      public,
      type,
      type,
      description,
    ];
  }
}
